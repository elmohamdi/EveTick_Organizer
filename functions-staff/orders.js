/**
 * Turns a confirmed client order into (1) the organizer's sales numbers and
 * (2) a "ticket purchased" notification.
 *
 *   orders/{orderId}                      written by the client app / Paymob webhook
 *   events/{eventId}/analytics/summary    sales numbers, PRIVATE to organizer + staff
 *       revenue:   number                 sum of `subtotal` (no taxes / service fee)
 *       tierSales: { "<tierIndex>": n }   tickets sold per tier
 *       updatedAt: timestamp
 *   events/{eventId}/processedOrders/{orderId}   marker -> each order counts once
 *
 * Why a separate summary document and not fields on the event: event documents
 * are readable by every client, revenue must not be.
 *
 * `applyOrderToStats` is idempotent (marker + transaction), so it is safe for
 * trigger retries, for running the backfill script at any time, and for both
 * running together.
 */
const { onDocumentWritten } = require('firebase-functions/v2/firestore');
const { getFirestore, FieldValue } = require('firebase-admin/firestore');
const { writeNotification } = require('./notifications');

const TRIGGER_REGION = 'us-central1';
const CONFIRMED = 'confirmed';

function asNumber(value) {
  const n = Number(value);
  return Number.isFinite(n) ? n : 0;
}

/**
 * Adds a confirmed order to its event's summary, once.
 * Returns true if the order was counted now, false if it was counted before
 * (or has nothing to count).
 */
async function applyOrderToStats(orderId, order) {
  if (!order || order.status !== CONFIRMED || !order.eventId) return false;

  const db = getFirestore();
  const eventRef = db.collection('events').doc(order.eventId);
  const markerRef = eventRef.collection('processedOrders').doc(orderId);
  const summaryRef = eventRef.collection('analytics').doc('summary');

  const tierSales = {};
  // Same tier twice in one order: sum the quantities before incrementing.
  const quantities = {};
  for (const tier of Array.isArray(order.tiers) ? order.tiers : []) {
    const index = Number(tier && tier.tierIndex);
    const quantity = asNumber(tier && tier.quantity);
    if (!Number.isInteger(index) || index < 0 || quantity <= 0) continue;
    quantities[String(index)] = (quantities[String(index)] || 0) + quantity;
  }
  for (const key of Object.keys(quantities)) {
    tierSales[key] = FieldValue.increment(quantities[key]);
  }

  return db.runTransaction(async (tx) => {
    const marker = await tx.get(markerRef);
    if (marker.exists) return false;

    tx.create(markerRef, { processedAt: FieldValue.serverTimestamp() });
    tx.set(
      summaryRef,
      {
        revenue: FieldValue.increment(asNumber(order.subtotal)),
        tierSales,
        updatedAt: FieldValue.serverTimestamp(),
      },
      { merge: true },
    );
    return true;
  });
}

/** An order became `confirmed` (paid). */
exports.onOrderConfirmed = onDocumentWritten(
  { document: 'orders/{orderId}', region: TRIGGER_REGION },
  async (event) => {
    const before = event.data.before.exists ? event.data.before.data() : null;
    const after = event.data.after.exists ? event.data.after.data() : null;
    if (!after || after.status !== CONFIRMED) return;
    if (before && before.status === CONFIRMED) return; // unrelated edit

    const { orderId } = event.params;
    const counted = await applyOrderToStats(orderId, after);
    if (!counted) return; // already handled by an earlier delivery / the backfill

    const eventSnap = await getFirestore().collection('events').doc(after.eventId).get();
    const eventData = eventSnap.data();
    if (!eventData || !eventData.organizerId) return;

    const tickets = Array.isArray(after.tickets) ? after.tickets : [];
    const names = [...new Set(tickets.map((t) => t && t.ticketName).filter(Boolean))];

    await writeNotification(eventData.organizerId, `order_${orderId}`, {
      type: 'ticketPurchased',
      eventId: after.eventId,
      eventTitle: eventData.eventTitle || after.eventTitle || '',
      actorName: after.attendeeName || null,
      ticketName: names.length ? names.join(', ') : null,
      ticketCount: Math.max(1, asNumber(after.ticketCount) || 1),
    });
  },
);

exports.applyOrderToStats = applyOrderToStats;
