import 'package:evetick_organizer/core/theming/extensions/build_context_extension.dart';
import 'package:evetick_organizer/core/theming/text_styles.dart';
import 'package:evetick_organizer/features/location/logic/cubit/map_picker_cubit.dart';
import 'package:evetick_organizer/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// "Move the map to place the pin" - fades out while the map is moving.
class MapHintChip extends StatelessWidget {
  const MapHintChip({super.key});

  @override
  Widget build(BuildContext context) {
    final isMoving = context.select(
      (MapPickerCubit cubit) => cubit.state.isMoving,
    );

    return IgnorePointer(
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 150),
        opacity: isMoving ? 0 : 1,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
          decoration: BoxDecoration(
            color: context.colors.lightBlue.withValues(alpha: 0.92),
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Text(
            AppLocalizations.of(context)!.locationMoveMapHint,
            textAlign: TextAlign.center,
            style: TextStyles.font14LightGrayRegular(context),
          ),
        ),
      ),
    );
  }
}
