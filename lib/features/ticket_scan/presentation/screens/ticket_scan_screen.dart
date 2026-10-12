import 'package:evetick_organizer/core/helpers/spacing.dart';
import 'package:evetick_organizer/core/theming/extensions/build_context_extension.dart';
import 'package:evetick_organizer/features/ticket_scan/presentation/widgets/manual_entry_field.dart';
import 'package:evetick_organizer/features/ticket_scan/presentation/widgets/manual_entry_header.dart';
import 'package:evetick_organizer/features/ticket_scan/presentation/widgets/scan_header_app_bar.dart';
import 'package:evetick_organizer/features/ticket_scan/presentation/widgets/scan_quick_settings.dart';
import 'package:evetick_organizer/features/ticket_scan/presentation/widgets/scan_stats_section.dart';
import 'package:evetick_organizer/features/ticket_scan/presentation/widgets/scan_viewfinder.dart';
import 'package:evetick_organizer/features/ticket_scan/presentation/widgets/ticket_verified_banner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TicketScanScreen extends StatefulWidget {
  final String eventTitle;

  const TicketScanScreen({
    super.key,
    this.eventTitle = 'Summer Music Festival 2024',
  });

  @override
  State<TicketScanScreen> createState() => _TicketScanScreenState();
}

class _TicketScanScreenState extends State<TicketScanScreen> {
  late final TextEditingController _codeController;

  bool _isFlashOn = false;
  bool _isSoundOn = true;
  bool _isVibrateOn = true;
  bool _isBannerVisible = true;
  int _scannedCount = 428;
  final int _totalExpected = 1250;
  String _attendeeName = 'John Doe';
  String _ticketTier = 'VIP Access';

  @override
  void initState() {
    super.initState();
    _codeController = TextEditingController();
  }

  @override
  void dispose() {
    _codeController.dispose();
    super.dispose();
  }

  void _onManualCodeSubmitted(String code) {
    final trimmedCode = code.trim();
    if (trimmedCode.isEmpty) return;

    FocusScope.of(context).unfocus();
    _codeController.clear();

    setState(() {
      _scannedCount++;
      _attendeeName = 'Pass #$trimmedCode';
      _ticketTier = 'Verified Entry';
      _isBannerVisible = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.darkBlue,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              verticalSpace(8),

              // Animated Verified Banner
              AnimatedCrossFade(
                duration: const Duration(milliseconds: 300),
                crossFadeState: _isBannerVisible
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
                firstChild: Padding(
                  padding: EdgeInsets.only(bottom: 12.h),
                  child: TicketVerifiedBanner(
                    title: 'Ticket Verified',
                    subtitle: '$_attendeeName • $_ticketTier',
                    onDismiss: () {
                      setState(() {
                        _isBannerVisible = false;
                      });
                    },
                  ),
                ),
                secondChild: const SizedBox.shrink(),
              ),

              // Top Bar with Back, Title, and Flashlight buttons
              ScanHeaderAppBar(
                title: 'Scan Tickets',
                subtitle: widget.eventTitle,
                isFlashOn: _isFlashOn,
                onFlashToggle: () {
                  setState(() {
                    _isFlashOn = !_isFlashOn;
                  });
                },
              ),

              verticalSpace(14),

              // Scanner Viewfinder
              const ScanViewfinder(
                frameSize: 240,
                isScanning: true,
              ),

              verticalSpace(20),

              // Manual Entry Section
              const ManualEntryHeader(),
              verticalSpace(8),
              ManualEntryField(
                controller: _codeController,
                onSubmitted: _onManualCodeSubmitted,
              ),

              verticalSpace(14),

              // Quick Settings (Sound & Vibrate)
              ScanQuickSettings(
                soundEnabled: _isSoundOn,
                onSoundChanged: (val) {
                  setState(() {
                    _isSoundOn = val;
                  });
                },
                vibrateEnabled: _isVibrateOn,
                onVibrateChanged: (val) {
                  setState(() {
                    _isVibrateOn = val;
                  });
                },
              ),

              verticalSpace(22),

              // Bottom Stats Section
              ScanStatsSection(
                scannedCount: '$_scannedCount',
                totalExpectedCount: '$_totalExpected',
              ),

              // Bottom padding so items are not hidden behind floating navbar
              verticalSpace(90),
            ],
          ),
        ),
      ),
    );
  }
}
