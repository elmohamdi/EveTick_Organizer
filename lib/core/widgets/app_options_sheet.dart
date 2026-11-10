import 'package:evetick_organizer/core/helpers/spacing.dart';
import 'package:evetick_organizer/core/theming/colors.dart';
import 'package:evetick_organizer/core/theming/extensions/build_context_extension.dart';
import 'package:evetick_organizer/core/theming/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Content of the bottom sheet opened by `AppDropdownFormField`.
/// Pops with the tapped item.
class AppOptionsSheet<T> extends StatelessWidget {
  const AppOptionsSheet({
    super.key,
    required this.title,
    required this.items,
    required this.itemLabel,
    this.selected,
  });

  final String title;
  final List<T> items;
  final String Function(T) itemLabel;
  final T? selected;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.sizeOf(context).height * 0.6,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          verticalSpace(12),
          Container(
            width: 48.w,
            height: 4.h,
            decoration: BoxDecoration(
              color: context.colors.textBackground,
              borderRadius: BorderRadius.circular(2.r),
            ),
          ),
          verticalSpace(16),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Align(
              alignment: AlignmentDirectional.centerStart,
              child: Text(title, style: TextStyles.font18WhiteBold(context)),
            ),
          ),
          Flexible(
            child: ListView.separated(
              shrinkWrap: true,
              padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 24.h),
              itemCount: items.length,
              separatorBuilder: (_, _) => verticalSpace(8),
              itemBuilder: (context, index) {
                final item = items[index];
                final isSelected = item == selected;

                return Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () => Navigator.of(context).pop(item),
                    borderRadius: BorderRadius.circular(12.r),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 14.h,
                      ),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? ColorsManager.orange.withValues(alpha: 0.12)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(12.r),
                        border: Border.all(
                          color: isSelected
                              ? ColorsManager.orange
                              : context.colors.secondaryBlue.withValues(
                                  alpha: 0.25,
                                ),
                          width: isSelected ? 1.3 : 1,
                        ),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              itemLabel(item),
                              style: TextStyles.font16WhiteMid(context),
                            ),
                          ),
                          if (isSelected)
                            Icon(
                              Icons.check_rounded,
                              size: 22.sp,
                              color: ColorsManager.orange,
                            ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
