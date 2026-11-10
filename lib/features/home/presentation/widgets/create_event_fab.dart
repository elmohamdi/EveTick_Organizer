import 'package:evetick_organizer/core/helpers/extentions.dart';
import 'package:evetick_organizer/core/routing/routes.dart';
import 'package:evetick_organizer/core/theming/colors.dart';
import 'package:evetick_organizer/core/theming/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateEventFab extends StatelessWidget {
  const CreateEventFab({super.key});

  @override
  Widget build(BuildContext context) {
    // Fixed white (not `context.colors.white`, which flips to navy in light
    // mode) so the label always has contrast on the orange background.
    return FloatingActionButton.extended(
      onPressed: () => context.pushNamed(Routes.createEventScreen),
      backgroundColor: ColorsManager.orange,
      foregroundColor: ColorsManager.defaultWhite,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      icon: const Icon(Icons.add_rounded),
      label: Text(
        'Create Event',
        style: TextStyles.font16WhiteMid(
          context,
        ).copyWith(color: ColorsManager.defaultWhite),
      ),
    );
  }
}
