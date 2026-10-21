/**
 * One-off: builds events/{id}/analytics/summary from the confirmed orders that
 * existed BEFORE `onOrderConfirmed` was deployed. Safe to run more than once
 * and while the function is live (every order is counted exactly once).
 * It does not create notifications.
 *
 *   cd functions
 *   export GOOGLE_APPLICATION_CREDENTIALS=/path/to/service-account.json
 *   node backfill_sales_stats.js
 */
const { initializeApp } = require('firebase-admin/app');
const { getFirestore } = require('firebase-admin/firestore');

initializeApp();

// Required after initializeApp().
const { applyOrderToStats } = require('./orders');

async function main() {
  const snapshot = await getFirestore().collection('orders').where('status', '==', 'confirmed').get();
  let counted = 0;
  let skipped = 0;

  for (const doc of snapshot.docs) {
    const applied = await applyOrderToStats(doc.id, doc.data());
    if (applied) counted += 1;
    else skipped += 1;
  }
  console.log(`Orders counted: ${counted}, already counted / skipped: ${skipped}`);
}

main().catch((error) => {
  console.error(error);
  process.exit(1);
});
