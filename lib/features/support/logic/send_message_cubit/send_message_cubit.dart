import 'package:bloc/bloc.dart';
import 'package:evetick_organizer/core/services/result.dart';
import 'package:evetick_organizer/features/support/data/models/support_category.dart';
import 'package:evetick_organizer/features/support/data/repositories/support_repository.dart';
import 'package:evetick_organizer/features/support/logic/send_message_cubit/send_message_state.dart';

class SendMessageCubit extends Cubit<SendMessageState> {
  SendMessageCubit(this._repository) : super(const SendMessageState());

  final SupportRepository _repository;

  Future<void> pickAttachment() async {
    if (state.isPicking || state.isSubmitting) return;

    if (!state.canAddAttachment) {
      emit(state.copyWith(attachmentIssue: () => AttachmentIssue.limitReached));
      return;
    }

    emit(state.copyWith(isPicking: true, attachmentIssue: () => null));
    final result = await _repository.pickScreenshot();
    if (isClosed) return;

    result.when(
      success: (picked) {
        // The user closed the gallery without choosing anything.
        if (picked == null) {
          emit(state.copyWith(isPicking: false));
          return;
        }
        if (!picked.isSupportedFormat) {
          emit(
            state.copyWith(
              isPicking: false,
              attachmentIssue: () => AttachmentIssue.unsupportedFormat,
            ),
          );
          return;
        }
        if (!picked.isWithinSizeLimit) {
          emit(
            state.copyWith(
              isPicking: false,
              attachmentIssue: () => AttachmentIssue.tooLarge,
            ),
          );
          return;
        }
        final isDuplicate = state.attachments.any((a) => a.path == picked.path);
        emit(
          state.copyWith(
            isPicking: false,
            attachments: isDuplicate
                ? state.attachments
                : [...state.attachments, picked],
          ),
        );
      },
      failure: (_) => emit(
        state.copyWith(
          isPicking: false,
          attachmentIssue: () => AttachmentIssue.pickFailed,
        ),
      ),
    );
  }

  void removeAttachment(String path) {
    if (state.isSubmitting) return;
    emit(
      state.copyWith(
        attachments: state.attachments.where((a) => a.path != path).toList(),
        attachmentIssue: () => null,
      ),
    );
  }

  Future<void> send({
    required SupportCategory category,
    required String message,
  }) async {
    if (state.isSubmitting) return;

    emit(
      state.copyWith(
        status: SendMessageStatus.submitting,
        errorMessage: () => null,
      ),
    );
    final result = await _repository.submitMessage(
      category: category,
      message: message,
      attachments: state.attachments,
    );
    if (isClosed) return;

    result.when(
      success: (_) => emit(state.copyWith(status: SendMessageStatus.success)),
      failure: (failure) => emit(
        state.copyWith(
          status: SendMessageStatus.failure,
          errorMessage: () => failure.message,
        ),
      ),
    );
  }
}
