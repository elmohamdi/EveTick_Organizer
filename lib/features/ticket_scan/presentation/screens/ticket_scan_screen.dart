import 'package:evetick_organizer/core/helpers/spacing.dart';
import 'package:evetick_organizer/core/theming/extensions/build_context_extension.dart';
import 'package:evetick_organizer/features/ticket_scan/logic/cubit/ticket_scan_cubit.dart';
import 'package:evetick_organizer/features/ticket_scan/presentation/widgets/scan_event_picker_sheet.dart';
import 'package:evetick_organizer/features/ticket_scan/presentation/widgets/scan_header_app_bar.dart';
import 'package:evetick_organizer/features/ticket_scan/presentation/widgets/scan_quick_settings.dart';
import 'package:evetick_organizer/features/ticket_scan/presentation/widgets/scan_result_overlay.dart';
import 'package:evetick_organizer/features/ticket_scan/presentation/widgets/scan_stats_section.dart';
import 'package:evetick_organizer/features/ticket_scan/presentation/widgets/scan_viewfinder.dart';
import 'package:evetick_organizer/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

/// Requires a [TicketScanCubit] above it in the tree.
class TicketScanScreen extends StatefulWidget {
  /// Called by the back button. When null the screen simply pops (use this
  /// when the screen is pushed as a route; the bottom-nav tab passes a
  /// callback that returns to the home tab).
  final VoidCallback? onBack;

  const TicketScanScreen({super.key, this.onBack});

  @override
  State<TicketScanScreen> createState() => _TicketScanScreenState();
}

class _TicketScanScreenState extends State<TicketScanScreen> {
  late final TextEditingController _codeController;
  late final MobileScannerController _scannerController;

  @override
  void initState() {
    super.initState();
    _codeController = TextEditingController();
    _scannerController = MobileScannerController(
      formats: const [BarcodeFormat.qrCode],
      detectionSpeed: DetectionSpeed.noDuplicates,
    );
  }

  @override
  void dispose() {
    _codeController.dispose();
    _scannerController.dispose();
    super.dispose();
  }

  void _onDetect(BarcodeCapture capture) {
    final code = capture.barcodes
        .map((barcode) => barcode.rawValue)
        .whereType<String>()
        .firstOrNull;
    if (code == null) return;
    context.read<TicketScanCubit>().onCodeScanned(code);
  }

  void _showEventPicker() {
    final cubit = context.read<TicketScanCubit>()..loadEvents();
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: context.colors.darkBlue,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
      ),
      builder: (_) =>
          BlocProvider.value(value: cubit, child: const ScanEventPickerSheet()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final eventSubtitle = context.select((TicketScanCubit cubit) {
      final state = cubit.state;
      return state.selectedEvent?.title ??
          (state.isLoadingEvents
              ? l10n.scanLoadingEvents
              : l10n.scanSelectAnEvent);
    });
    final isScanning = context.select(
      (TicketScanCubit cubit) => !cubit.state.isProcessing,
    );

    return Scaffold(
      backgroundColor: context.colors.darkBlue,
      body: Stack(
        children: [
          SafeArea(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  verticalSpace(8),
                  ValueListenableBuilder<MobileScannerState>(
                    valueListenable: _scannerController,
                    builder: (context, scannerState, _) {
                      final torchState = scannerState.torchState;
                      return ScanHeaderAppBar(
                        subtitle: eventSubtitle,
                        isFlashOn: torchState == TorchState.on,
                        onFlashToggle: torchState == TorchState.unavailable
                            ? null
                            : _scannerController.toggleTorch,
                        onSubtitleTap: _showEventPicker,
                      );
                    },
                  ),
                  verticalSpace(14),
                  ScanViewfinder(
                    controller: _scannerController,
                    onDetect: _onDetect,
                    isScanning: isScanning,
                  ),
                  verticalSpace(20),
                  const ScanQuickSettings(),
                  verticalSpace(22),
                  const ScanStatsSection(),
                  verticalSpace(16),
                ],
              ),
            ),
          ),
          const ScanResultOverlay(),
        ],
      ),
    );
  }
}
