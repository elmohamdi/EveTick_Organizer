import 'package:evetick_organizer/core/helpers/spacing.dart';
import 'package:evetick_organizer/core/theming/text_styles.dart';
import 'package:evetick_organizer/features/create_event/presentation/widgets/payment_method_card.dart';
import 'package:evetick_organizer/features/create_event/presentation/widgets/payment_method_entry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:evetick_organizer/l10n/app_localizations.dart';

class PaymentMethodsSection extends StatelessWidget {
  const PaymentMethodsSection({
    super.key,
    required this.entries,
    required this.onToggle,
    required this.showError,
  });

  final List<PaymentMethodEntry> entries;
  final ValueChanged<PaymentMethodEntry> onToggle;
  final bool showError;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppLocalizations.of(context)!.createEventPaymentMethods, style: TextStyles.font18WhiteBold(context)),
        verticalSpace(4),
        Text(
          AppLocalizations.of(context)!.createEventPaymentMethodsSubtitle,
          style: TextStyles.font14Gray3Regular,
        ),
        verticalSpace(16),
        for (final entry in entries) ...[
          PaymentMethodCard(entry: entry, onToggle: () => onToggle(entry)),
          verticalSpace(12),
        ],
        if (showError)
          Text(
            AppLocalizations.of(context)!.createEventPaymentMethodRequired,
            style: TextStyles.font16RedMid.copyWith(fontSize: 12.sp),
          ),
      ],
    );
  }
}
