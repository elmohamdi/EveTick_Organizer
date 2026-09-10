import 'package:evetick_organizer/core/routing/routes.dart';
import 'package:evetick_organizer/core/theming/extensions/build_context_extension.dart';
import 'package:evetick_organizer/core/theming/text_styles.dart';
import 'package:evetick_organizer/features/create_event/presentation/screens/build_event_details.dart';
import 'package:evetick_organizer/features/create_event/presentation/screens/build_media_details.dart';
import 'package:evetick_organizer/features/create_event/presentation/screens/build_ticket_details.dart';
import 'package:evetick_organizer/features/create_event/presentation/widgets/event_phase_indicator.dart';
import 'package:flutter/material.dart';
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

  // Tickets is the last page inside the PageView. Publish has no fields of
  // its own, so it's a separate pushed screen instead of a 4th page.
  void _goToPublishScreen() {
    Navigator.of(context).pushNamed(Routes.publishEventScreen);
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
              physics: const NeverScrollableScrollPhysics(),
              onPageChanged: (index) => setState(() => currentIndex = index),
              children: [
                BuildEventDetails(onNextStep: _goToNextPage),
                BuildMediaDetails(onNextStep: _goToNextPage),
                BuildTicketDetails(onPublish: _goToPublishScreen),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
