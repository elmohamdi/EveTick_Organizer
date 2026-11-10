import 'package:evetick_organizer/core/helpers/extentions.dart';
import 'package:evetick_organizer/core/routing/routes.dart';
import 'package:evetick_organizer/core/theming/extensions/build_context_extension.dart';
import 'package:evetick_organizer/features/onboarding/presentation/cubit/onboarding_cubit.dart';
import 'package:evetick_organizer/features/onboarding/presentation/ui/onboarding1_screen.dart';
import 'package:evetick_organizer/features/onboarding/presentation/ui/onboarding2_screen.dart';
import 'package:evetick_organizer/features/onboarding/presentation/ui/onboarding3_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentIndex = 0;
  PageController pageController = PageController();

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        currentIndex = pageController.page!.round();
      });
    });
  }

  Future<void> _goToNext() async {
    if (currentIndex < 2) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      await context.read<OnboardingCubit>().finishOnboarding();
      context.pushReplacedNamed(Routes.welcomeScreen);
    }
  }

  void _skip() {
    context.pushReplacedNamed(Routes.welcomeScreen);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.darkBlue,
      body: Column(
        children: [
          Expanded(
            child: PageView(
              onPageChanged: (value) {
                setState(() {
                  currentIndex = value;
                });
              },
              controller: pageController,
              children: [
                Onboarding1Screen(
                  currentIndex: currentIndex,
                  onNext: _goToNext,
                  onSkip: _skip,
                ),
                Onboarding2Screen(
                  currentIndex: currentIndex,
                  onNext: _goToNext,
                ),
                Onboarding3Screen(
                  onNext: _goToNext,
                  currentIndex: currentIndex,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
