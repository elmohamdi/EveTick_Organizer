import 'package:evetick_organizer/features/ticket_scan/data/models/scan_status.dart';

class ScanResult {
  const ScanResult({
    required this.status,
    this.attendeeName,
    this.ticketType,
    this.message,
    this.noEventSelected = false,
  });

  final ScanStatus status;
  final String? attendeeName;
  final String? ticketType;

  /// Human readable detail, used for [ScanStatus.error].
  final String? message;

  /// The user tried to scan without choosing an event; the UI shows a
  /// translated message for it.
  final bool noEventSelected;
}
