import 'package:evetick_organizer/features/support/data/models/support_category.dart';
import 'package:evetick_organizer/features/support/logic/help_support_cubit/help_support_cubit.dart';
import 'package:evetick_organizer/features/support/logic/help_support_cubit/help_support_state.dart';
import 'package:evetick_organizer/features/support/presentation/widgets/support_category_card.dart';
import 'package:evetick_organizer/features/support/presentation/widgets/support_labels.dart';
import 'package:evetick_organizer/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 2 x 2 topic cards. Tapping one filters the FAQs below.
/// Requires a [HelpSupportCubit] above it.
class SupportCategoryGrid extends StatelessWidget {
  const SupportCategoryGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    const categories = SupportCategory.helpCategories;

    return BlocSelector<HelpSupportCubit, HelpSupportState, SupportCategory?>(
      selector: (state) => state.selectedCategory,
      builder: (context, selected) {
        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          itemCount: categories.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12.w,
            mainAxisSpacing: 12.h,
            mainAxisExtent: 132.h,
          ),
          itemBuilder: (context, index) {
            final category = categories[index];
            return SupportCategoryCard(
              icon: category.icon,
              label: category.label(l10n),
              isSelected: selected == category,
              onTap: () =>
                  context.read<HelpSupportCubit>().selectCategory(category),
            );
          },
        );
      },
    );
  }
}
