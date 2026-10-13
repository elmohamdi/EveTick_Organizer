import 'package:evetick_organizer/core/theming/colors.dart';
import 'package:evetick_organizer/core/theming/extensions/build_context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ManualEntryField extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String> onSubmitted;

  const ManualEntryField({
    super.key,
    required this.controller,
    required this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 54.h,
      decoration: BoxDecoration(
        color: context.colors.lightBlue,
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(
          color: context.colors.secondaryBlue.withValues(alpha: 0.25),
          width: 1,
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              style: TextStyle(
                color: context.colors.white,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
              ),
              cursorColor: ColorsManager.orange,
              textInputAction: TextInputAction.done,
              autocorrect: false,
              enableSuggestions: false,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 8.w),
                border: InputBorder.none,
                hintText: 'Enter ticket code manually',
                hintStyle: TextStyle(
                  color: context.colors.lightGray,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              onSubmitted: onSubmitted,
            ),
          ),
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () => onSubmitted(controller.text),
              borderRadius: BorderRadius.circular(10.r),
              child: Container(
                width: 40.w,
                height: 40.w,
                decoration: BoxDecoration(
                  color: ColorsManager.orange,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Center(
                  child: Icon(
                    Icons.arrow_forward_rounded,
                    color: Colors.white,
                    size: 22.sp,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
