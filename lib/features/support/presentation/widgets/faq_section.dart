import 'package:evetick_organizer/core/theming/colors.dart';
import 'package:evetick_organizer/features/support/logic/help_support_cubit/help_support_cubit.dart';
import 'package:evetick_organizer/features/support/logic/help_support_cubit/help_support_state.dart';
import 'package:evetick_organizer/features/support/presentation/widgets/faq_empty_state.dart';
import 'package:evetick_organizer/features/support/presentation/widgets/faq_tile.dart';
import 'package:evetick_organizer/features/support/presentation/widgets/support_error_view.dart';
import 'package:evetick_organizer/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// The list of frequent questions with its loading, error and empty states.
/// Requires a [HelpSupportCubit] above it.
class FaqSection extends StatelessWidget {
  const FaqSection({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final languageCode = Localizations.localeOf(context).languageCode;

    return BlocBuilder<HelpSupportCubit, HelpSupportState>(
      builder: (context, state) {
        switch (state.status) {
          case FaqLoadStatus.initial:
          case FaqLoadStatus.loading:
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 32.h),
              child: const Center(
                child: CircularProgressIndicator(color: ColorsManager.orange),
              ),
            );
          case FaqLoadStatus.failure:
            return SupportErrorView(
              message: state.errorMessage ?? '',
              onRetry: () => context.read<HelpSupportCubit>().loadFaqs(),
            );
          case FaqLoadStatus.success:
            final faqs = state.visibleFaqs;
            if (faqs.isEmpty) {
              return FaqEmptyState(
                title: l10n.supportNoResultsTitle,
                subtitle: l10n.supportNoResultsSubtitle,
              );
            }
            return Column(
              children: [
                for (final faq in faqs)
                  FaqTile(
                    question: faq.question.resolve(languageCode),
                    answer: faq.answer.resolve(languageCode),
                    isExpanded: state.expandedFaqId == faq.id,
                    onTap: () =>
                        context.read<HelpSupportCubit>().toggleFaq(faq.id),
                  ),
              ],
            );
        }
      },
    );
  }
}
