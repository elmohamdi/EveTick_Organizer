import 'package:evetick_organizer/core/helpers/spacing.dart';
import 'package:evetick_organizer/core/theming/colors.dart';
import 'package:evetick_organizer/core/theming/extensions/build_context_extension.dart';
import 'package:evetick_organizer/core/theming/text_styles.dart';
import 'package:evetick_organizer/core/widgets/app_options_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Looks like [AppTextFormField] but picks from a list through a themed
/// bottom sheet instead of Material's full-width dropdown overlay.
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

  Future<void> _openSheet(BuildContext context, FormFieldState<T> field) async {
    FocusScope.of(context).unfocus();

    final picked = await showModalBottomSheet<T>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      backgroundColor: context.colors.lightBlue,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
      ),
      builder: (_) => AppOptionsSheet<T>(
        title: label,
        items: items,
        itemLabel: itemLabel,
        selected: field.value,
      ),
    );

    // `context` is not used past this point (only `field` / callbacks), so
    // there is no BuildContext-across-async-gap problem.
    if (picked == null) return;
    field.didChange(picked);
    onChanged(picked);
  }

  OutlineInputBorder _border(Color color, {double width = 1.3}) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: color, width: width),
      borderRadius: BorderRadius.circular(12.r),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyles.font16WhiteRegular(context)),
        verticalSpace(8),
        FormField<T>(
          initialValue: value,
          validator: validator,
          builder: (field) {
            final selected = field.value;

            return InkWell(
              onTap: () => _openSheet(context, field),
              borderRadius: BorderRadius.circular(12.r),
              child: InputDecorator(
                isEmpty: selected == null,
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
                  errorText: field.errorText,
                  suffixIcon: Icon(
                    Icons.keyboard_arrow_down,
                    color: context.colors.gray3,
                    size: 30.sp,
                  ),
                  enabledBorder: _border(context.colors.lightBlue),
                  border: _border(context.colors.lightBlue),
                  errorBorder: _border(ColorsManager.red),
                  focusedErrorBorder: _border(ColorsManager.red),
                ),
                child: selected == null
                    ? null
                    : Text(
                        itemLabel(selected),
                        style: TextStyles.font16WhiteRegular(context),
                      ),
              ),
            );
          },
        ),
      ],
    );
  }
}
