import 'package:evetick_organizer/core/helpers/spacing.dart';
import 'package:evetick_organizer/core/theming/colors.dart';
import 'package:evetick_organizer/features/ticket_scan/presentation/widgets/scan_instruction_pill.dart';
import 'package:evetick_organizer/features/ticket_scan/presentation/widgets/scan_reticle_painter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScanViewfinder extends StatefulWidget {
  final double frameSize;
  final bool isScanning;

  const ScanViewfinder({
    super.key,
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
      CurvedAnimation(
        parent: _laserController,
        curve: Curves.easeInOut,
      ),
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

    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Camera / Concert preview viewport
          ClipRRect(
            borderRadius: BorderRadius.circular(24.r),
            child: SizedBox(
              width: double.infinity,
              height: 330.h,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    'assets/images/onboarding_background_image.png',
                    fit: BoxFit.cover,
                  ),
                  // Dark ambient overlay with concert lighting effect
                  Container(
                    decoration: BoxDecoration(
                      gradient: RadialGradient(
                        center: Alignment.center,
                        radius: 0.9,
                        colors: [
                          Colors.black.withValues(alpha: 0.35),
                          Colors.black.withValues(alpha: 0.85),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Central QR Scanner Reticle with animated laser
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: boxSize,
                height: boxSize,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // Corner reticle brackets
                    CustomPaint(
                      size: Size(boxSize, boxSize),
                      painter: const ScanReticlePainter(
                        color: ColorsManager.orange,
                        cornerLength: 36,
                        strokeWidth: 3.5,
                        borderRadius: 14,
                      ),
                    ),

                    // Smooth animated laser scan line
                    if (widget.isScanning)
                      AnimatedBuilder(
                        animation: _laserAnimation,
                        builder: (context, child) {
                          final double topOffset =
                              16.h + (_laserAnimation.value * (boxSize - 32.h));
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
                                    ColorsManager.orange.withValues(alpha: 0.0),
                                    ColorsManager.orange,
                                    ColorsManager.orange.withValues(alpha: 0.0),
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

              // Instruction pill underneath the reticle frame
              const ScanInstructionPill(),
            ],
          ),
        ],
      ),
    );
  }
}
