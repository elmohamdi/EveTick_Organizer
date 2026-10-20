import 'package:evetick_organizer/core/theming/extensions/build_context_extension.dart';
import 'package:evetick_organizer/core/theming/text_styles.dart';
import 'package:evetick_organizer/features/pending_events/logic/cubit/pending_events_cubit.dart';
import 'package:evetick_organizer/features/pending_events/presentation/widgets/build_event.dart';
import 'package:evetick_organizer/features/staff_access/logic/cubit/staff_invites_cubit.dart';
import 'package:evetick_organizer/features/staff_access/presentation/widgets/staff_invites_banner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PendingEventsScreen extends StatelessWidget {
  const PendingEventsScreen({super.key});

  /// Needs a [PendingEventsCubit] and a [StaffInvitesCubit] above it; both
  /// are owned by `MainContainer`.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.darkBlue,
      appBar: AppBar(
        backgroundColor: context.colors.darkBlue,
        title: Text('My Events', style: TextStyles.font18WhiteBold(context)),
        centerTitle: true,
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            tooltip: 'Refresh',
            onPressed: () {
              context.read<StaffInvitesCubit>().load();
              context.read<PendingEventsCubit>().getPendingEvents();
            },
            icon: Icon(Icons.refresh_rounded, color: context.colors.white),
          ),
        ],
      ),
      body: Column(
        children: [
          StaffInvitesBanner(
            onAccepted: () =>
                context.read<PendingEventsCubit>().getPendingEvents(),
          ),
          Expanded(child: BuildEvent()),
        ],
      ),
    );
  }
}
