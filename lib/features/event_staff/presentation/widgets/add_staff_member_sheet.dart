import 'package:evetick_organizer/core/helpers/app_regex.dart';
import 'package:evetick_organizer/core/helpers/spacing.dart';
import 'package:evetick_organizer/core/theming/colors.dart';
import 'package:evetick_organizer/core/theming/extensions/build_context_extension.dart';
import 'package:evetick_organizer/core/theming/text_styles.dart';
import 'package:evetick_organizer/core/widgets/app_drop_down_form_field.dart';
import 'package:evetick_organizer/core/widgets/app_text_form_field.dart';
import 'package:evetick_organizer/core/widgets/app_toast/app_toast.dart';
import 'package:evetick_organizer/features/auth/ui/widgets/error_banner.dart';
import 'package:evetick_organizer/features/event_staff/data/models/staff_permission.dart';
import 'package:evetick_organizer/features/event_staff/data/models/staff_role.dart';
import 'package:evetick_organizer/features/event_staff/logic/cubit/event_staff_cubit.dart';
import 'package:evetick_organizer/features/event_staff/logic/cubit/event_staff_state.dart';
import 'package:evetick_organizer/features/event_staff/presentation/widgets/staff_labels.dart';
import 'package:evetick_organizer/features/event_staff/presentation/widgets/staff_permission_tile.dart';
import 'package:evetick_organizer/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Requires an [EventStaffCubit] above it. Open it with
/// `showModalBottomSheet(isScrollControlled: true, ...)` and hand the cubit
/// over with `BlocProvider.value`.
class AddStaffMemberSheet extends StatefulWidget {
  const AddStaffMemberSheet({super.key});

  @override
  State<AddStaffMemberSheet> createState() => _AddStaffMemberSheetState();
}

class _AddStaffMemberSheetState extends State<AddStaffMemberSheet> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();

  StaffRole? _role;
  Set<StaffPermission> _permissions = {};
  String? _permissionsError;
  String? _submitError;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  void _onRoleChanged(StaffRole? role) {
    if (role == null) return;
    setState(() {
      _role = role;
      _permissions = {...role.defaultPermissions};
      _permissionsError = null;
    });
  }

  void _togglePermission(StaffPermission permission, bool isSelected) {
    setState(() {
      if (isSelected) {
        _permissions.add(permission);
      } else {
        _permissions.remove(permission);
      }
      _permissionsError = null;
    });
  }

  Future<void> _submit() async {
    FocusScope.of(context).unfocus();
    final l10n = AppLocalizations.of(context)!;

    final isFormValid = _formKey.currentState!.validate();
    final hasPermissions = _permissions.isNotEmpty;
    setState(() {
      _permissionsError = hasPermissions
          ? null
          : l10n.staffPermissionRequired;
      _submitError = null;
    });
    if (!isFormValid || !hasPermissions) return;

    final email = _emailController.text.trim();
    final error = await context.read<EventStaffCubit>().inviteStaff(
      name: _nameController.text,
      email: email,
      role: _role!,
      permissions: _permissions,
    );
    if (!mounted) return;

    if (error != null) {
      setState(() => _submitError = error);
      return;
    }

    // Shown on the root overlay, so it stays after the sheet is closed.
    AppToast.success(context, l10n.staffInvitationSent(email.toLowerCase()));
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.viewInsetsOf(context).bottom),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          verticalSpace(12),
          Container(
            width: 48.w,
            height: 4.h,
            decoration: BoxDecoration(
              color: context.colors.gray3.withValues(alpha: 0.5),
              borderRadius: BorderRadius.circular(2.r),
            ),
          ),
          verticalSpace(16),
          const _SheetHeader(),
          verticalSpace(8),
          Flexible(
            child: SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppTextFormField(
                      label: l10n.staffFullName,
                      hintText: l10n.staffFullNameHint,
                      controller: _nameController,
                      keyboardType: TextInputType.name,
                      validator: (value) =>
                          (value == null || value.trim().length < 2)
                          ? l10n.staffFullNameRequired
                          : null,
                    ),
                    verticalSpace(20),
                    AppTextFormField(
                      label: l10n.staffEmailAddress,
                      hintText: l10n.staffEmailHint,
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        final email = value?.trim() ?? '';
                        if (email.isEmpty) return l10n.staffEmailRequired;
                        if (!AppRegex.isEmailValid(email)) {
                          return l10n.staffEmailInvalid;
                        }
                        return null;
                      },
                    ),
                    verticalSpace(20),
                    AppDropdownFormField<StaffRole>(
                      label: l10n.staffAssignRole,
                      hintText: l10n.staffSelectRole,
                      value: _role,
                      items: StaffRole.values,
                      itemLabel: (role) => role.label(l10n),
                      onChanged: _onRoleChanged,
                      validator: (value) =>
                          value == null ? l10n.staffRoleRequired : null,
                    ),
                    verticalSpace(24),
                    Text(
                      l10n.staffPermissions,
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1.1,
                        color: context.colors.lightGray,
                      ),
                    ),
                    verticalSpace(12),
                    for (final permission in StaffPermission.values) ...[
                      StaffPermissionTile(
                        permission: permission,
                        isSelected: _permissions.contains(permission),
                        onChanged: (value) =>
                            _togglePermission(permission, value),
                      ),
                      verticalSpace(12),
                    ],
                    if (_permissionsError != null)
                      Padding(
                        padding: EdgeInsets.only(bottom: 12.h),
                        child: Text(
                          _permissionsError!,
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: ColorsManager.red,
                          ),
                        ),
                      ),
                    ErrorBanner(message: _submitError),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 16.h),
            child: BlocSelector<EventStaffCubit, EventStaffState, bool>(
              selector: (state) => state.isInviting,
              builder: (context, isInviting) =>
                  _SendInvitationButton(isLoading: isInviting, onTap: _submit),
            ),
          ),
        ],
      ),
    );
  }
}

class _SheetHeader extends StatelessWidget {
  const _SheetHeader();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        children: [
          // Same width as the close button so the title stays centered.
          SizedBox(width: 44.w),
          Expanded(
            child: Text(
              'Add Staff Member',
              textAlign: TextAlign.center,
              style: TextStyles.font18WhiteBold(context),
            ),
          ),
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () => Navigator.of(context).pop(),
              borderRadius: BorderRadius.circular(22.r),
              child: Container(
                width: 44.w,
                height: 44.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: context.colors.secondaryBlue.withValues(alpha: 0.6),
                  border: Border.all(
                    color: context.colors.secondaryBlue.withValues(alpha: 0.3),
                  ),
                ),
                child: Icon(
                  Icons.close_rounded,
                  size: 20.sp,
                  color: context.colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SendInvitationButton extends StatelessWidget {
  const _SendInvitationButton({required this.isLoading, required this.onTap});

  final bool isLoading;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: ColorsManager.orange,
      borderRadius: BorderRadius.circular(16.r),
      child: InkWell(
        onTap: isLoading ? null : onTap,
        borderRadius: BorderRadius.circular(16.r),
        child: SizedBox(
          height: 52.h,
          width: double.infinity,
          child: Center(
            child: isLoading
                ? SizedBox(
                    width: 22.w,
                    height: 22.w,
                    child: const CircularProgressIndicator(
                      strokeWidth: 2.5,
                      color: ColorsManager.defaultWhite,
                    ),
                  )
                : Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.staffSendInvitation,
                        style: TextStyles.font16WhiteBold(
                          context,
                        ).copyWith(color: ColorsManager.defaultWhite),
                      ),
                      horizontalSpace(8),
                      Icon(
                        Icons.send_outlined,
                        size: 20.sp,
                        color: ColorsManager.defaultWhite,
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
