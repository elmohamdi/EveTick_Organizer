import 'package:evetick_organizer/core/theming/colors.dart';
import 'package:evetick_organizer/core/theming/text_styles.dart';
import 'package:evetick_organizer/features/pending_events/logic/cubit/pending_events_cubit.dart';
import 'package:evetick_organizer/features/pending_events/logic/cubit/pending_events_state.dart';
import 'package:evetick_organizer/features/pending_events/presentation/widgets/event_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PendingEventsScreen extends StatelessWidget {
  const PendingEventsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.darkBlue,
      appBar: AppBar(
        backgroundColor: ColorsManager.darkBlue,
        title: Text('My Events', style: TextStyles.font18WhiteBold(context)),
        centerTitle: true,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: BlocBuilder<PendingEventsCubit, PendingEventsState>(
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
                  'No events found.',
                  style: TextStyles.font16WhiteRegular(context),
                ),
              );
            }
            return ListView.builder(
              padding: EdgeInsets.all(16.w),
              itemCount: state.events.length,
              itemBuilder: (context, index) {
                final event = state.events[index];
                return EventCard(event: event);
              },
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
