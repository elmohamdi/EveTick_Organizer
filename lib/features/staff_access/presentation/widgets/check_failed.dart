import 'package:evetick_organizer/core/theming/text_styles.dart';
import 'package:evetick_organizer/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CheckFailed extends StatelessWidget {
  const CheckFailed({required this.message, required this.onRetry, super.key});
  final String? message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Padding(
      padding: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 0),
      child: Row(
        children: [
          Expanded(
            child: Text(
              message ?? l10n.staffInvitationsCheckFailed,
              style: TextStyles.font12LightGrayRegular(context),
            ),
          ),
          TextButton(onPressed: onRetry, child: Text(l10n.staffInvitationsRetry)),
        ],
      ),
    );
  }
}
