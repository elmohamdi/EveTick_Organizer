import 'package:evetick_organizer/core/helpers/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:evetick_organizer/l10n/app_localizations.dart';

/// Shown inside the viewfinder when the camera can't start. It always sits on
/// top of the (dark) camera area, so it uses fixed light colors on purpose.
class ScanCameraError extends StatelessWidget {
  const ScanCameraError({super.key, required this.error});

  final MobileScannerException error;

  @override
  Widget build(BuildContext context) {
    final isPermissionDenied =
        error.errorCode == MobileScannerErrorCode.permissionDenied;

    return ColoredBox(
      color: Colors.black,
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 32.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.no_photography_outlined,
                color: Colors.white70,
                size: 40.sp,
              ),
              verticalSpace(12),
              Text(
                isPermissionDenied
                    ? AppLocalizations.of(context)!.scanCameraPermission
                    : AppLocalizations.of(context)!.scanCameraUnavailable,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              verticalSpace(6),
              Text(
                AppLocalizations.of(context)!.scanEnterManuallyBelow,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white70, fontSize: 12.sp),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
