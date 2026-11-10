import 'package:evetick_organizer/features/support/data/models/support_attachment.dart';
import 'package:flutter/foundation.dart';

enum SendMessageStatus { idle, submitting, success, failure }

/// Why a picked screenshot was not added. The screen turns it into text.
enum AttachmentIssue { unsupportedFormat, tooLarge, limitReached, pickFailed }

class SendMessageState {
  const SendMessageState({
    this.status = SendMessageStatus.idle,
    this.attachments = const [],
    this.isPicking = false,
    this.attachmentIssue,
    this.errorMessage,
  });

  final SendMessageStatus status;
  final List<SupportAttachment> attachments;
  final bool isPicking;
  final AttachmentIssue? attachmentIssue;
  final String? errorMessage;

  bool get isSubmitting => status == SendMessageStatus.submitting;

  bool get canAddAttachment => attachments.length < SupportAttachment.maxCount;

  /// Nullable fields are passed as getters so they can be reset to `null`.
  SendMessageState copyWith({
    SendMessageStatus? status,
    List<SupportAttachment>? attachments,
    bool? isPicking,
    ValueGetter<AttachmentIssue?>? attachmentIssue,
    ValueGetter<String?>? errorMessage,
  }) {
    return SendMessageState(
      status: status ?? this.status,
      attachments: attachments ?? this.attachments,
      isPicking: isPicking ?? this.isPicking,
      attachmentIssue: attachmentIssue != null
          ? attachmentIssue()
          : this.attachmentIssue,
      errorMessage: errorMessage != null ? errorMessage() : this.errorMessage,
    );
  }
}
