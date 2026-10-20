import 'package:evetick_organizer/core/theming/extensions/build_context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:evetick_organizer/l10n/app_localizations.dart';

class ManualEntryHeader extends StatelessWidget {
  const ManualEntryHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          AppLocalizations.of(context)!.scanManualEntry,
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.2,
            color: context.colors.lightGray,
          ),
        ),
        Icon(
          Icons.keyboard_outlined,
          size: 19.sp,
          color: context.colors.lightGray,
        ),
      ],
    );
  }
}
