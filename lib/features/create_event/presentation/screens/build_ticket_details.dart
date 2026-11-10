import 'package:evetick_organizer/core/helpers/spacing.dart';
import 'package:evetick_organizer/core/theming/extensions/build_context_extension.dart';
import 'package:evetick_organizer/core/theming/text_styles.dart';
import 'package:evetick_organizer/core/widgets/filled_app_text_button.dart';
import 'package:evetick_organizer/features/create_event/data/models/ticket_tier_model.dart';
import 'package:evetick_organizer/features/create_event/logic/cubit/create_event_cubit.dart';
import 'package:evetick_organizer/features/create_event/data/models/payment_method_type.dart';
import 'package:evetick_organizer/features/create_event/presentation/widgets/payment_method_entry.dart';
import 'package:evetick_organizer/features/create_event/presentation/widgets/payment_methods_section.dart';
import 'package:evetick_organizer/features/create_event/presentation/widgets/ticket_tier.dart';
import 'package:evetick_organizer/features/create_event/presentation/widgets/ticket_tier_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:evetick_organizer/l10n/app_localizations.dart';

class BuildTicketDetails extends StatefulWidget {
  const BuildTicketDetails({super.key, this.onPublish});

  final VoidCallback? onPublish;

  @override
  State<BuildTicketDetails> createState() => _BuildTicketDetailsState();
}

class _BuildTicketDetailsState extends State<BuildTicketDetails> {
  final _formKey = GlobalKey<FormState>();
  final List<TicketTier> tiers = [TicketTier()];

  final List<PaymentMethodEntry> paymentEntries = PaymentMethodType.values
      .map(PaymentMethodEntry.new)
      .toList();
  bool showPaymentMethodsError = false;

  List<TicketTierModel> convertTicketTiersToModels() {
    return tiers.map((tier) {
      return TicketTierModel(
        ticketName: tier.nameController.text.trim(),
        ticketPrice: double.parse(tier.priceController.text),
        ticketQuantity: int.parse(tier.quantityController.text),
        ticketDescription: tier.descriptionController.text.trim().isEmpty
            ? null
            : tier.descriptionController.text.trim(),
      );
    }).toList();
  }

  @override
  void dispose() {
    for (final tier in tiers) {
      tier.dispose();
    }
    for (final entry in paymentEntries) {
      entry.dispose();
    }
    super.dispose();
  }

  void _addTier() {
    setState(() => tiers.add(TicketTier()));
  }

  void _removeTier(int index) {
    setState(() => tiers.removeAt(index).dispose());
  }

  void _togglePaymentMethod(PaymentMethodEntry entry) {
    setState(() {
      entry.isEnabled = !entry.isEnabled;
      showPaymentMethodsError = false;
    });
  }

  void _onPublishPressed() {
    final bool isValid = _formKey.currentState?.validate() ?? false;
    final selectedEntries = paymentEntries.where((e) => e.isEnabled).toList();

    setState(() => showPaymentMethodsError = selectedEntries.isEmpty);
    if (!isValid || selectedEntries.isEmpty) return;

    final ticketTierModels = convertTicketTiersToModels();
    final cubit = context.read<CreateEventCubit>();

    cubit.updateEventTicketTiers(ticketTierModels);
    cubit.updatePaymentMethods(
      selectedEntries.map((e) => e.toModel()).toList(),
    );

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
                Text(AppLocalizations.of(context)!.createEventTicketTiers, style: TextStyles.font24OrangeBold),
                Text(
                  tiers.length == 1
                      ? AppLocalizations.of(context)!.createEventActiveTierOne
                      : AppLocalizations.of(context)!.createEventActiveTiers(tiers.length),
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
                      color: context.colors.lightGray,
                      size: 20.sp,
                    ),
                    horizontalSpace(8),
                    Text(
                      AppLocalizations.of(context)!.createEventAddTier,
                      style: TextStyles.font16LightGrayRegular(context),
                    ),
                  ],
                ),
              ),
            ),

            verticalSpace(32),

            PaymentMethodsSection(
              entries: paymentEntries,
              onToggle: _togglePaymentMethod,
              showError: showPaymentMethodsError,
            ),

            verticalSpace(24),

            FilledAppTextButton(
              buttonText: AppLocalizations.of(context)!.createEventPublish,
              onPressed: _onPublishPressed,
            ),

            verticalSpace(24),
          ],
        ),
      ),
    );
  }
}
