import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evetick_organizer/core/services/failure.dart';
import 'package:evetick_organizer/core/services/firebase_error_handler.dart';
import 'package:evetick_organizer/core/services/result.dart';
import 'package:evetick_organizer/features/notifications/data/models/app_notification.dart';
import 'package:evetick_organizer/features/notifications/data/repositories/notifications_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

/// Firestore implementation.
///
/// users/{uid}/organizer_notifications/{notificationId}
///   (NOT `users/{uid}/notifications`: that collection belongs to the client
///   app and has its own schema and rules)
///     type:       String     (NotificationType.key)
///     eventId:    String
///     eventTitle: String
///     actorName:  String?    (buyer / invited organizer)
///     ticketName: String?    (ticketPurchased only)
///     createdAt:  Timestamp  (server timestamp)
///     isRead:     bool
///
/// Documents are *created by Cloud Functions only* (see
/// `backend/functions/notifications.js`); the app only reads them and flips
/// `isRead` to true. Ordering by a single field needs no composite index.
class NotificationsRepositoryImpl implements NotificationsRepository {
  NotificationsRepositoryImpl({
    required FirebaseFirestore firestore,
    required FirebaseAuth auth,
  }) : _firestore = firestore,
       _auth = auth;

  final FirebaseFirestore _firestore;
  final FirebaseAuth _auth;

  /// Only the latest notifications are kept live; older ones aren't needed
  /// and this keeps the read cost of every new snapshot flat.
  static const int _limit = 50;

  CollectionReference<Map<String, dynamic>>? _collection() {
    final uid = _auth.currentUser?.uid;
    if (uid == null) return null;
    return _firestore
        .collection('users')
        .doc(uid)
        .collection('organizer_notifications');
  }

  @override
  Stream<Result<List<AppNotification>>> watchNotifications() {
    final collection = _collection();
    if (collection == null) {
      return Stream.value(
        Result.failure(FirebaseFailure('You must be logged in')),
      );
    }

    return collection
        .orderBy('createdAt', descending: true)
        .limit(_limit)
        .snapshots()
        .map<Result<List<AppNotification>>>((snapshot) {
          final notifications = <AppNotification>[];
          for (final doc in snapshot.docs) {
            final notification = AppNotification.tryParse(doc.id, doc.data());
            if (notification != null) notifications.add(notification);
          }
          return Result.success(notifications);
        })
        .transform(
          StreamTransformer<
            Result<List<AppNotification>>,
            Result<List<AppNotification>>
          >.fromHandlers(
            handleError: (error, stackTrace, sink) {
              debugPrint('Notifications stream error: $error\n$stackTrace');
              sink.add(Result.failure(_failureOf(error)));
            },
          ),
        );
  }

  @override
  Future<Result<void>> markAsRead(String id) async {
    final collection = _collection();
    if (collection == null) {
      return Result.failure(FirebaseFailure('You must be logged in'));
    }

    try {
      await collection.doc(id).update({'isRead': true});
      return const Result.success(null);
    } catch (e, stackTrace) {
      debugPrint('Notifications markAsRead error: $e\n$stackTrace');
      return Result.failure(_failureOf(e));
    }
  }

  @override
  Future<Result<void>> markAllAsRead(Iterable<String> ids) async {
    final collection = _collection();
    if (collection == null) {
      return Result.failure(FirebaseFailure('You must be logged in'));
    }

    final unread = ids.toList();
    if (unread.isEmpty) return const Result.success(null);

    try {
      // The list is capped at [_limit], far below the 500-writes batch limit.
      final batch = _firestore.batch();
      for (final id in unread) {
        batch.update(collection.doc(id), {'isRead': true});
      }
      await batch.commit();
      return const Result.success(null);
    } catch (e, stackTrace) {
      debugPrint('Notifications markAllAsRead error: $e\n$stackTrace');
      return Result.failure(_failureOf(e));
    }
  }

  Failure _failureOf(Object error) {
    if (error is FirebaseException) {
      return FirebaseErrorHandler.handleFirestore(error);
    }
    return FirebaseErrorHandler.handleGeneric(error);
  }
}
