import 'package:evetick_organizer/core/di/dependency_injection.dart';
import 'package:evetick_organizer/core/theming/colors.dart';
import 'package:evetick_organizer/core/theming/extensions/build_context_extension.dart';
import 'package:evetick_organizer/core/theming/text_styles.dart';
import 'package:evetick_organizer/features/location/logic/cubit/map_picker_cubit.dart';
import 'package:evetick_organizer/features/location/logic/cubit/map_picker_state.dart';
import 'package:evetick_organizer/features/location/presentation/widgets/map_picker_map.dart';
import 'package:evetick_organizer/features/location/presentation/widgets/map_picker_sheet.dart';
import 'package:evetick_organizer/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Pick a place by moving the map under a fixed pin. Pops with a
/// `LocationModel` (address = the found address, or the coordinates when the
/// geocoder has none), or with `null` when the user goes back.
///
/// Creates its own [MapPickerCubit]: callers don't need to provide anything.
class MapPickerScreen extends StatelessWidget {
  const MapPickerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<MapPickerCubit>()..initialize(),
      child: Scaffold(
        backgroundColor: context.colors.darkBlue,
        appBar: AppBar(
          backgroundColor: context.colors.darkBlue,
          scrolledUnderElevation: 0,
          elevation: 0,
          centerTitle: true,
          leading: IconButton(
            onPressed: () => Navigator.maybePop(context),
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: context.colors.white,
              size: 20.sp,
            ),
          ),
          title: Text(
            AppLocalizations.of(context)!.locationSelectLocationTitle,
            style: TextStyles.font18WhiteBold(context),
          ),
        ),
        body: BlocBuilder<MapPickerCubit, MapPickerState>(
          buildWhen: (previous, current) =>
              previous.isInitialized != current.isInitialized,
          builder: (context, state) {
            if (!state.isInitialized) {
              return const Center(
                child: CircularProgressIndicator(color: ColorsManager.orange),
              );
            }
            return const Column(
              children: [
                Expanded(child: MapPickerMap()),
                MapPickerSheet(),
              ],
            );
          },
        ),
      ),
    );
  }
}
