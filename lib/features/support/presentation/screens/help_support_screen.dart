import 'package:evetick_organizer/core/helpers/extentions.dart';
import 'package:evetick_organizer/core/helpers/spacing.dart';
import 'package:evetick_organizer/core/routing/routes.dart';
import 'package:evetick_organizer/core/theming/colors.dart';
import 'package:evetick_organizer/core/theming/extensions/build_context_extension.dart';
import 'package:evetick_organizer/features/support/logic/help_support_cubit/help_support_cubit.dart';
import 'package:evetick_organizer/features/support/presentation/widgets/faq_section.dart';
import 'package:evetick_organizer/features/support/presentation/widgets/still_need_help_card.dart';
import 'package:evetick_organizer/features/support/presentation/widgets/support_app_bar.dart';
import 'package:evetick_organizer/features/support/presentation/widgets/support_category_grid.dart';
import 'package:evetick_organizer/features/support/presentation/widgets/support_search_field.dart';
import 'package:evetick_organizer/features/support/presentation/widgets/support_section_title.dart';
import 'package:evetick_organizer/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Requires a [HelpSupportCubit] above it.
class HelpSupportScreen extends StatelessWidget {
  const HelpSupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final cubit = context.read<HelpSupportCubit>();

    return Scaffold(
      backgroundColor: context.colors.darkBlue,
      appBar: SupportAppBar(title: l10n.supportHelpTitle),
      body: SafeArea(
        child: RefreshIndicator(
          color: ColorsManager.orange,
          backgroundColor: context.colors.lightBlue,
          onRefresh: () => cubit.loadFaqs(isRefresh: true),
          child: ListView(
            physics: const AlwaysScrollableScrollPhysics(),
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            padding: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 32.h),
            children: [
              SupportSearchField(
                hintText: l10n.supportSearchHint,
                clearTooltip: l10n.supportClearSearch,
                onChanged: cubit.search,
              ),
              verticalSpace(24),
              SupportSectionTitle(title: l10n.supportCategoriesTitle),
              verticalSpace(12),
              const SupportCategoryGrid(),
              verticalSpace(24),
              SupportSectionTitle(title: l10n.supportFrequentQuestionsTitle),
              verticalSpace(4),
              const FaqSection(),
              verticalSpace(24),
              StillNeedHelpCard(
                // The picked topic is pre-selected in the message form.
                onContactTap: () => context.pushNamed(
                  Routes.sendMessageScreen,
                  arguments: cubit.state.selectedCategory,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
