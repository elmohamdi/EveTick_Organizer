/**
 * Notification documents read by the app's Notifications screen:
 *
 *   users/{uid}/organizer_notifications/{id}
 *     (NOT users/{uid}/notifications: that collection belongs to the client app)
 *     type:        'ticketPurchased' | 'staffAccepted' | 'staffDeclined' | 'eventLive'
 *     eventId, eventTitle, actorName?, ticketName?, ticketCount?
 *     createdAt:   server timestamp
 *     isRead:      false
 *
 * Only DATA is stored (never display text): the app localizes it.
 *
 * Ticket-purchase notifications are written by `onOrderConfirmed` (orders.js).
 *
 * Already wired in index.js (onOrderConfirmed, notifyEventLive) and in
 * respondToStaffInvite (notifyStaffResponse).
 */
const { onDocumentUpdated } = require('firebase-functions/v2/firestore');
const { getFirestore, FieldValue } = require('firebase-admin/firestore');

// Firestore triggers must run in the same location as your Firestore database
// (your database is in nam5 -> 'us-central1' is correct).
const TRIGGER_REGION = 'us-central1';

const ALREADY_EXISTS = 6;

/**
 * [id] makes the write idempotent (triggers are delivered at-least-once, so a
 * retry must not create a second notification or reset `isRead`). Without an id
 * a new document is added.
 */
async function writeNotification(uid, id, data) {
  if (!uid) return;
  const collection = getFirestore().collection('users').doc(uid).collection('organizer_notifications');
  const payload = { ...data, isRead: false, createdAt: FieldValue.serverTimestamp() };
  try {
    if (id) await collection.doc(id).create(payload);
    else await collection.add(payload);
  } catch (error) {
    if (error.code !== ALREADY_EXISTS) throw error;
  }
}

/** status went to 'live' -> tell the organizer (once per event). */
exports.notifyEventLive = onDocumentUpdated(
  { document: 'events/{eventId}', region: TRIGGER_REGION },
  async (event) => {
    const before = event.data && event.data.before.data();
    const after = event.data && event.data.after.data();
    if (!before || !after) return;
    if (before.status === 'live' || after.status !== 'live') return;
    if (!after.organizerId) return;

    const { eventId } = event.params;
    await writeNotification(after.organizerId, `live_${eventId}`, {
      type: 'eventLive',
      eventId,
      eventTitle: after.eventTitle || '',
    });
  },
);

/**
 * Call this from the existing `respondToStaffInvite` callable, right after the
 * invitation was accepted / declined. It has to be called from there because
 * that is the only place that knows it was an answer: a trigger on
 * events/{id}/staff/{email} can't tell "declined" from "the organizer
 * cancelled the invitation" (both look like a deleted document).
 *
 *   const staffSnap = await staffRef.get();           // read BEFORE you delete/update it
 *   ...
 *   await notifyStaffResponse({ eventId, staff: staffSnap.data(), accepted: data.accept });
 */
async function notifyStaffResponse({ eventId, staff, accepted }) {
  if (!staff || !staff.invitedBy) return;

  const eventSnap = await getFirestore().collection('events').doc(eventId).get();
  const eventData = eventSnap.data() || {};

  await writeNotification(staff.invitedBy, null, {
    type: accepted ? 'staffAccepted' : 'staffDeclined',
    eventId,
    eventTitle: eventData.eventTitle || '',
    actorName: staff.name || staff.email || null,
  });
}

exports.writeNotification = writeNotification;
exports.notifyStaffResponse = notifyStaffResponse;
