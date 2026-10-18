import 'package:evetick_organizer/core/di/dependency_injection.dart';
import 'package:evetick_organizer/core/helpers/spacing.dart';
import 'package:evetick_organizer/core/widgets/app_drop_down_form_field.dart';
import 'package:evetick_organizer/core/widgets/app_radio_button.dart';
import 'package:evetick_organizer/core/widgets/app_text_form_field.dart';
import 'package:evetick_organizer/core/widgets/filled_app_text_button.dart';
import 'package:evetick_organizer/features/create_event/logic/cubit/create_event_cubit.dart';
import 'package:evetick_organizer/features/create_event/presentation/widgets/date_time_section_field.dart';
import 'package:evetick_organizer/features/create_event/presentation/widgets/event_location_field.dart';
import 'package:evetick_organizer/features/location/data/models/location_model.dart';
import 'package:evetick_organizer/features/location/data/repos/location_repository.dart';
import 'package:evetick_organizer/features/location/logic/cubit/location_cubit.dart';
import 'package:evetick_organizer/features/location/presentation/screens/map_picker_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class BuildEventDetails extends StatefulWidget {
  const BuildEventDetails({super.key, this.onNextStep});

  final VoidCallback? onNextStep;

  @override
  State<BuildEventDetails> createState() => _BuildEventDetailsState();
}

class _BuildEventDetailsState extends State<BuildEventDetails> {
  final _formKey = GlobalKey<FormState>();

  static const List<String> _categories = [
    'Sports',
    'Music',
    'Medical',
    'Movies',
    'Technology',
    'Business',
    'Education',
    'Entertainment',
    'Arts & Culture',
    'Food & Drink',
    'Health & Wellness',
    'Travel & Adventure',
    'Gaming',
    'Fashion',
    'Networking',
    'Workshops',
    'Conferences',
    'Exhibitions',
    'Festivals',
    'Charity & Social',
  ];

  final titleController = TextEditingController();
  final locationController = TextEditingController();
  final urlController = TextEditingController();
  final startDateController = TextEditingController();
  final startTimeController = TextEditingController();
  final endDateController = TextEditingController();
  final endTimeController = TextEditingController();

  String? selectedCategory;

  DateTime? startDate;
  TimeOfDay? startTime;
  DateTime? endDate;
  TimeOfDay? endTime;

  bool isOnlineEvent = false;
  bool isGettingLocation = false;

  @override
  void dispose() {
    titleController.dispose();
    locationController.dispose();
    urlController.dispose();
    startDateController.dispose();
    startTimeController.dispose();
    endDateController.dispose();
    endTimeController.dispose();
    super.dispose();
  }

  // ---------------------------------------------------------------------
  // Actions
  // ---------------------------------------------------------------------

  Future<void> _pickDate({required bool isStart}) async {
    final initialDate = isStart
        ? (startDate ?? DateTime.now())
        : (endDate ?? startDate ?? DateTime.now());

    final firstDate = isStart ? DateTime.now() : (startDate ?? DateTime.now());

    final picked = await showDatePicker(
      context: context,
      initialDate: initialDate.isBefore(firstDate) ? firstDate : initialDate,
      firstDate: firstDate,
      lastDate: DateTime(firstDate.year + 5),
    );
    if (picked == null) return;

    setState(() {
      if (isStart) {
        startDate = picked;
        startDateController.text = DateFormat('MM/dd/yyyy').format(picked);
        context.read<CreateEventCubit>().updateStartDate(picked);
        if (endDate != null && endDate!.isBefore(picked)) {
          endDate = null;
          endDateController.clear();
          context.read<CreateEventCubit>().clearEndDate();
        }
      } else {
        endDate = picked;
        endDateController.text = DateFormat('MM/dd/yyyy').format(picked);
        context.read<CreateEventCubit>().updateEndDate(picked);
      }
    });
  }

  Future<void> _pickTime({required bool isStart}) async {
    final initialTime = (isStart ? startTime : endTime) ?? TimeOfDay.now();
    final picked = await showTimePicker(
      context: context,
      initialTime: initialTime,
    );
    if (picked == null) return;

    setState(() {
      if (isStart) {
        startTime = picked;
        startTimeController.text = picked.format(context);
        context.read<CreateEventCubit>().updateStartTime(picked);
      } else {
        endTime = picked;
        endTimeController.text = picked.format(context);
        context.read<CreateEventCubit>().updateEndTime(picked);
      }
    });
  }

  Future<void> _pickLocationFromMap() async {
    final location = await Navigator.push<LocationModel>(
      context,
      MaterialPageRoute(
        builder: (context) => BlocProvider(
          create: (context) => getIt<LocationCubit>(),
          child: const MapPickerScreen(),
        ),
      ),
    );
    if (location != null && location.address != null) {
      locationController.text = location.address!;
      if (mounted) {
        context.read<CreateEventCubit>().updateLocation(location.address!);
      }
    }
  }

  Future<void> _getCurrentLocation() async {
    setState(() => isGettingLocation = true);
    try {
      final location = await getIt<LocationRepository>().getCurrentLocation();
      if (location.address != null) {
        locationController.text = location.address!;
        if (mounted) {
          context.read<CreateEventCubit>().updateLocation(location.address!);
        }
      } else if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Could not get address from location')),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Error getting location: $e')));
      }
    } finally {
      if (mounted) setState(() => isGettingLocation = false);
    }
  }

  void _onNextStepPressed() {
    final isValid = _formKey.currentState?.validate() ?? false;

    if (startDateController.text.isEmpty || startTimeController.text.isEmpty) {
      _showSnack('Please select a start date & time');
      return;
    }
    if (endDateController.text.isEmpty || endTimeController.text.isEmpty) {
      _showSnack('Please select an end date & time');
      return;
    }
    if (!isOnlineEvent && locationController.text.trim().isEmpty) {
      _showSnack('Please enter the event location');
      return;
    }
    if (isOnlineEvent && urlController.text.trim().isEmpty) {
      _showSnack('Please enter the event URL');
      return;
    }
    if (!isValid) return;

    final startDateTime = DateTime(
      startDate!.year,
      startDate!.month,
      startDate!.day,
      startTime!.hour,
      startTime!.minute,
    );
    final endDateTime = DateTime(
      endDate!.year,
      endDate!.month,
      endDate!.day,
      endTime!.hour,
      endTime!.minute,
    );
    if (!endDateTime.isAfter(startDateTime)) {
      _showSnack('End date & time must be after start date & time');
      return;
    }
    widget.onNextStep?.call();
  }

  void _showSnack(String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppTextFormField(
              hintText: 'Enter catchy event name',
              label: 'Event Title',
              controller: titleController,
              onChanged: (value) =>
                  context.read<CreateEventCubit>().updateTitle(value),
              validator: (value) => (value == null || value.trim().isEmpty)
                  ? 'Please enter event title'
                  : null,
            ),
            verticalSpace(24),

            AppDropdownFormField<String>(
              label: 'Category',
              hintText: 'Select event category',
              value: selectedCategory,
              items: _categories,
              itemLabel: (item) => item,
              validator: (value) =>
                  value == null ? 'Please select a category' : null,
              onChanged: (value) {
                setState(() => selectedCategory = value);
                context.read<CreateEventCubit>().updateCategory(value!);
              },
            ),
            verticalSpace(24),

            DateTimeSectionField(
              title: 'Start Date & Time',
              dateController: startDateController,
              timeController: startTimeController,
              onPickDate: () => _pickDate(isStart: true),
              onPickTime: () => _pickTime(isStart: true),
            ),
            verticalSpace(24),

            DateTimeSectionField(
              title: 'End Date & Time',
              dateController: endDateController,
              timeController: endTimeController,
              onPickDate: () => _pickDate(isStart: false),
              onPickTime: () => _pickTime(isStart: false),
            ),
            verticalSpace(24),

            if (isOnlineEvent)
              AppTextFormField(
                controller: urlController,
                label: 'Event URL',
                hintText: 'Enter event URL (e.g. Zoom link)',
                onChanged: (value) =>
                    context.read<CreateEventCubit>().updateEventUrl(value),
                validator: (value) => (value == null || value.trim().isEmpty)
                    ? 'Please enter event URL'
                    : null,
              )
            else
              EventLocationField(
                controller: locationController,
                isOnlineEvent: isOnlineEvent,
                isGettingLocation: isGettingLocation,
                onChanged: (value) =>
                    context.read<CreateEventCubit>().updateLocation(value),
                onGetCurrentLocation: _getCurrentLocation,
                onPickFromMap: _pickLocationFromMap,
              ),
            verticalSpace(12),

            AppRadioButton(
              value: isOnlineEvent,
              label: 'Online event (Virtual)',
              onChanged: (value) {
                context.read<CreateEventCubit>().updateIsOnlineEvent(value);
                setState(() => isOnlineEvent = value);
              },
            ),
            verticalSpace(32),

            FilledAppTextButton(
              buttonText: 'Next Step',
              onPressed: _onNextStepPressed,
            ),
            verticalSpace(24),
          ],
        ),
      ),
    );
  }
}
