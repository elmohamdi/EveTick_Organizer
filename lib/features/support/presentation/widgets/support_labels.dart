import 'package:evetick_organizer/features/support/data/models/support_category.dart';
import 'package:evetick_organizer/features/support/logic/send_message_cubit/send_message_state.dart';
import 'package:evetick_organizer/l10n/app_localizations.dart';

extension SupportCategoryLabels on SupportCategory {
  String label(AppLocalizations l10n) => switch (this) {
    SupportCategory.account => l10n.supportCategoryAccount,
    SupportCategory.events => l10n.supportCategoryEvents,
    SupportCategory.ticketing => l10n.supportCategoryTicketing,
    SupportCategory.payouts => l10n.supportCategoryPayouts,
    SupportCategory.technical => l10n.supportCategoryTechnical,
    SupportCategory.feedback => l10n.supportCategoryFeedback,
  };
}

extension AttachmentIssueLabels on AttachmentIssue {
  String message(AppLocalizations l10n) => switch (this) {
    AttachmentIssue.unsupportedFormat => l10n.supportAttachmentUnsupported,
    AttachmentIssue.tooLarge => l10n.supportAttachmentTooLarge,
    AttachmentIssue.limitReached => l10n.supportAttachmentLimit,
    AttachmentIssue.pickFailed => l10n.supportAttachmentPickFailed,
  };
}
