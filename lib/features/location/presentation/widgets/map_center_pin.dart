import 'package:evetick_organizer/core/theming/colors.dart';
import 'package:evetick_organizer/features/location/logic/cubit/map_picker_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// The pin fixed at the centre of the map. Its tip is exactly on the map
/// centre (the point whose address is looked up) and it lifts while the map
/// is being moved.
class MapCenterPin extends StatelessWidget {
  const MapCenterPin({super.key});

  @override
  Widget build(BuildContext context) {
    final isMoving = context.select(
      (MapPickerCubit cubit) => cubit.state.isMoving,
    );
    final pinSize = 48.sp;

    return IgnorePointer(
      child: Center(
        // Twice the pin height: the box centre is the map centre, so the pin
        // (top half) ends right on it.
        child: SizedBox(
          width: pinSize,
          height: pinSize * 2,
          child: Stack(
            alignment: Alignment.topCenter,
            // The pin lifts above the box while the map moves.
            clipBehavior: Clip.none,
            children: [
              Align(
                alignment: Alignment.center,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 150),
                  width: isMoving ? 6.w : 12.w,
                  height: isMoving ? 2.h : 4.h,
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.35),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
              ),
              AnimatedPositioned(
                duration: const Duration(milliseconds: 150),
                curve: Curves.easeOut,
                top: isMoving ? -12.h : 0,
                left: 0,
                right: 0,
                height: pinSize,
                child: Icon(
                  Icons.location_on,
                  size: pinSize,
                  color: ColorsManager.orange,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
