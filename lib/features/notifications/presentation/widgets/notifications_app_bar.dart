import 'package:evetick_organizer/core/helpers/extentions.dart';
import 'package:evetick_organizer/core/theming/extensions/build_context_extension.dart';
import 'package:evetick_organizer/core/theming/text_styles.dart';
import 'package:evetick_organizer/core/widgets/app_toast/app_toast.dart';
import 'package:evetick_organizer/core/widgets/app_toast/app_toast_type.dart';
import 'package:evetick_organizer/features/notifications/logic/cubit/notifications_cubit.dart';
import 'package:evetick_organizer/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Back button + title + "mark all as read". Needs a [NotificationsCubit]
/// above it.
class NotificationsAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const NotificationsAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  Future<void> _markAllAsRead(BuildContext context) async {
    final overlay = Overlay.of(context, rootOverlay: true);
    final l10n = AppLocalizations.of(context)!;
    final succeeded = await context.read<NotificationsCubit>().markAllAsRead();
    if (succeeded) return;

    AppToast.showOn(
      overlay,
      message: l10n.notificationsMarkAllFailed,
      type: AppToastType.error,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final hasUnread = context.select(
      (NotificationsCubit cubit) => cubit.state.unreadCount > 0,
    );

    return AppBar(
      backgroundColor: context.colors.darkBlue,
      scrolledUnderElevation: 0,
      elevation: 0,
      centerTitle: true,
      leading: IconButton(
        onPressed: context.pop,
        icon: Icon(
          Icons.arrow_back_ios_new_rounded,
          color: context.colors.white,
          size: 20.sp,
        ),
      ),
      title: Text(
        l10n.notificationsTitle,
        style: TextStyles.font18WhiteBold(context),
      ),
      actions: [
        IconButton(
          tooltip: l10n.notificationsMarkAllRead,
          onPressed: hasUnread ? () => _markAllAsRead(context) : null,
          color: context.colors.white,
          disabledColor: context.colors.gray3,
          icon: const Icon(Icons.done_all_rounded),
        ),
      ],
    );
  }
}
