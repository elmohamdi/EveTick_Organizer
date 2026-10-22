import 'package:evetick_organizer/core/helpers/spacing.dart';
import 'package:evetick_organizer/core/theming/extensions/build_context_extension.dart';
import 'package:evetick_organizer/core/widgets/filled_app_text_button.dart';
import 'package:evetick_organizer/features/location/logic/cubit/map_picker_cubit.dart';
import 'package:evetick_organizer/features/location/logic/cubit/map_picker_state.dart';
import 'package:evetick_organizer/features/location/presentation/widgets/map_address_tile.dart';
import 'package:evetick_organizer/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Bottom card: the address of the pin + "Confirm Location". Pops the screen
/// with the chosen `LocationModel`.
class MapPickerSheet extends StatelessWidget {
  const MapPickerSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(
        20.w,
        20.h,
        20.w,
        20.h + MediaQuery.paddingOf(context).bottom,
      ),
      decoration: BoxDecoration(
        color: context.colors.lightBlue,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const MapAddressTile(),
          verticalSpace(20),
          BlocBuilder<MapPickerCubit, MapPickerState>(
            buildWhen: (previous, current) =>
                previous.canConfirm != current.canConfirm,
            builder: (context, state) {
              return FilledAppTextButton(
                buttonText: l10n.locationConfirmLocation,
                buttonWidth: double.infinity,
                // The spinner = "still looking up the address".
                isLoading: !state.canConfirm,
                onPressed: () => Navigator.pop(
                  context,
                  context.read<MapPickerCubit>().confirmedLocation,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
