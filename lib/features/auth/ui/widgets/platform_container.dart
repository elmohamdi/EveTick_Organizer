import 'package:evetick_organizer/core/theming/extensions/build_context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class PlatformContainer extends StatelessWidget {
  const PlatformContainer({super.key, required this.url});
  final String url;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64.h,
      width: 64.w,
      decoration: BoxDecoration(
        color: context.colors.darkBlue,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: context.colors.black.withValues(alpha: 0.25),
            blurRadius: 4.r,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Center(child: SvgPicture.asset(url)),
    );
  }
}