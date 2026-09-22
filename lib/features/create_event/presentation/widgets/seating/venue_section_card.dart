import 'package:evetick_organizer/core/helpers/spacing.dart';
import 'package:evetick_organizer/core/theming/extensions/build_context_extension.dart';
import 'package:evetick_organizer/core/theming/text_styles.dart';
import 'package:evetick_organizer/core/widgets/app_text_form_field.dart';
import 'package:evetick_organizer/features/create_event/presentation/widgets/seating/venue_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// One editable zone row for a [VenueLayoutType.sections] layout, e.g.
/// "Stage A" with a capacity. Mirrors [TicketTierCard]'s layout/behaviour.
class VenueSectionCard extends StatelessWidget {
  const VenueSectionCard({
    super.key,
    required this.section,
    required this.showRemove,
    required this.onRemove,
  });

  final VenueSection section;
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
            label: 'Section Name',
            hintText: 'e.g. Stage A, VIP Zone.',
            controller: section.nameController,
            backgroundColor: context.colors.thirdBlue,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Please enter a section name';
              }
              return null;
            },
          ),

          verticalSpace(16),

          AppTextFormField(
            hintStyle: TextStyles.font12Gray3Mid,
            label: 'Capacity',
            hintText: 'Enter number of spots.',
            controller: section.capacityController,
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
        ],
      ),
    );
  }
}
