import 'package:evetick_organizer/core/helpers/spacing.dart';
import 'package:evetick_organizer/core/theming/colors.dart';
import 'package:evetick_organizer/core/theming/text_styles.dart';
import 'package:evetick_organizer/features/location/logic/cubit/map_picker_cubit.dart';
import 'package:evetick_organizer/features/location/logic/cubit/map_picker_state.dart';
import 'package:evetick_organizer/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Address of the spot under the pin: "Finding address...", the address, or
/// the coordinates when no address exists for that spot.
class MapAddressTile extends StatelessWidget {
  const MapAddressTile({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return BlocBuilder<MapPickerCubit, MapPickerState>(
      buildWhen: (previous, current) =>
          previous.isMoving != current.isMoving ||
          previous.addressStatus != current.addressStatus ||
          previous.address != current.address ||
          previous.latitude != current.latitude ||
          previous.longitude != current.longitude,
      builder: (context, state) {
        final isResolving =
            state.isMoving ||
            state.addressStatus == MapPickerAddressStatus.resolving;

        final String title;
        String? subtitle;
        if (isResolving) {
          title = l10n.locationFindingAddress;
        } else if (state.addressStatus == MapPickerAddressStatus.resolved) {
          title = state.address ?? '';
        } else {
          title =
              '${state.latitude.toStringAsFixed(5)}, '
              '${state.longitude.toStringAsFixed(5)}';
          subtitle = l10n.locationAddressUnavailable;
        }

        return Row(
          children: [
            Container(
              width: 44.w,
              height: 44.w,
              decoration: BoxDecoration(
                color: ColorsManager.orange.withValues(alpha: 0.15),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.location_on_outlined,
                size: 22.sp,
                color: ColorsManager.orange,
              ),
            ),
            horizontalSpace(12),
            Expanded(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 150),
                child: Column(
                  key: ValueKey('$isResolving$title'),
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: isResolving
                          ? TextStyles.font16LightGrayRegular(context)
                          : TextStyles.font16WhiteBold(context),
                    ),
                    if (subtitle != null) ...[
                      verticalSpace(2),
                      Text(
                        subtitle,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyles.font12LightGrayRegular(context),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
