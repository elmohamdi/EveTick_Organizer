import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:evetick_organizer/core/services/result.dart';
import 'package:evetick_organizer/features/ticket_scan/data/models/scan_event.dart';
import 'package:evetick_organizer/features/ticket_scan/data/models/scan_result.dart';
import 'package:evetick_organizer/features/ticket_scan/data/models/scan_status.dart';
import 'package:evetick_organizer/features/ticket_scan/data/repositories/ticket_scan_repository.dart';
import 'package:evetick_organizer/features/ticket_scan/logic/cubit/ticket_scan_state.dart';
import 'package:evetick_organizer/features/ticket_scan/services/scan_feedback_service.dart';

class TicketScanCubit extends Cubit<TicketScanState> {
  TicketScanCubit(this._repository, this._feedback)
    : super(const TicketScanState());

  static const Duration _bannerDuration = Duration(milliseconds: 2500);

  /// The camera reports the same QR many times per second, so a code that was
  /// just handled is ignored for this long.
  static const Duration _cooldown = Duration(seconds: 3);

  final TicketScanRepository _repository;
  final ScanFeedbackService _feedback;

  Timer? _bannerTimer;
  Timer? _cooldownTimer;
  String? _lastCode;

  Future<void> init() => loadEvents();

  Future<void> loadEvents() async {
    emit(state.copyWith(isLoadingEvents: true));
    final response = await _repository.getScannableEvents();
    if (isClosed) return;

    final events = response.when<List<ScanEvent>?>(
      success: (data) => data,
      failure: (failure) {
        _showResult(
          ScanResult(status: ScanStatus.error, message: failure.message),
        );
        return null;
      },
    );

    if (events == null) {
      emit(state.copyWith(isLoadingEvents: false));
      return;
    }

    final previousId = state.selectedEvent?.id;
    final selected = _pickEvent(events, previousId);
    emit(
      state.copyWith(
        events: events,
        isLoadingEvents: false,
        selectedEvent: selected,
        clearSelectedEvent: selected == null,
        scannedCount: selected?.id == previousId ? state.scannedCount : 0,
      ),
    );

    if (selected != null) await _loadScannedCount(selected.id);
  }

  Future<void> selectEvent(ScanEvent event) async {
    if (event.id == state.selectedEvent?.id) return;
    _resetCooldown();
    emit(
      state.copyWith(selectedEvent: event, scannedCount: 0, clearResult: true),
    );
    await _loadScannedCount(event.id);
  }

  void setSoundEnabled(bool value) => emit(state.copyWith(soundEnabled: value));

  void setVibrateEnabled(bool value) =>
      emit(state.copyWith(vibrateEnabled: value));

  /// Entry point for both the camera and the manual entry field.
  Future<void> onCodeScanned(String rawCode) async {
    final code = rawCode.trim();
    if (code.isEmpty || state.isProcessing || code == _lastCode) return;

    _startCooldown(code);

    final event = state.selectedEvent;
    if (event == null) {
      _showResult(
        const ScanResult(
          status: ScanStatus.error,
          message: 'Select an event before scanning',
        ),
      );
      return;
    }

    emit(state.copyWith(isProcessing: true, clearResult: true));
    final response = await _repository.verifyTicket(
      eventId: event.id,
      code: code,
    );
    if (isClosed) return;

    final scanResult = response.when(
      success: (result) => result,
      failure: (failure) =>
          ScanResult(status: ScanStatus.error, message: failure.message),
    );

    final isVerified = scanResult.status == ScanStatus.verified;
    emit(
      state.copyWith(
        isProcessing: false,
        scannedCount: isVerified ? state.scannedCount + 1 : state.scannedCount,
      ),
    );
    _showResult(scanResult);
    await _playFeedback();
  }

  void dismissResult() {
    _bannerTimer?.cancel();
    if (!isClosed) emit(state.copyWith(clearResult: true));
  }

  ScanEvent? _pickEvent(List<ScanEvent> events, String? previousId) {
    for (final event in events) {
      if (event.id == previousId) return event;
    }
    for (final event in events) {
      if (event.isLive) return event;
    }
    return events.isEmpty ? null : events.first;
  }

  Future<void> _loadScannedCount(String eventId) async {
    final response = await _repository.getScannedCount(eventId);
    if (isClosed || state.selectedEvent?.id != eventId) return;

    final count = response.when<int?>(
      success: (value) => value,
      failure: (failure) {
        _showResult(
          ScanResult(status: ScanStatus.error, message: failure.message),
        );
        return null;
      },
    );
    if (count != null) emit(state.copyWith(scannedCount: count));
  }

  void _showResult(ScanResult result) {
    _bannerTimer?.cancel();
    emit(state.copyWith(result: result));
    _bannerTimer = Timer(_bannerDuration, dismissResult);
  }

  Future<void> _playFeedback() async {
    if (state.soundEnabled) await _feedback.playSound();
    if (state.vibrateEnabled) await _feedback.vibrate();
  }

  void _startCooldown(String code) {
    _cooldownTimer?.cancel();
    _lastCode = code;
    _cooldownTimer = Timer(_cooldown, () => _lastCode = null);
  }

  void _resetCooldown() {
    _cooldownTimer?.cancel();
    _lastCode = null;
  }

  @override
  Future<void> close() {
    _bannerTimer?.cancel();
    _cooldownTimer?.cancel();
    return super.close();
  }
}
