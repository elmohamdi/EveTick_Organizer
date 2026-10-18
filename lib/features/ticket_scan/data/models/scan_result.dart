import 'package:evetick_organizer/features/ticket_scan/data/models/scan_status.dart';

class ScanResult {
  const ScanResult({
    required this.status,
    this.attendeeName,
    this.ticketType,
    this.message,
  });

  final ScanStatus status;
  final String? attendeeName;
  final String? ticketType;

  /// Human readable detail, used for [ScanStatus.error].
  final String? message;
}
