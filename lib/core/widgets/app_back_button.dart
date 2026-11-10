import 'package:evetick_organizer/core/helpers/extentions.dart';
import 'package:evetick_organizer/core/theming/extensions/build_context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// A back arrow aligned to the start of the screen (it flips in RTL).
class AppBackButton extends StatelessWidget {
  const AppBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: InkWell(
        onTap: () => context.pop(),
        child: Icon(
          Icons.arrow_back_ios,
          color: context.colors.white,
          size: 24.sp,
        ),
      ),
    );
  }
}
