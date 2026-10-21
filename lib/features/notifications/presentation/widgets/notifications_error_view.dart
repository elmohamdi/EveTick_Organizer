import 'package:evetick_organizer/core/helpers/spacing.dart';
import 'package:evetick_organizer/core/theming/text_styles.dart';
import 'package:evetick_organizer/core/widgets/outline_app_text_button.dart';
import 'package:evetick_organizer/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationsErrorView extends StatelessWidget {
  const NotificationsErrorView({super.key, required this.onRetry});

  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              l10n.notificationsLoadFailed,
              textAlign: TextAlign.center,
              style: TextStyles.font16WhiteRegular(context),
            ),
            verticalSpace(16),
            OutlineAppTextButton(
              buttonText: l10n.commonTryAgain,
              buttonWidth: 160.w,
              onPressed: onRetry,
            ),
          ],
        ),
      ),
    );
  }
}
