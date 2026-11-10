import 'package:evetick_organizer/core/helpers/spacing.dart';
import 'package:evetick_organizer/core/theming/colors.dart';
import 'package:evetick_organizer/core/theming/extensions/build_context_extension.dart';
import 'package:evetick_organizer/core/theming/text_styles.dart';
import 'package:evetick_organizer/core/widgets/app_text_form_field.dart';
import 'package:evetick_organizer/features/create_event/presentation/widgets/payment_method_entry.dart';
import 'package:evetick_organizer/features/create_event/presentation/widgets/payment_method_logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:evetick_organizer/l10n/app_localizations.dart';

class PaymentMethodCard extends StatelessWidget {
  const PaymentMethodCard({
    super.key,
    required this.entry,
    required this.onToggle,
  });

  final PaymentMethodEntry entry;
  final VoidCallback onToggle;

  @override
  Widget build(BuildContext context) {
    final type = entry.type;

    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: context.colors.fourthBlue,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: entry.isEnabled
              ? ColorsManager.orange
              : context.colors.lightBlue,
          width: 1.3,
        ),
      ),
      child: Column(
        children: [
          InkWell(
            onTap: onToggle,
            borderRadius: BorderRadius.circular(12.r),
            child: Row(
              children: [
                PaymentMethodLogo(type: type),
                horizontalSpace(12),
                Expanded(
                  child: Text(
                    type.title,
                    style: TextStyles.font16WhiteRegular(context),
                  ),
                ),
                Switch(
                  value: entry.isEnabled,
                  onChanged: (_) => onToggle(),
                  activeTrackColor: ColorsManager.orange,
                  activeThumbColor: context.colors.white,
                ),
              ],
            ),
          ),
          AnimatedSize(
            duration: const Duration(milliseconds: 200),
            alignment: Alignment.topCenter,
            child: entry.isEnabled
                ? Padding(
                    padding: EdgeInsets.only(top: 12.h),
                    child: AppTextFormField(
                      label: type.fieldLabelOf(AppLocalizations.of(context)!),
                      hintText: type.hintOf(AppLocalizations.of(context)!),
                      hintStyle: TextStyles.font12Gray3Mid,
                      controller: entry.controller,
                      backgroundColor: context.colors.thirdBlue,
                      keyboardType: type.keyboardType,
                      inputFormatters: type.inputFormatters,
                      validator: (value) => type.validate(value, AppLocalizations.of(context)!),
                    ),
                  )
                : const SizedBox(width: double.infinity),
          ),
        ],
      ),
    );
  }
}
