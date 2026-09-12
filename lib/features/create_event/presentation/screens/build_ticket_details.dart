import 'package:evetick_organizer/core/helpers/spacing.dart';
import 'package:evetick_organizer/core/theming/extensions/build_context_extension.dart';
import 'package:evetick_organizer/core/theming/text_styles.dart';
import 'package:evetick_organizer/core/widgets/filled_app_text_button.dart';
import 'package:evetick_organizer/features/create_event/presentation/widgets/payout_method_tile.dart';
import 'package:evetick_organizer/features/create_event/presentation/widgets/ticket_tier.dart';
import 'package:evetick_organizer/features/create_event/presentation/widgets/ticket_tier_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildTicketDetails extends StatefulWidget {
  const BuildTicketDetails({super.key, this.onPublish});

  final VoidCallback? onPublish;

  @override
  State<BuildTicketDetails> createState() => _BuildTicketDetailsState();
}

enum PayoutMethod { bank, paypal }

class _BuildTicketDetailsState extends State<BuildTicketDetails> {
  final _formKey = GlobalKey<FormState>();
  final List<TicketTier> tiers = [TicketTier()];

  PayoutMethod selectedPayoutMethod = PayoutMethod.bank;

  @override
  void dispose() {
    for (final tier in tiers) {
      tier.dispose();
    }
    super.dispose();
  }

  void _addTier() {
    setState(() => tiers.add(TicketTier()));
  }

  void _removeTier(int index) {
    setState(() => tiers.removeAt(index).dispose());
  }

  void _onPublishPressed() {
    final bool isValid = _formKey.currentState?.validate() ?? false;
    if (!isValid) return;

    widget.onPublish?.call();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Ticket Tiers', style: TextStyles.font24OrangeBold),
                Text(
                  '${tiers.length} active tier${tiers.length == 1 ? '' : 's'}',
                  style: TextStyles.font14LightGrayRegular(context),
                ),
              ],
            ),

            verticalSpace(16),

            for (int i = 0; i < tiers.length; i++) ...[
              TicketTierCard(
                tier: tiers[i],
                showRemove: tiers.length > 1,
                onRemove: () => _removeTier(i),
              ),
              verticalSpace(16),
            ],

            InkWell(
              onTap: _addTier,
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 14.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(
                    color: context.colors.lightBlue,
                    width: 1.3,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add_circle_outline,
                      color: context.colors.white,
                      size: 20.sp,
                    ),
                    horizontalSpace(8),
                    Text(
                      'Add New Tier',
                      style: TextStyles.font16WhiteRegular(context),
                    ),
                  ],
                ),
              ),
            ),

            verticalSpace(32),

            Text('Payment Method', style: TextStyles.font18WhiteBold(context)),
            verticalSpace(16),

            PayoutMethodTile(
              icon: Icons.account_balance_outlined,
              title: 'Bank Account',
              subtitle: 'Chase •••• 4242',
              isSelected: selectedPayoutMethod == PayoutMethod.bank,
              onTap: () =>
                  setState(() => selectedPayoutMethod = PayoutMethod.bank),
            ),
            verticalSpace(12),
            PayoutMethodTile(
              icon: Icons.paypal_rounded,
              title: 'PayPal',
              subtitle: 'eve-tick-pay@example.com',
              isSelected: selectedPayoutMethod == PayoutMethod.paypal,
              onTap: () =>
                  setState(() => selectedPayoutMethod = PayoutMethod.paypal),
            ),

            verticalSpace(16),

            Center(
              child: TextButton(
                onPressed: () {},
                child: Text(
                  '+ Link New Payout Method',
                  style: TextStyles.font16OrangeRegular,
                ),
              ),
            ),

            verticalSpace(24),

            FilledAppTextButton(
              buttonText: 'Publish Event',
              onPressed: _onPublishPressed,
            ),

            verticalSpace(24),
          ],
        ),
      ),
    );
  }
}
