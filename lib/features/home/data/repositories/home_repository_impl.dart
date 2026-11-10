import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evetick_organizer/core/services/failure.dart';
import 'package:evetick_organizer/core/services/firebase_error_handler.dart';
import 'package:evetick_organizer/core/services/result.dart';
import 'package:evetick_organizer/features/event_dashboard/data/models/event_dashboard.dart';
import 'package:evetick_organizer/features/event_dashboard/data/repositories/event_dashboard_repository.dart';
import 'package:evetick_organizer/features/home/data/models/home_overview.dart';
import 'package:evetick_organizer/features/home/data/repositories/home_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

/// Builds the home overview from the events the organizer owns.
///
/// The per-event numbers (sold / revenue / checked-in) come from
/// [EventDashboardRepository], so the counting logic lives in one place and
/// the home screen can never disagree with an event's own dashboard.
///
/// Cost: one count aggregation per ticket tier (+1 for check-ins) per event.
class HomeRepositoryImpl implements HomeRepository {
  HomeRepositoryImpl({
    required FirebaseFirestore firestore,
    required FirebaseAuth auth,
    required EventDashboardRepository dashboardRepository,
  }) : _firestore = firestore,
       _auth = auth,
       _dashboardRepository = dashboardRepository;

  final FirebaseFirestore _firestore;
  final FirebaseAuth _auth;
  final EventDashboardRepository _dashboardRepository;

  @override
  Future<Result<HomeOverview>> getOverview() async {
    try {
      final uid = _auth.currentUser?.uid;
      if (uid == null) {
        return Result.failure(FirebaseFailure('You must be logged in'));
      }

      final snapshot = await _firestore
          .collection('events')
          .where('organizerId', isEqualTo: uid)
          .get();

      final results = await Future.wait([
        for (final doc in snapshot.docs) _dashboardRepository.getDashboard(doc.id),
      ]);

      // One broken event must not blank the whole home screen.
      final events = <EventDashboard>[];
      for (final result in results) {
        result.when(
          success: (dashboard) {
            events.add(dashboard);
          },
          failure: (failure) {
            debugPrint('Home overview skipped an event: ${failure.message}');
          },
        );
      }

      return Result.success(HomeOverview(events: events));
    } on FirebaseException catch (e) {
      debugPrint('HomeOverview FirebaseException: ${e.code} ${e.message}');
      return Result.failure(FirebaseErrorHandler.handleFirestore(e));
    } catch (e, stackTrace) {
      debugPrint('HomeOverview error: $e\n$stackTrace');
      return Result.failure(FirebaseErrorHandler.handleGeneric(e));
    }
  }
}
