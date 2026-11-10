import 'package:evetick_organizer/core/widgets/app_toast/app_toast.dart';
import 'package:evetick_organizer/features/location/logic/cubit/map_picker_cubit.dart';
import 'package:evetick_organizer/features/location/logic/cubit/map_picker_state.dart';
import 'package:evetick_organizer/features/location/presentation/widgets/map_center_pin.dart';
import 'package:evetick_organizer/features/location/presentation/widgets/map_hint_chip.dart';
import 'package:evetick_organizer/features/location/presentation/widgets/map_styles.dart';
import 'package:evetick_organizer/features/location/presentation/widgets/my_location_button.dart';
import 'package:evetick_organizer/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

/// The map with the centre pin, the hint and the "my location" button.
/// Needs a [MapPickerCubit] above it that is already initialized.
class MapPickerMap extends StatefulWidget {
  const MapPickerMap({super.key});

  @override
  State<MapPickerMap> createState() => _MapPickerMapState();
}

class _MapPickerMapState extends State<MapPickerMap> {
  GoogleMapController? _controller;
  late final CameraPosition _initialPosition;

  /// Centre of the map, kept up to date while the camera moves.
  late LatLng _target;

  @override
  void initState() {
    super.initState();
    final state = context.read<MapPickerCubit>().state;
    _target = LatLng(state.latitude, state.longitude);
    _initialPosition = CameraPosition(target: _target, zoom: 14);
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  Future<void> _onMyLocationPressed() async {
    final error = await context.read<MapPickerCubit>().useCurrentLocation();
    if (!mounted || error == null) return;

    final l10n = AppLocalizations.of(context)!;
    AppToast.error(context, switch (error) {
      MapPickerLocateError.serviceDisabled => l10n.locationServiceDisabled,
      MapPickerLocateError.permissionDenied => l10n.locationPermissionDenied,
      MapPickerLocateError.failed => l10n.locationCurrentFailed,
    });
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<MapPickerCubit>();
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return BlocListener<MapPickerCubit, MapPickerState>(
      listenWhen: (previous, current) =>
          current.recenter != null && previous.recenter != current.recenter,
      listener: (context, state) {
        final recenter = state.recenter!;
        _controller?.animateCamera(
          CameraUpdate.newLatLngZoom(
            LatLng(recenter.latitude, recenter.longitude),
            recenter.zoom,
          ),
        );
      },
      child: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: _initialPosition,
            style: isDark ? kDarkMapStyle : null,
            // The screen has its own controls; the default ones overlap them.
            zoomControlsEnabled: false,
            myLocationButtonEnabled: false,
            mapToolbarEnabled: false,
            compassEnabled: false,
            rotateGesturesEnabled: false,
            tiltGesturesEnabled: false,
            onMapCreated: (controller) {
              _controller = controller;
              cubit.onCameraIdle(_target.latitude, _target.longitude);
            },
            onCameraMoveStarted: cubit.onCameraMoveStarted,
            onCameraMove: (position) => _target = position.target,
            onCameraIdle: () =>
                cubit.onCameraIdle(_target.latitude, _target.longitude),
          ),
          const MapCenterPin(),
          PositionedDirectional(
            top: 12.h,
            start: 16.w,
            end: 16.w,
            child: const Center(child: MapHintChip()),
          ),
          PositionedDirectional(
            end: 16.w,
            bottom: 16.h,
            child: MyLocationButton(onPressed: _onMyLocationPressed),
          ),
        ],
      ),
    );
  }
}
