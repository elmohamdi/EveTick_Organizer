import 'package:evetick_organizer/core/helpers/spacing.dart';
import 'package:evetick_organizer/core/theming/extensions/build_context_extension.dart';
import 'package:evetick_organizer/core/theming/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// A labelled "-  value  +" stepper, used anywhere the organizer picks a
/// small bounded number (rows, seats per row, capacity, ...).
class NumberStepperField extends StatelessWidget {
  const NumberStepperField({
    super.key,
    required this.label,
    required this.value,
    required this.onChanged,
    this.min = 1,
    this.max = 999,
  });

  final String label;
  final int value;
  final ValueChanged<int> onChanged;
  final int min;
  final int max;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyles.font14LightGrayRegular(context)),
        verticalSpace(8),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
          decoration: BoxDecoration(
            color: context.colors.fourthBlue,
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: context.colors.lightBlue, width: 1.3),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _StepperButton(
                icon: Icons.remove,
                onTap: value > min ? () => onChanged(value - 1) : null,
              ),
              Text(
                '$value',
                style: TextStyles.font16WhiteBold(context),
              ),
              _StepperButton(
                icon: Icons.add,
                onTap: value < max ? () => onChanged(value + 1) : null,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _StepperButton extends StatelessWidget {
  const _StepperButton({required this.icon, required this.onTap});

  final IconData icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final bool isEnabled = onTap != null;
    return InkWell(
      borderRadius: BorderRadius.circular(8.r),
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(6.w),
        decoration: BoxDecoration(
          color: context.colors.thirdBlue,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Icon(
          icon,
          size: 18.sp,
          color: isEnabled ? context.colors.white : context.colors.gray3,
        ),
      ),
    );
  }
}
