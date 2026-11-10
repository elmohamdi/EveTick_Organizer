import 'package:evetick_organizer/core/helpers/extentions.dart';
import 'package:evetick_organizer/core/routing/routes.dart';
import 'package:evetick_organizer/features/splash/ui/widgets/splash_animations.dart';
import 'package:evetick_organizer/features/splash/ui/widgets/splash_logo.dart';
import 'package:evetick_organizer/features/splash/ui/widgets/splash_title.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final SplashAnimations _animations;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: SplashAnimations.totalDuration,
    );
    _animations = SplashAnimations(_controller);

    _controller.addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        await Future.delayed(const Duration(milliseconds: 800));
        if (!mounted) return;
        context.pushReplacedNamed(Routes.appStartScreen);
      }
    });
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SplashLogo(animations: _animations),
            SplashTitle(animations: _animations),
          ],
        ),
      ),
    );
  }
}
