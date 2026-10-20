import 'package:evetick_organizer/core/helpers/spacing.dart';
import 'package:evetick_organizer/core/theming/colors.dart';
import 'package:evetick_organizer/core/theming/extensions/build_context_extension.dart';
import 'package:evetick_organizer/core/theming/text_styles.dart';
import 'package:evetick_organizer/features/support/logic/send_message_cubit/send_message_cubit.dart';
import 'package:evetick_organizer/features/support/logic/send_message_cubit/send_message_state.dart';
import 'package:evetick_organizer/features/support/presentation/widgets/attachment_picker_button.dart';
import 'package:evetick_organizer/features/support/presentation/widgets/attachment_preview_tile.dart';
import 'package:evetick_organizer/features/support/presentation/widgets/support_labels.dart';
import 'package:evetick_organizer/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// "Attachments (optional)" block of the message form.
/// Requires a [SendMessageCubit] above it.
class AttachmentsSection extends StatelessWidget {
  const AttachmentsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final cubit = context.read<SendMessageCubit>();

    return BlocBuilder<SendMessageCubit, SendMessageState>(
      buildWhen: (previous, current) =>
          previous.attachments != current.attachments ||
          previous.isPicking != current.isPicking ||
          previous.attachmentIssue != current.attachmentIssue,
      builder: (context, state) {
        final issue = state.attachmentIssue;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              l10n.supportAttachmentsOptional.toUpperCase(),
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w700,
                letterSpacing: 1.1,
                color: context.colors.lightGray,
              ),
            ),
            verticalSpace(12),
            for (final attachment in state.attachments) ...[
              AttachmentPreviewTile(
                attachment: attachment,
                removeTooltip: l10n.supportAttachmentRemove,
                onRemove: () => cubit.removeAttachment(attachment.path),
              ),
              verticalSpace(8),
            ],
            if (state.canAddAttachment)
              AttachmentPickerButton(
                label: l10n.supportUploadScreenshot,
                isLoading: state.isPicking,
                onTap: cubit.pickAttachment,
              ),
            verticalSpace(10),
            SizedBox(
              width: double.infinity,
              child: Text(
                issue == null ? l10n.supportAttachmentHint : issue.message(l10n),
                textAlign: TextAlign.center,
                style: issue == null
                    ? TextStyles.font12Gray3Mid
                    : TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: ColorsManager.red,
                      ),
              ),
            ),
          ],
        );
      },
    );
  }
}
