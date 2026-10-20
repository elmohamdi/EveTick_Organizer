import 'package:evetick_organizer/core/helpers/extentions.dart';
import 'package:evetick_organizer/core/routing/routes.dart';
import 'package:evetick_organizer/core/theming/colors.dart';
import 'package:evetick_organizer/core/theming/text_styles.dart';
import 'package:evetick_organizer/features/pending_events/logic/cubit/pending_events_cubit.dart';
import 'package:evetick_organizer/features/pending_events/logic/cubit/pending_events_state.dart';
import 'package:evetick_organizer/features/pending_events/presentation/widgets/event_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:evetick_organizer/l10n/app_localizations.dart';

class BuildEvent extends StatelessWidget {
  const BuildEvent({super.key, context});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PendingEventsCubit, PendingEventsState>(
      builder: (context, state) {
        if (state is PendingEventsLoading) {
          return const Center(
            child: CircularProgressIndicator(color: ColorsManager.orange),
          );
        } else if (state is PendingEventsFailure) {
          return Center(
            child: Text(
              state.error,
              style: TextStyles.font16WhiteRegular(context),
            ),
          );
        } else if (state is PendingEventsSuccess) {
          if (state.events.isEmpty) {
            return Center(
              child: Text(
                AppLocalizations.of(context)!.commonNoEventsFound,
                style: TextStyles.font16WhiteRegular(context),
              ),
            );
          }
          return ListView.builder(
            padding: EdgeInsets.all(16.w),
            itemCount: state.events.length,
            itemBuilder: (context, index) {
              final event = state.events[index];
              final eventId = event['eventId'] as String?;
              // Staff only get the dashboard with the "view analytics"
              // permission; the owner always does.
              final canManage =
                  event['isStaffEvent'] != true || event['canManage'] == true;
              return EventCard(
                event: event,
                onManage: eventId == null || !canManage
                    ? null
                    : () => context.pushNamed(
                        Routes.eventDashboardScreen,
                        arguments: eventId,
                      ),
              );
            },
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
