import 'package:evetick_organizer/core/helpers/spacing.dart';
import 'package:evetick_organizer/core/theming/extensions/build_context_extension.dart';
import 'package:evetick_organizer/core/theming/text_styles.dart';
import 'package:evetick_organizer/core/widgets/filled_app_text_button.dart';
import 'package:evetick_organizer/core/widgets/outline_app_text_button.dart';
import 'package:evetick_organizer/features/location/data/models/location_model.dart';
import 'package:evetick_organizer/features/location/logic/cubit/location_cubit.dart';
import 'package:evetick_organizer/features/location/presentation/screens/map_picker_screen.dart';
import 'package:evetick_organizer/features/location/presentation/widgets/location_listener.dart';
import 'package:evetick_organizer/features/location/presentation/widgets/where_are_you.dart';
import 'package:evetick_organizer/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SetLocation extends StatelessWidget {
  const SetLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.darkBlue,
      body: Column(
        children: [
          Align(
            alignment: AlignmentGeometry.centerRight,
            child: SafeArea(
              child: TextButton(
                onPressed: () async {
                  await context.read<LocationCubit>().skipLocation();
                },
                child: Text(AppLocalizations.of(context)!.commonSkip, style: TextStyles.font16LightGrayRegular(context)),
              ),
            ),
          ),
          verticalSpace(120),
          WhereAreYou(),
          verticalSpace(98),
          FilledAppTextButton(
            buttonText: AppLocalizations.of(
              context,
            )!.locationUseCurrentLocation,
            onPressed: () {
              context.read<LocationCubit>().getCurrentLocation();
            },
            buttonHeight: 45.h,
          ),
          verticalSpace(16),
          OutlineAppTextButton(
            buttonText: AppLocalizations.of(context)!.locationSelectManually,
            onPressed: () async {
              final LocationModel? location =
                  await Navigator.push<LocationModel>(
                    context,
                    MaterialPageRoute(
                      builder: (_) => BlocProvider.value(
                        value: context.read<LocationCubit>(),
                        child: const MapPickerScreen(),
                      ),
                    ),
                  );

              if (location != null) {
                context.read<LocationCubit>().setSelectedLocation(location);
              }
            },
            buttonHeight: 45.h,
          ),
          LocationListener(),
        ],
      ),
    );
  }
}
