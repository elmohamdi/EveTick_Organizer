import 'package:evetick_organizer/core/theming/colors.dart';
import 'package:evetick_organizer/core/theming/extensions/build_context_extension.dart';
import 'package:evetick_organizer/features/location/logic/cubit/map_picker_cubit.dart';
import 'package:evetick_organizer/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Round "my location" button that floats over the map.
class MyLocationButton extends StatelessWidget {
  const MyLocationButton({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final isLocating = context.select(
      (MapPickerCubit cubit) => cubit.state.isLocating,
    );

    return Tooltip(
      message: AppLocalizations.of(context)!.locationMyLocationTooltip,
      child: Material(
        color: context.colors.lightBlue,
        elevation: 4,
        shape: const CircleBorder(),
        child: InkWell(
          customBorder: const CircleBorder(),
          onTap: isLocating ? null : onPressed,
          child: SizedBox(
            width: 48.w,
            height: 48.w,
            child: Center(
              child: isLocating
                  ? SizedBox(
                      width: 20.w,
                      height: 20.w,
                      child: const CircularProgressIndicator(
                        strokeWidth: 2.5,
                        color: ColorsManager.orange,
                      ),
                    )
                  : Icon(
                      Icons.my_location_rounded,
                      size: 24.sp,
                      color: ColorsManager.orange,
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
