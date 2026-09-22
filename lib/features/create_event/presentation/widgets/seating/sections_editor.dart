import 'package:evetick_organizer/core/helpers/spacing.dart';
import 'package:evetick_organizer/core/theming/extensions/build_context_extension.dart';
import 'package:evetick_organizer/core/theming/text_styles.dart';
import 'package:evetick_organizer/features/create_event/presentation/widgets/seating/venue_section.dart';
import 'package:evetick_organizer/features/create_event/presentation/widgets/seating/venue_section_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// The full "Sections" layout editor: a list of [VenueSectionCard]s plus
/// an "Add Section" action. [BuildSeatingDetails] owns the [sections]
/// list and just re-renders this widget on change.
class SectionsEditor extends StatelessWidget {
  const SectionsEditor({
    super.key,
    required this.sections,
    required this.onAddSection,
    required this.onRemoveSection,
  });

  final List<VenueSection> sections;
  final VoidCallback onAddSection;
  final ValueChanged<int> onRemoveSection;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (int i = 0; i < sections.length; i++) ...[
          VenueSectionCard(
            section: sections[i],
            showRemove: sections.length > 1,
            onRemove: () => onRemoveSection(i),
          ),
          verticalSpace(16),
        ],

        InkWell(
          onTap: onAddSection,
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
                  'Add Section',
                  style: TextStyles.font16LightGrayRegular(context),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
