import 'package:evetick_organizer/core/helpers/extentions.dart';
import 'package:evetick_organizer/core/routing/routes.dart';
import 'package:evetick_organizer/core/theming/extensions/build_context_extension.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        centerTitle: true,
        backgroundColor: context.colors.darkBlue,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        
        onPressed: () {
          context.pushNamed(Routes.createEventScreen);
        },
      ),
      body: Center(child: Text('Home Screen')),
    );
  }
}
