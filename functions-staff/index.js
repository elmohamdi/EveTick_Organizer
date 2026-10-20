/**
 * Staff invitations for Evetick Organizer.
 *
 * Firestore shape (written by the Flutter app, see event_staff_repository_impl.dart):
 *   events/{eventId}/staff/{lower-cased email}
 *     name, email, role, permissions{key: bool}, status: 'pending' | 'active',
 *     invitedBy (uid), invitedAt
 *
 * Callables (region MUST match `kFunctionsRegion` in the Flutter app):
 *   getMyStaffAccess      -> { invitations: [...], assignments: [...] }
 *   respondToStaffInvite  -> { eventId, accept } => accepts or declines an invite
 *
 * Both only ever act on the signed-in user's own e-mail (taken from the auth
 * token, never from the request body).
 */
const { onCall, HttpsError } = require("firebase-functions/v2/https");
const logger = require("firebase-functions/logger");
const { initializeApp } = require("firebase-admin/app");
const { getFirestore, FieldValue } = require("firebase-admin/firestore");

initializeApp();
const db = getFirestore();

const REGION = "us-central1";

// The app already refuses to log in unverified e-mails, so this only blocks
// someone who signed up with an e-mail address they don't own.
const REQUIRE_VERIFIED_EMAIL = true;

// Fields of the event document copied to the "My Events" card.
const EVENT_SUMMARY_FIELDS = [
  "eventTitle",
  "coverImageUrl",
  "startAt",
  "endAt",
  "status",
  "eventLocation",
  "eventCategory",
  "isOnlineEvent",
];

function authedUser(request) {
  if (!request.auth) {
    throw new HttpsError("unauthenticated", "You must be logged in");
  }
  const token = request.auth.token;
  const email = String(token.email || "").trim().toLowerCase();
  if (!email) {
    throw new HttpsError(
      "failed-precondition",
      "Your account has no e-mail address"
    );
  }
  return {
    uid: request.auth.uid,
    email,
    verified: token.email_verified === true,
  };
}

function plainValue(value) {
  // Firestore Timestamps can't cross the callable boundary as-is.
  if (value && typeof value.toDate === "function") {
    return value.toDate().toISOString();
  }
  return value === undefined ? null : value;
}

function eventSummary(eventId, data) {
  const summary = { eventId };
  for (const field of EVENT_SUMMARY_FIELDS) {
    if (data[field] !== undefined) summary[field] = plainValue(data[field]);
  }
  return summary;
}

function cleanPermissions(raw) {
  const out = {};
  if (raw && typeof raw === "object") {
    for (const [key, value] of Object.entries(raw)) out[key] = value === true;
  }
  return out;
}

async function inviterNames(uids) {
  const names = new Map();
  await Promise.all(
    [...uids].map(async (uid) => {
      try {
        const doc = await db.collection("users").doc(uid).get();
        const name = doc.exists ? doc.get("name") : null;
        if (typeof name === "string" && name.trim()) names.set(uid, name.trim());
      } catch (error) {
        logger.warn("inviter lookup failed", { uid, error: String(error) });
      }
    })
  );
  return names;
}

exports.getMyStaffAccess = onCall({ region: REGION }, async (request) => {
  const { email, verified } = authedUser(request);

  // Quiet "nothing for you" instead of an error banner on every screen.
  if (REQUIRE_VERIFIED_EMAIL && !verified) {
    return { invitations: [], assignments: [] };
  }

  // Needs a collection-group index on staff.email. Until it exists Firestore
  // throws FAILED_PRECONDITION with a "create index" link in the message, which
  // we log so it shows up in `firebase functions:log`.
  let snapshot;
  try {
    snapshot = await db
      .collectionGroup("staff")
      .where("email", "==", email)
      .get();
  } catch (error) {
    logger.error("staff collectionGroup query failed", {
      code: error.code,
      message: String(error.message || error),
    });
    if (error.code === 9) {
      throw new HttpsError(
        "failed-precondition",
        "Staff invitations are being set up, try again in a few minutes"
      );
    }
    throw new HttpsError("internal", "Could not load staff access");
  }

  // Only events/{id}/staff/{doc}; ignore any other collection called "staff".
  const entries = snapshot.docs
    .filter((doc) => doc.ref.parent.parent?.parent?.id === "events")
    .map((doc) => ({ doc, eventId: doc.ref.parent.parent.id }));

  if (entries.length === 0) return { invitations: [], assignments: [] };

  const eventDocs = await db.getAll(
    ...entries.map((entry) => db.collection("events").doc(entry.eventId))
  );
  const eventsById = new Map(
    eventDocs.filter((d) => d.exists).map((d) => [d.id, d.data()])
  );

  const names = await inviterNames(
    new Set(
      entries
        .filter(({ doc }) => doc.get("status") !== "active")
        .map(({ doc }) => doc.get("invitedBy"))
        .filter((uid) => typeof uid === "string" && uid)
    )
  );

  const invitations = [];
  const assignments = [];

  for (const { doc, eventId } of entries) {
    const event = eventsById.get(eventId);
    if (!event) continue; // event was deleted, nothing to show

    const role = doc.get("role") || "gateStaff";
    const permissions = cleanPermissions(doc.get("permissions"));

    if (doc.get("status") === "active") {
      assignments.push({
        event: eventSummary(eventId, event),
        role,
        permissions,
      });
    } else {
      invitations.push({
        eventId,
        eventTitle: event.eventTitle || "Untitled event",
        inviterName: names.get(doc.get("invitedBy")) || "An organizer",
        role,
        permissions,
        coverImageUrl: event.coverImageUrl || null,
      });
    }
  }

  return { invitations, assignments };
});

exports.respondToStaffInvite = onCall({ region: REGION }, async (request) => {
  const { uid, email, verified } = authedUser(request);
  if (REQUIRE_VERIFIED_EMAIL && !verified) {
    throw new HttpsError(
      "failed-precondition",
      "Please verify your e-mail first"
    );
  }

  const { eventId, accept } = request.data || {};
  if (
    typeof eventId !== "string" ||
    eventId.length === 0 ||
    eventId.includes("/") ||
    typeof accept !== "boolean"
  ) {
    throw new HttpsError("invalid-argument", "Invalid request");
  }

  const ref = db.collection("events").doc(eventId).collection("staff").doc(email);

  await db.runTransaction(async (transaction) => {
    const snap = await transaction.get(ref);
    if (!snap.exists) {
      throw new HttpsError("not-found", "This invitation no longer exists");
    }

    const status = snap.get("status");
    if (status === "active") {
      if (accept) return; // already joined, accepting again is a no-op
      throw new HttpsError(
        "failed-precondition",
        "You already joined this event"
      );
    }

    if (accept) {
      transaction.update(ref, {
        status: "active",
        uid,
        acceptedAt: FieldValue.serverTimestamp(),
      });
    } else {
      transaction.delete(ref);
    }
  });

  return { ok: true };
});