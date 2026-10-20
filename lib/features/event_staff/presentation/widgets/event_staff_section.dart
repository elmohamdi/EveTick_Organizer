import 'package:evetick_organizer/core/helpers/spacing.dart';
import 'package:evetick_organizer/core/theming/colors.dart';
import 'package:evetick_organizer/core/theming/extensions/build_context_extension.dart';
import 'package:evetick_organizer/core/theming/text_styles.dart';
import 'package:evetick_organizer/core/widgets/app_toast/app_toast.dart';
import 'package:evetick_organizer/features/event_staff/data/models/event_staff_member.dart';
import 'package:evetick_organizer/features/event_staff/logic/cubit/event_staff_cubit.dart';
import 'package:evetick_organizer/features/event_staff/logic/cubit/event_staff_state.dart';
import 'package:evetick_organizer/features/event_staff/presentation/widgets/add_staff_member_sheet.dart';
import 'package:evetick_organizer/features/event_staff/presentation/widgets/staff_member_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// "Staff" block of the event dashboard.
/// Requires an [EventStaffCubit] above it.
class EventStaffSection extends StatelessWidget {
  const EventStaffSection({super.key});

  void _openAddSheet(BuildContext context) {
    final cubit = context.read<EventStaffCubit>();
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      backgroundColor: context.colors.darkBlue,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
      ),
      builder: (_) =>
          BlocProvider.value(value: cubit, child: const AddStaffMemberSheet()),
    );
  }

  Future<void> _confirmRemove(
    BuildContext context,
    EventStaffMember member,
  ) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        backgroundColor: dialogContext.colors.lightBlue,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
        title: Text(
          member.isPending ? 'Cancel invitation?' : 'Remove staff member?',
          style: TextStyles.font18WhiteBold(dialogContext),
        ),
        content: Text(
          member.isPending
              ? 'The invitation sent to ${member.email} will be cancelled.'
              : '${member.name} will lose access to this event.',
          style: TextStyles.font14LightGrayRegular(dialogContext),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(false),
            child: Text(
              'Keep',
              style: TextStyles.font16LightGrayMid(dialogContext),
            ),
          ),
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(true),
            child: Text(
              member.isPending ? 'Cancel invitation' : 'Remove',
              style: TextStyles.font16RedMid,
            ),
          ),
        ],
      ),
    );
    if (confirmed != true || !context.mounted) return;

    final error = await context.read<EventStaffCubit>().removeStaff(member);
    if (error != null && context.mounted) {
      AppToast.error(context, error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text('Staff', style: TextStyles.font18WhiteBold(context)),
            ),
            TextButton.icon(
              onPressed: () => _openAddSheet(context),
              icon: Icon(
                Icons.person_add_alt_1_outlined,
                size: 18.sp,
                color: ColorsManager.orange,
              ),
              label: Text('Add', style: TextStyles.font12OrangeBold),
            ),
          ],
        ),
        verticalSpace(8),
        BlocBuilder<EventStaffCubit, EventStaffState>(
          builder: (context, state) {
            switch (state.status) {
              case StaffLoadStatus.initial:
              case StaffLoadStatus.loading:
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 24.h),
                  child: const Center(
                    child: CircularProgressIndicator(
                      color: ColorsManager.orange,
                    ),
                  ),
                );
              case StaffLoadStatus.failure:
                return _InfoCard(
                  message: state.errorMessage ?? 'Could not load staff',
                  actionLabel: 'Try again',
                  onAction: () => context.read<EventStaffCubit>().loadStaff(),
                );
              case StaffLoadStatus.success:
                if (state.members.isEmpty) {
                  return _InfoCard(
                    message:
                        'No staff yet. Invite a co-organizer or gate staff by email and choose what they can do.',
                    actionLabel: 'Add staff member',
                    onAction: () => _openAddSheet(context),
                  );
                }
                return Column(
                  children: [
                    for (final member in state.members) ...[
                      StaffMemberTile(
                        member: member,
                        isRemoving: state.removingIds.contains(member.id),
                        onRemove: () => _confirmRemove(context, member),
                      ),
                      verticalSpace(8),
                    ],
                  ],
                );
            }
          },
        ),
      ],
    );
  }
}

class _InfoCard extends StatelessWidget {
  const _InfoCard({
    required this.message,
    required this.actionLabel,
    required this.onAction,
  });

  final String message;
  final String actionLabel;
  final VoidCallback onAction;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: context.colors.lightBlue,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: context.colors.secondaryBlue.withValues(alpha: 0.25),
        ),
      ),
      child: Column(
        children: [
          Text(
            message,
            textAlign: TextAlign.center,
            style: TextStyles.font14LightGrayRegular(context),
          ),
          verticalSpace(8),
          TextButton(
            onPressed: onAction,
            child: Text(actionLabel, style: TextStyles.font12OrangeBold),
          ),
        ],
      ),
    );
  }
}
