import 'package:evetick_organizer/core/helpers/spacing.dart';
import 'package:evetick_organizer/core/theming/extensions/build_context_extension.dart';
import 'package:evetick_organizer/core/widgets/app_drop_down_form_field.dart';
import 'package:evetick_organizer/core/widgets/app_text_form_field.dart';
import 'package:evetick_organizer/core/widgets/app_toast/app_toast.dart';
import 'package:evetick_organizer/features/auth/ui/widgets/error_banner.dart';
import 'package:evetick_organizer/features/support/data/models/support_category.dart';
import 'package:evetick_organizer/features/support/logic/send_message_cubit/send_message_cubit.dart';
import 'package:evetick_organizer/features/support/logic/send_message_cubit/send_message_state.dart';
import 'package:evetick_organizer/features/support/presentation/widgets/attachments_section.dart';
import 'package:evetick_organizer/features/support/presentation/widgets/support_app_bar.dart';
import 'package:evetick_organizer/features/support/presentation/widgets/support_labels.dart';
import 'package:evetick_organizer/features/support/presentation/widgets/support_primary_button.dart';
import 'package:evetick_organizer/features/support/presentation/widgets/support_response_notice.dart';
import 'package:evetick_organizer/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Requires a [SendMessageCubit] above it.
class SendMessageScreen extends StatefulWidget {
  const SendMessageScreen({super.key, this.initialCategory});

  /// Pre-selected topic, e.g. the one picked on the Help & Support screen.
  final SupportCategory? initialCategory;

  @override
  State<SendMessageScreen> createState() => _SendMessageScreenState();
}

class _SendMessageScreenState extends State<SendMessageScreen> {
  static const int _minMessageLength = 10;
  static const int _maxMessageLength = 1000;

  final _formKey = GlobalKey<FormState>();
  final _messageController = TextEditingController();
  late SupportCategory? _category = widget.initialCategory;

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  void _submit() {
    FocusScope.of(context).unfocus();
    if (!_formKey.currentState!.validate()) return;

    context.read<SendMessageCubit>().send(
      category: _category!,
      message: _messageController.text,
    );
  }

  void _onStateChanged(BuildContext context, SendMessageState state) {
    if (state.status != SendMessageStatus.success) return;

    // Shown on the root overlay, so it stays after this screen is popped.
    AppToast.success(context, AppLocalizations.of(context)!.supportMessageSent);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return BlocListener<SendMessageCubit, SendMessageState>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: _onStateChanged,
      child: Scaffold(
        backgroundColor: context.colors.darkBlue,
        appBar: SupportAppBar(title: l10n.supportSendMessageTitle),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  padding: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 16.h),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppDropdownFormField<SupportCategory>(
                          label: l10n.supportWhatCanWeHelpWith,
                          hintText: l10n.supportSelectCategory,
                          value: _category,
                          items: SupportCategory.values,
                          itemLabel: (category) => category.label(l10n),
                          onChanged: (category) =>
                              setState(() => _category = category),
                          validator: (value) => value == null
                              ? l10n.supportCategoryRequired
                              : null,
                        ),
                        verticalSpace(24),
                        AppTextFormField(
                          label: l10n.supportYourMessage,
                          hintText: l10n.supportMessageHint,
                          controller: _messageController,
                          keyboardType: TextInputType.multiline,
                          minLines: 6,
                          maxLines: 8,
                          maxLength: _maxMessageLength,
                          validator: (value) {
                            final text = value?.trim() ?? '';
                            if (text.isEmpty) return l10n.supportMessageRequired;
                            if (text.length < _minMessageLength) {
                              return l10n.supportMessageTooShort;
                            }
                            return null;
                          },
                        ),
                        verticalSpace(16),
                        const AttachmentsSection(),
                        verticalSpace(24),
                        BlocSelector<SendMessageCubit, SendMessageState,
                            String?>(
                          selector: (state) => state.errorMessage,
                          builder: (context, message) =>
                              ErrorBanner(message: message),
                        ),
                        SupportResponseNotice(
                          // The FAQ list is the screen this one was opened from.
                          onFaqTap: () => Navigator.of(context).pop(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 16.h),
                child: BlocSelector<SendMessageCubit, SendMessageState, bool>(
                  selector: (state) => state.isSubmitting,
                  builder: (context, isSubmitting) => SupportPrimaryButton(
                    label: l10n.supportSendMessage,
                    isLoading: isSubmitting,
                    onTap: _submit,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
