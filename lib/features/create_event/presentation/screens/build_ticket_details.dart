import 'package:evetick_organizer/core/helpers/spacing.dart';
import 'package:evetick_organizer/core/theming/colors.dart';
import 'package:evetick_organizer/core/theming/extensions/build_context_extension.dart';
import 'package:evetick_organizer/core/theming/text_styles.dart';
import 'package:evetick_organizer/core/widgets/app_text_form_field.dart';
import 'package:evetick_organizer/core/widgets/filled_app_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildTicketDetails extends StatefulWidget {
  const BuildTicketDetails({super.key, this.onPublish});

  /// Tickets is the last page in the PageView, so this doesn't move to
  /// another page - it's called once the whole step is valid and the
  /// screen should navigate to the (route-based) Publish Event screen.
  final VoidCallback? onPublish;

  @override
  State<BuildTicketDetails> createState() => _BuildTicketDetailsState();
}

class _TicketTier {
  _TicketTier()
      : nameController = TextEditingController(),
        priceController = TextEditingController(),
        quantityController = TextEditingController(),
        descriptionController = TextEditingController();

  final TextEditingController nameController;
  final TextEditingController priceController;
  final TextEditingController quantityController;
  final TextEditingController descriptionController;

  void dispose() {
    nameController.dispose();
    priceController.dispose();
    quantityController.dispose();
    descriptionController.dispose();
  }
}

// In a real app these would come from the organizer's linked payout
// accounts (e.g. a PaymentMethodsRepository), not be hardcoded here.
enum _PayoutMethod { bank, paypal }

class _BuildTicketDetailsState extends State<BuildTicketDetails> {
  final _formKey = GlobalKey<FormState>();
  final List<_TicketTier> tiers = [_TicketTier()];

  _PayoutMethod selectedPayoutMethod = _PayoutMethod.bank;

  @override
  void dispose() {
    for (final tier in tiers) {
      tier.dispose();
    }
    super.dispose();
  }

  void _addTier() {
    setState(() => tiers.add(_TicketTier()));
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
              _TicketTierCard(
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
                  border: Border.all(color: context.colors.lightBlue, width: 1.3),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.add_circle_outline, color: context.colors.white, size: 20.sp),
                    horizontalSpace(8),
                    Text('Add New Tier', style: TextStyles.font16WhiteRegular(context)),
                  ],
                ),
              ),
            ),

            verticalSpace(32),

            Text('Payment Method', style: TextStyles.font18WhiteBold(context)),
            verticalSpace(16),

            _PayoutMethodTile(
              icon: Icons.account_balance_outlined,
              title: 'Bank Account',
              subtitle: 'Chase •••• 4242',
              isSelected: selectedPayoutMethod == _PayoutMethod.bank,
              onTap: () => setState(() => selectedPayoutMethod = _PayoutMethod.bank),
            ),
            verticalSpace(12),
            _PayoutMethodTile(
              icon: Icons.account_balance_wallet_outlined,
              title: 'PayPal',
              subtitle: 'eve-tick-pay@example.com',
              isSelected: selectedPayoutMethod == _PayoutMethod.paypal,
              onTap: () => setState(() => selectedPayoutMethod = _PayoutMethod.paypal),
            ),

            verticalSpace(16),

            Center(
              child: TextButton(
                onPressed: () {
                  // TODO: navigate to a "link new payout method" flow.
                },
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

class _TicketTierCard extends StatelessWidget {
  const _TicketTierCard({
    required this.tier,
    required this.showRemove,
    required this.onRemove,
  });

  final _TicketTier tier;
  final bool showRemove;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: context.colors.fourthBlue,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (showRemove)
            Align(
              alignment: Alignment.centerRight,
              child: InkWell(
                onTap: onRemove,
                child: Icon(Icons.close, color: context.colors.gray3, size: 20.sp),
              ),
            ),

          AppTextFormField(
            label: 'Ticket Name',
            hintText: 'Enter your ticket name.',
            controller: tier.nameController,
            backgroundColor: context.colors.thirdBlue,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Please enter a ticket name';
              }
              return null;
            },
          ),

          verticalSpace(16),

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: AppTextFormField(
                  label: 'Price',
                  hintText: 'Enter Your Price.',
                  controller: tier.priceController,
                  backgroundColor: context.colors.thirdBlue,
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}')),
                  ],
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Required';
                    }
                    if (double.tryParse(value) == null) {
                      return 'Invalid price';
                    }
                    return null;
                  },
                ),
              ),
              horizontalSpace(12),
              Expanded(
                child: AppTextFormField(
                  label: 'Quantity',
                  hintText: 'Enter Ticket Quantity.',
                  controller: tier.quantityController,
                  backgroundColor: context.colors.thirdBlue,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Required';
                    }
                    if (int.tryParse(value) == null || int.parse(value) <= 0) {
                      return 'Invalid';
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),

          verticalSpace(16),

          AppTextFormField(
            label: 'Description',
            hintText: 'Enter Ticket Description.',
            controller: tier.descriptionController,
            backgroundColor: context.colors.thirdBlue,
            maxLines: 3,
          ),
        ],
      ),
    );
  }
}

class _PayoutMethodTile extends StatelessWidget {
  const _PayoutMethodTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.isSelected,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12.r),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
        decoration: BoxDecoration(
          color: context.colors.fourthBlue,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: isSelected ? ColorsManager.orange : context.colors.lightBlue,
            width: 1.3,
          ),
        ),
        child: Row(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 150),
              width: 20.w,
              height: 20.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected ? ColorsManager.orange : Colors.transparent,
                border: Border.all(
                  color: isSelected ? ColorsManager.orange : context.colors.lightBlue,
                  width: 1.5,
                ),
              ),
              child: Center(
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 150),
                  width: isSelected ? 8.w : 0,
                  height: isSelected ? 8.w : 0,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            horizontalSpace(12),
            Container(
              width: 36.w,
              height: 36.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: context.colors.thirdBlue,
              ),
              child: Icon(icon, color: ColorsManager.orange, size: 18.sp),
            ),
            horizontalSpace(12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: TextStyles.font16WhiteRegular(context)),
                  Text(subtitle, style: TextStyles.font14LightGrayRegular(context)),
                ],
              ),
            ),
            Icon(Icons.chevron_right, color: context.colors.gray3),
          ],
        ),
      ),
    );
  }
}
