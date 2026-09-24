import 'package:cloud_firestore/cloud_firestore.dart';

class PendingEventsRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Map<String, dynamic>>> getPendingEvents() async {
    try {
      final snapshot = await _firestore
          .collection('events')
          .where('status', whereIn: ['pending', 'live'])
          .get();
      return snapshot.docs.map((doc) => doc.data()).toList();
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
