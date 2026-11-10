import 'package:evetick_organizer/core/services/result.dart';
import 'package:evetick_organizer/features/ticket_scan/data/models/scan_event.dart';
import 'package:evetick_organizer/features/ticket_scan/data/models/scan_result.dart';

abstract class TicketScanRepository {
  Future<Result<List<ScanEvent>>> getScannableEvents();

  Future<Result<int>> getScannedCount(String eventId);

  /// Validates [code] for [eventId] and, when it is valid and not used yet,
  /// marks it as checked in (atomically, so one ticket can never get in twice).
  Future<Result<ScanResult>> verifyTicket({
    required String eventId,
    required String code,
  });
}
