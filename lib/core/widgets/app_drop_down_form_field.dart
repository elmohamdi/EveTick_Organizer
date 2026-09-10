import 'package:evetick_organizer/core/helpers/spacing.dart';
import 'package:evetick_organizer/core/theming/colors.dart';
import 'package:evetick_organizer/core/theming/extensions/build_context_extension.dart';
import 'package:evetick_organizer/core/theming/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppDropdownFormField<T> extends StatelessWidget {
  final String label;
  final String? hintText;
  final T? value;
  final List<T> items;
  final String Function(T) itemLabel;
  final void Function(T?) onChanged;
  final String? Function(T?)? validator;

  const AppDropdownFormField({
    super.key,
    required this.label,
    this.hintText,
    required this.value,
    required this.items,
    required this.itemLabel,
    required this.onChanged,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyles.font16WhiteRegular(context)),
        verticalSpace(8),
        DropdownButtonFormField<T>(
          initialValue: value,
          isExpanded: true,
          menuMaxHeight: 250.h,
          dropdownColor: context.colors.fourthBlue,
          borderRadius: BorderRadius.circular(12.r),
          icon: Icon(
            Icons.keyboard_arrow_down,
            color: context.colors.gray3,
            size: 30.sp,
          ),
          style: TextStyles.font16WhiteRegular(context),
          decoration: InputDecoration(
            isDense: true,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 18.h,
            ),
            filled: true,
            fillColor: context.colors.fourthBlue,
            hintText: hintText,
            hintStyle: TextStyles.font16LightGrayRegular(context),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: context.colors.lightBlue,
                width: 1.3.w,
              ),
              borderRadius: BorderRadius.circular(12.0.r),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: ColorsManager.orange, width: 1.3),
              borderRadius: BorderRadius.circular(12.0),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: ColorsManager.red, width: 1.3),
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
          items: items.map((item) {
            return DropdownMenuItem<T>(
              value: item,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 4.h),
                child: Text(itemLabel(item)),
              ),
            );
          }).toList(),
          onChanged: onChanged,
          validator: validator,
        ),
      ],
    );
  }
}
