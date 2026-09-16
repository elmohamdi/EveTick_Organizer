import 'package:evetick_organizer/core/theming/extensions/build_context_extension.dart';
import 'package:evetick_organizer/core/theming/text_styles.dart';
import 'package:evetick_organizer/features/create_event/data/models/event_model.dart';
import 'package:evetick_organizer/features/create_event/logic/cubit/create_event_cubit.dart';
import 'package:evetick_organizer/features/create_event/presentation/screens/build_event_details.dart';
import 'package:evetick_organizer/features/create_event/presentation/screens/build_media_details.dart';
import 'package:evetick_organizer/features/create_event/presentation/screens/build_ticket_details.dart';
import 'package:evetick_organizer/features/create_event/presentation/widgets/event_phase_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateEventScreen extends StatefulWidget {
  const CreateEventScreen({super.key});

  @override
  State<CreateEventScreen> createState() => _CreateEventScreenState();
}

class _CreateEventScreenState extends State<CreateEventScreen> {
  final PageController _pageController = PageController();
  int currentIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _goToNextPage() {
    _pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _puplishEvent() {
    final state = context.read<CreateEventCubit>().state;
    final startAt = DateTime(
      state.startDate!.year,
      state.startDate!.month,
      state.startDate!.day,
      state.startTime!.hour,
      state.startTime!.minute,
    );

    final endAt = DateTime(
      state.endDate!.year,
      state.endDate!.month,
      state.endDate!.day,
      state.endTime!.hour,
      state.endTime!.minute,
    );
    final event = EventModel(
      eventTitle: state.eventTitle!,
      eventCategory: state.eventCategory!,
      startAt: startAt,
      endAt: endAt,
      eventLocation: state.eventLocation ?? '',
      eventCoverImage: state.eventCoverImage!,
      eventPhotos: state.eventGalleryPhotos,
      eventDescription: state.eventDescription,
      eventTicketTier: state.eventTicketTiers,
      isOnlineEvent: state.isOnlineEvent,
    );
    context.read<CreateEventCubit>().createEvent(event);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Event', style: TextStyles.font18WhiteBold(context)),
        centerTitle: true,
        backgroundColor: context.colors.darkBlue,
        leading: InkWell(child: Icon(Icons.arrow_back_ios, size: 24.sp)),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
            child: EventPhaseIndicator(currentStep: currentIndex),
          ),
          Expanded(
            child: PageView(
              controller: _pageController,
              // physics: const NeverScrollableScrollPhysics(),
              onPageChanged: (index) => setState(() => currentIndex = index),
              children: [
                BuildEventDetails(onNextStep: _goToNextPage),
                BuildMediaDetails(onNextStep: _goToNextPage),
                BuildTicketDetails(onPublish: _puplishEvent),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
