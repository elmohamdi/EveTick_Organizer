import 'package:evetick_organizer/core/theming/colors.dart';
import 'package:evetick_organizer/core/widgets/filled_app_text_button.dart';
import 'package:evetick_organizer/features/location/logic/cubit/location_cubit.dart';
import 'package:evetick_organizer/features/location/presentation/widgets/selected_location_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPickerScreen extends StatefulWidget {
  const MapPickerScreen({super.key});

  @override
  State<MapPickerScreen> createState() => _MapPickerScreenState();
}

class _MapPickerScreenState extends State<MapPickerScreen> {
  CameraPosition cameraPosition = const CameraPosition(
    target: LatLng(31.2001, 29.9187),
    zoom: 14,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Select Location')),
      body: Column(
        children: [
          Flexible(
            flex: 7,
            child: Stack(
              children: [
                GoogleMap(
                  onCameraMove: (position) {
                    cameraPosition = position;
                  },
                  onCameraIdle: () {
                    context.read<LocationCubit>().updateSelectedLocation(
                      latitude: cameraPosition.target.latitude,
                      longitude: cameraPosition.target.longitude,
                    );
                  },
                  initialCameraPosition: cameraPosition,
                ),

                const Center(
                  child: Icon(
                    Icons.location_on,
                    size: 50,
                    color: ColorsManager.red,
                  ),
                ),
              ],
            ),
          ),

          Flexible(
            flex: 2,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SelectedLocationBuilder(),

                  const Spacer(),

                  FilledAppTextButton(
                    buttonText: 'Confirm Location',
                    onPressed: () {
                      final location = context
                          .read<LocationCubit>()
                          .selectedLocation;

                      if (location == null) return;

                      Navigator.pop(context, location);
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
