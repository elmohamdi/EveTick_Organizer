import 'package:evetick_organizer/features/location/logic/cubit/location_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectedLocationBuilder extends StatelessWidget {
  const SelectedLocationBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocationCubit, LocationState>(
      builder: (context, state) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          child: state.maybeWhen(
            loaded: (location) => Text(location.address ?? ''),
            locationUpdated: (location) => Text(location.address ?? ''),
            locationSelected: (location) => Text(location.address ?? ''),
            orElse: () => const SizedBox.shrink(),
          ),
        );
      },
    );
  }
}
