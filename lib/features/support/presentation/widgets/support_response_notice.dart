import 'package:evetick_organizer/core/helpers/spacing.dart';
import 'package:evetick_organizer/core/theming/colors.dart';
import 'package:evetick_organizer/core/theming/extensions/build_context_extension.dart';
import 'package:evetick_organizer/core/theming/font_weight_helper.dart';
import 'package:evetick_organizer/core/theming/text_styles.dart';
import 'package:evetick_organizer/l10n/app_localizations.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Info card: "We usually reply within 24 hours... check our FAQ section."
/// The FAQ words are a link that calls [onFaqTap].
class SupportResponseNotice extends StatefulWidget {
  const SupportResponseNotice({super.key, required this.onFaqTap});

  final VoidCallback onFaqTap;

  @override
  State<SupportResponseNotice> createState() => _SupportResponseNoticeState();
}

class _SupportResponseNoticeState extends State<SupportResponseNotice> {
  late final TapGestureRecognizer _faqTap = TapGestureRecognizer()
    ..onTap = () => widget.onFaqTap();

  @override
  void dispose() {
    _faqTap.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: context.colors.lightBlue,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(
          color: context.colors.secondaryBlue.withValues(alpha: 0.25),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.info_rounded, size: 28.sp, color: ColorsManager.orange),
          horizontalSpace(12),
          Expanded(
            child: Text.rich(
              TextSpan(
                style: TextStyles.font14LightGrayRegular(
                  context,
                ).copyWith(height: 1.5),
                children: [
                  TextSpan(text: l10n.supportNoticePrefix),
                  TextSpan(
                    text: l10n.supportNoticeLink,
                    recognizer: _faqTap,
                    style: const TextStyle(
                      color: ColorsManager.orange,
                      fontWeight: FontWeightHelper.medium,
                    ),
                  ),
                  TextSpan(text: l10n.supportNoticeSuffix),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
