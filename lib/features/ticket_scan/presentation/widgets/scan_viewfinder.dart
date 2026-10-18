import 'package:evetick_organizer/core/helpers/spacing.dart';
import 'package:evetick_organizer/core/theming/colors.dart';
import 'package:evetick_organizer/features/ticket_scan/presentation/widgets/scan_camera_error.dart';
import 'package:evetick_organizer/features/ticket_scan/presentation/widgets/scan_instruction_pill.dart';
import 'package:evetick_organizer/features/ticket_scan/presentation/widgets/scan_reticle_painter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ScanViewfinder extends StatefulWidget {
  final MobileScannerController controller;
  final ValueChanged<BarcodeCapture> onDetect;
  final double frameSize;
  final bool isScanning;

  const ScanViewfinder({
    super.key,
    required this.controller,
    required this.onDetect,
    this.frameSize = 240,
    this.isScanning = true,
  });

  @override
  State<ScanViewfinder> createState() => _ScanViewfinderState();
}

class _ScanViewfinderState extends State<ScanViewfinder>
    with SingleTickerProviderStateMixin {
  late final AnimationController _laserController;
  late final Animation<double> _laserAnimation;

  @override
  void initState() {
    super.initState();
    _laserController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2200),
    );

    _laserAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _laserController, curve: Curves.easeInOut),
    );

    if (widget.isScanning) {
      _laserController.repeat(reverse: true);
    }
  }

  @override
  void didUpdateWidget(covariant ScanViewfinder oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isScanning != oldWidget.isScanning) {
      if (widget.isScanning) {
        _laserController.repeat(reverse: true);
      } else {
        _laserController.stop();
      }
    }
  }

  @override
  void dispose() {
    _laserController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double boxSize = widget.frameSize.w;

    return ValueListenableBuilder<MobileScannerState>(
      valueListenable: widget.controller,
      builder: (context, scannerState, _) {
        final cameraError = scannerState.error;

        return Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Live camera preview
              ClipRRect(
                borderRadius: BorderRadius.circular(24.r),
                child: SizedBox(
                  width: double.infinity,
                  height: 330.h,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      const ColoredBox(color: Colors.black),
                      MobileScanner(
                        controller: widget.controller,
                        onDetect: widget.onDetect,
                      ),
                      // Light vignette so the reticle stays readable without
                      // hiding the QR code from the user.
                      IgnorePointer(
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            gradient: RadialGradient(
                              radius: 0.9,
                              colors: [
                                Colors.black.withValues(alpha: 0.1),
                                Colors.black.withValues(alpha: 0.6),
                              ],
                            ),
                          ),
                        ),
                      ),
                      if (cameraError != null)
                        ScanCameraError(error: cameraError),
                    ],
                  ),
                ),
              ),

              if (cameraError == null)
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: boxSize,
                      height: boxSize,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          CustomPaint(
                            size: Size(boxSize, boxSize),
                            painter: const ScanReticlePainter(
                              color: ColorsManager.orange,
                              cornerLength: 36,
                              strokeWidth: 3.5,
                              borderRadius: 14,
                            ),
                          ),
                          if (widget.isScanning)
                            AnimatedBuilder(
                              animation: _laserAnimation,
                              builder: (context, child) {
                                final double topOffset =
                                    16.h +
                                    (_laserAnimation.value * (boxSize - 32.h));
                                return Positioned(
                                  top: topOffset,
                                  left: 14.w,
                                  right: 14.w,
                                  child: Container(
                                    height: 3.h,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(2.r),
                                      gradient: LinearGradient(
                                        colors: [
                                          ColorsManager.orange.withValues(
                                            alpha: 0.0,
                                          ),
                                          ColorsManager.orange,
                                          ColorsManager.orange.withValues(
                                            alpha: 0.0,
                                          ),
                                        ],
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: ColorsManager.orange
                                              .withValues(alpha: 0.6),
                                          blurRadius: 8,
                                          spreadRadius: 1,
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                        ],
                      ),
                    ),
                    verticalSpace(18),
                    const ScanInstructionPill(),
                  ],
                ),
            ],
          ),
        );
      },
    );
  }
}
