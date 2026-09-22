import 'package:evetick_organizer/core/helpers/spacing.dart';
import 'package:evetick_organizer/core/theming/colors.dart';
import 'package:evetick_organizer/core/theming/extensions/build_context_extension.dart';
import 'package:evetick_organizer/core/theming/text_styles.dart';
import 'package:evetick_organizer/features/create_event/data/models/venue_layout_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Lets the organizer pick how this event's venue is laid out.
/// Add a new [_LayoutTab] entry here whenever a new [VenueLayoutType]
/// value is introduced - the rest of the seating step reacts to
/// [selectedType] and needs no other change.
class LayoutTypeSelector extends StatelessWidget {
  const LayoutTypeSelector({
    super.key,
    required this.selectedType,
    required this.onChanged,
  });

  final VenueLayoutType selectedType;
  final ValueChanged<VenueLayoutType> onChanged;

  static const List<_LayoutTab> _tabs = [
    _LayoutTab(
      type: VenueLayoutType.seating,
      icon: Icons.event_seat_outlined,
      label: 'Seating',
    ),
    _LayoutTab(
      type: VenueLayoutType.sections,
      icon: Icons.grid_view_rounded,
      label: 'Sections',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4.w),
      decoration: BoxDecoration(
        color: context.colors.fourthBlue,
        borderRadius: BorderRadius.circular(14.r),
      ),
      child: Row(
        children: [
          for (final tab in _tabs) ...[
            if (tab != _tabs.first) horizontalSpace(4),
            Expanded(
              child: _LayoutTabButton(
                tab: tab,
                isSelected: tab.type == selectedType,
                onTap: () => onChanged(tab.type),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _LayoutTab {
  const _LayoutTab({
    required this.type,
    required this.icon,
    required this.label,
  }); 

  final VenueLayoutType type;
  final IconData icon;
  final String label;
}

class _LayoutTabButton extends StatelessWidget {
  const _LayoutTabButton({
    required this.tab,
    required this.isSelected,
    required this.onTap,
  });

  final _LayoutTab tab;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final Color color = isSelected
        ? ColorsManager.orange
        : context.colors.lightGray;

    return InkWell(
      borderRadius: BorderRadius.circular(12.r),
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.symmetric(vertical: 10.h),
        decoration: BoxDecoration(
          color: isSelected
              ? ColorsManager.orange.withOpacity(0.12)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(tab.icon, size: 18.sp, color: color),
            horizontalSpace(6),
            Text(
              tab.label,
              style: TextStyles.font14IndicatorLabel(context, color),
            ),
          ],
        ),
      ),
    );
  }
}
