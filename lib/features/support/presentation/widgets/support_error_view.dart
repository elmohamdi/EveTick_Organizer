import 'package:evetick_organizer/core/helpers/spacing.dart';
import 'package:evetick_organizer/core/theming/text_styles.dart';
import 'package:evetick_organizer/core/widgets/outline_app_text_button.dart';
import 'package:evetick_organizer/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SupportErrorView extends StatelessWidget {
  const SupportErrorView({
    super.key,
    required this.message,
    required this.onRetry,
  });

  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 16.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            message,
            textAlign: TextAlign.center,
            style: TextStyles.font16WhiteRegular(context),
          ),
          verticalSpace(16),
          OutlineAppTextButton(
            buttonText: AppLocalizations.of(context)!.supportRetry,
            buttonWidth: 160.w,
            onPressed: onRetry,
          ),
        ],
      ),
    );
  }
}
