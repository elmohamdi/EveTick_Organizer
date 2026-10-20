import 'package:evetick_organizer/core/helpers/extentions.dart';
import 'package:evetick_organizer/core/theming/extensions/build_context_extension.dart';
import 'package:evetick_organizer/core/theming/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Back button + centered title, same look as the Event Dashboard app bar.
class SupportAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SupportAppBar({super.key, required this.title});

  final String title;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: context.colors.darkBlue,
      scrolledUnderElevation: 0,
      elevation: 0,
      centerTitle: true,
      leading: IconButton(
        onPressed: context.pop,
        icon: Icon(
          Icons.arrow_back_ios_new_rounded,
          color: context.colors.white,
          size: 20.sp,
        ),
      ),
      title: Text(title, style: TextStyles.font18WhiteBold(context)),
    );
  }
}
