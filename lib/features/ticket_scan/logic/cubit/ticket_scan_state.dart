import 'package:evetick_organizer/features/ticket_scan/data/models/scan_event.dart';
import 'package:evetick_organizer/features/ticket_scan/data/models/scan_result.dart';

class TicketScanState {
  const TicketScanState({
    this.soundEnabled = true,
    this.vibrateEnabled = true,
    this.events = const [],
    this.selectedEvent,
    this.isLoadingEvents = false,
    this.scannedCount = 0,
    this.isProcessing = false,
    this.result,
  });

  final bool soundEnabled;
  final bool vibrateEnabled;
  final List<ScanEvent> events;
  final ScanEvent? selectedEvent;
  final bool isLoadingEvents;
  final int scannedCount;
  final bool isProcessing;

  /// Last outcome. Non-null only while the result banner is visible.
  final ScanResult? result;

  int get totalExpected => selectedEvent?.totalExpected ?? 0;

  TicketScanState copyWith({
    bool? soundEnabled,
    bool? vibrateEnabled,
    List<ScanEvent>? events,
    ScanEvent? selectedEvent,
    bool? isLoadingEvents,
    int? scannedCount,
    bool? isProcessing,
    ScanResult? result,
    bool clearSelectedEvent = false,
    bool clearResult = false,
  }) {
    return TicketScanState(
      soundEnabled: soundEnabled ?? this.soundEnabled,
      vibrateEnabled: vibrateEnabled ?? this.vibrateEnabled,
      events: events ?? this.events,
      selectedEvent: clearSelectedEvent
          ? null
          : (selectedEvent ?? this.selectedEvent),
      isLoadingEvents: isLoadingEvents ?? this.isLoadingEvents,
      scannedCount: scannedCount ?? this.scannedCount,
      isProcessing: isProcessing ?? this.isProcessing,
      result: clearResult ? null : (result ?? this.result),
    );
  }
}
