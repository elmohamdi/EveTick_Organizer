import 'package:evetick_organizer/core/helpers/spacing.dart';
import 'package:evetick_organizer/core/theming/colors.dart';
import 'package:evetick_organizer/core/theming/extensions/build_context_extension.dart';
import 'package:evetick_organizer/core/theming/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextFormField extends StatelessWidget {
  final String? label;
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;
  final String? hintText;
  final bool? isObscureText;
  final Widget? suffixIcon;
  final Color? backgroundColor;
  final TextEditingController? controller;
  final Function(String?) validator;
  final bool readOnly;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  const AppTextFormField({
    super.key,
    this.label,
    this.contentPadding,
    this.focusedBorder,
    this.enabledBorder,
    this.inputTextStyle,
    this.hintStyle,
    required this.hintText,
    this.isObscureText = false,
    this.suffixIcon,
    this.backgroundColor,
    this.controller,
    required this.validator,
    this.readOnly = false,
    this.keyboardType,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        if (label != null && label!.isNotEmpty) ...[
          Text(label!, style: TextStyles.font16WhiteRegular(context)),
          verticalSpace(8),
        ],
        TextFormField(
          inputFormatters: inputFormatters,
          keyboardType: keyboardType,
          readOnly: readOnly,
          controller: controller,
          decoration: InputDecoration(
            isDense: true,
            contentPadding:
                contentPadding ??
                EdgeInsets.symmetric(horizontal: 16.w, vertical: 18.h),
            focusedBorder:
                focusedBorder ??
                OutlineInputBorder(
                  borderSide: BorderSide(
                    color: ColorsManager.orange,
                    width: 1.3,
                  ),
                  borderRadius: BorderRadius.circular(12.0),
                ),
            enabledBorder:
                enabledBorder ??
                OutlineInputBorder(
                  borderSide: BorderSide(
                    color: context.colors.lightBlue,
                    width: 1.3,
                  ),
                  borderRadius: BorderRadius.circular(12.0),
                ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: ColorsManager.red, width: 1.3),
              borderRadius: BorderRadius.circular(12.0),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: ColorsManager.red, width: 1.3),
              borderRadius: BorderRadius.circular(12.0),
            ),
            filled: true,
            fillColor: backgroundColor ?? context.colors.fourthBlue,
            hintStyle: hintStyle ?? TextStyles.font16LightGrayRegular(context),
            hintText: hintText,
            suffixIcon: suffixIcon,
          ),
          obscureText: isObscureText ?? false,
          style: inputTextStyle ?? TextStyles.font16WhiteRegular(context),
          validator: (value) {
            return validator(value);
          },
        ),
      ],
    );
  }
}
