import 'package:evetick_organizer/core/theming/colors.dart';
import 'package:evetick_organizer/core/widgets/app_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EventLocationField extends StatelessWidget {
  const EventLocationField({
    super.key,
    required this.controller,
    required this.isOnlineEvent,
    required this.isGettingLocation,
    required this.onChanged,
    required this.onGetCurrentLocation,
    required this.onPickFromMap,
  });

  final TextEditingController controller;
  final bool isOnlineEvent;
  final bool isGettingLocation;
  final ValueChanged<String> onChanged;
  final VoidCallback onGetCurrentLocation;
  final VoidCallback onPickFromMap;

  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      onChanged: onChanged,
      hintText: 'Search or enter location',
      label: 'Event Location',
      controller: controller,
      suffixIcon: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (isGettingLocation)
            Container(
              margin: EdgeInsets.only(right: 8.w),
              width: 16.w,
              height: 16.w,
              child: const CircularProgressIndicator(strokeWidth: 2),
            )
          else
            IconButton(
              padding: EdgeInsets.zero,
              icon: Icon(
                Icons.my_location,
                color: ColorsManager.orange,
                size: 22.sp,
              ),
              onPressed: onGetCurrentLocation,
            ),
          IconButton(
            padding: EdgeInsets.zero,
            icon: Icon(
              Icons.map_outlined,
              color: ColorsManager.orange,
              size: 22.sp,
            ),
            onPressed: onPickFromMap,
          ),
        ],
      ),
      validator: (value) {
        if (!isOnlineEvent && (value == null || value.trim().isEmpty)) {
          return 'Please enter the event location';
        }
        return null;
      },
    );
  }
}
