import 'package:evetick_organizer/core/helpers/spacing.dart';
import 'package:evetick_organizer/core/theming/colors.dart';
import 'package:evetick_organizer/core/theming/extensions/build_context_extension.dart';
import 'package:evetick_organizer/core/theming/text_styles.dart';
import 'package:evetick_organizer/core/widgets/app_toast/app_toast.dart';
import 'package:evetick_organizer/core/widgets/filled_app_text_button.dart';
import 'package:evetick_organizer/core/widgets/outline_app_text_button.dart';
import 'package:evetick_organizer/features/terms/logic/cubit/terms_acceptance_cubit.dart';
import 'package:evetick_organizer/features/terms/logic/cubit/terms_acceptance_state.dart';
import 'package:evetick_organizer/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// The Reject / Accept bar under the terms. Accept stays dimmed until
/// [canAccept] (the user scrolled to the end of the terms).
class TermsAcceptanceActions extends StatelessWidget {
  const TermsAcceptanceActions({super.key, required this.canAccept});

  final bool canAccept;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final cubit = context.read<TermsAcceptanceCubit>();
    final double buttonWidth = (1.sw - 32.w - 12.w) / 2;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(16.w, 12.h, 16.w, 16.h),
      decoration: BoxDecoration(
        color: context.colors.darkBlue,
        border: Border(top: BorderSide(color: context.colors.lightBlue)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (!canAccept) ...[
            Text(
              l10n.termsScrollToAccept,
              textAlign: TextAlign.center,
              style: TextStyles.font12LightGrayRegular(context),
            ),
            verticalSpace(12),
          ],
          BlocBuilder<TermsAcceptanceCubit, TermsAcceptanceState>(
            builder: (context, state) {
              if (state is TermsAcceptanceLoading) {
                return SizedBox(
                  height: 48.h,
                  child: const Center(
                    child: CircularProgressIndicator(
                      color: ColorsManager.orange,
                    ),
                  ),
                );
              }
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlineAppTextButton(
                    buttonText: l10n.termsReject,
                    borderColor: ColorsManager.red,
                    textStyle: TextStyles.font16RedMid,
                    buttonWidth: buttonWidth,
                    onPressed: cubit.reject,
                  ),
                  horizontalSpace(12),
                  FilledAppTextButton(
                    buttonText: l10n.termsAccept,
                    buttonWidth: buttonWidth,
                    backgroundColor: canAccept
                        ? ColorsManager.orange
                        : context.colors.lightBlue,
                    onPressed: canAccept
                        ? cubit.accept
                        : () => AppToast.info(context, l10n.termsScrollToAccept),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
