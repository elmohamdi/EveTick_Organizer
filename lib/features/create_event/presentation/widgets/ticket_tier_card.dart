import 'package:evetick_organizer/core/helpers/spacing.dart';
import 'package:evetick_organizer/core/theming/extensions/build_context_extension.dart';
import 'package:evetick_organizer/core/theming/text_styles.dart';
import 'package:evetick_organizer/core/widgets/app_text_form_field.dart';
import 'package:evetick_organizer/features/create_event/presentation/widgets/ticket_tier.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TicketTierCard extends StatelessWidget {
  const TicketTierCard({
    super.key,
    required this.tier,
    required this.showRemove,
    required this.onRemove,
  });

  final TicketTier tier;
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
                child: Icon(
                  Icons.close,
                  color: context.colors.gray3,
                  size: 20.sp,
                ),
              ),
            ),

          AppTextFormField(
            hintStyle: TextStyles.font12Gray3Mid,
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
                  hintStyle: TextStyles.font12Gray3Mid,
                  label: 'Price',
                  hintText: 'Enter Your Price.',
                  controller: tier.priceController,
                  backgroundColor: context.colors.thirdBlue,
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                      RegExp(r'^\d*\.?\d{0,2}'),
                    ),
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
                  hintStyle: TextStyles.font12Gray3Mid,
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
            hintStyle: TextStyles.font12Gray3Mid,
            maxLines: 3,
            minLines: 1,
          ),
        ],
      ),
    );
  }
}
