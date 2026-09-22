import 'package:evetick_organizer/core/helpers/extentions.dart';
import 'package:evetick_organizer/core/routing/routes.dart';
import 'package:evetick_organizer/core/theming/extensions/build_context_extension.dart';
import 'package:evetick_organizer/core/widgets/filled_app_text_button.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        centerTitle: true,
        backgroundColor: context.colors.darkBlue,
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: FilledAppTextButton(
          buttonText: 'Create Event',
          onPressed: () => context.pushNamed(Routes.createEventScreen),
        ),
      ),
    );
  }
}
