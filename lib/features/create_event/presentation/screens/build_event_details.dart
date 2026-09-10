import 'package:evetick_organizer/core/helpers/spacing.dart';
import 'package:evetick_organizer/core/theming/colors.dart';
import 'package:evetick_organizer/core/theming/text_styles.dart';
import 'package:evetick_organizer/core/widgets/app_drop_down_form_field.dart';
import 'package:evetick_organizer/core/widgets/app_radio_button.dart';
import 'package:evetick_organizer/core/widgets/app_text_form_field.dart';
import 'package:evetick_organizer/core/widgets/filled_app_text_button.dart';
import 'package:flutter/material.dart';
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

  final List<String> categories = ['Sport', 'Music', 'Medical', 'Movies'];

  final TextEditingController titleController = TextEditingController();
  final TextEditingController locationController = TextEditingController();

  final TextEditingController startDateController = TextEditingController();
  final TextEditingController startTimeController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();
  final TextEditingController endTimeController = TextEditingController();

  String? selectedCategory;

  DateTime? startDate;
  TimeOfDay? startTime;
  DateTime? endDate;
  TimeOfDay? endTime;

  bool isOnlineEvent = true;

  @override
  void dispose() {
    titleController.dispose();
    locationController.dispose();
    startDateController.dispose();
    startTimeController.dispose();
    endDateController.dispose();
    endTimeController.dispose();
    super.dispose();
  }

  Future<void> _pickDate({required bool isStart}) async {
    final DateTime initialDate = isStart
        ? (startDate ?? DateTime.now())
        : (endDate ?? startDate ?? DateTime.now());

    final DateTime firstDate = isStart
        ? DateTime.now()
        : (startDate ?? DateTime.now());

    final DateTime? picked = await showDatePicker(
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

        if (endDate != null && endDate!.isBefore(picked)) {
          endDate = null;
          endDateController.clear();
        }
      } else {
        endDate = picked;
        endDateController.text = DateFormat('MM/dd/yyyy').format(picked);
      }
    });
  }

  Future<void> _pickTime({required bool isStart}) async {
    final TimeOfDay initialTime =
        (isStart ? startTime : endTime) ?? TimeOfDay.now();

    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: initialTime,
    );

    if (picked == null) return;

    setState(() {
      if (isStart) {
        startTime = picked;
        startTimeController.text = picked.format(context);
      } else {
        endTime = picked;
        endTimeController.text = picked.format(context);
      }
    });
  }

  void _onNextStepPressed() {
    final bool isValid = _formKey.currentState?.validate() ?? false;

    if (startDateController.text.isEmpty || startTimeController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select a start date & time')),
      );
      return;
    }

    if (endDateController.text.isEmpty || endTimeController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select an end date & time')),
      );
      return;
    }

    if (!isOnlineEvent && locationController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter the event location')),
      );
      return;
    }

    if (!isValid) return;

    widget.onNextStep?.call();
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
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Please enter event title';
                }
                return null;
              },
            ),

            verticalSpace(24),

            AppDropdownFormField<String>(
              label: 'Category',
              hintText: 'Select event category',
              value: selectedCategory,
              items: categories,
              itemLabel: (item) => item,
              onChanged: (value) {
                setState(() {
                  selectedCategory = value;
                });
              },
              validator: (value) {
                if (value == null) {
                  return 'Please select a category';
                }
                return null;
              },
            ),

            verticalSpace(24),

            Text('Start Date & Time', style: TextStyles.font16WhiteRegular(context)),
            verticalSpace(8),
            Row(
              children: [
                Expanded(
                  child: AppTextFormField(
                    hintText: 'mm/dd/yyyy',
                    readOnly: true,
                    controller: startDateController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '';
                      }
                      return null;
                    },
                    onTap: () => _pickDate(isStart: true),
                  ),
                ),
                horizontalSpace(12),
                Expanded(
                  child: AppTextFormField(
                    hintText: '-- : -- --',
                    readOnly: true,
                    controller: startTimeController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '';
                      }
                      return null;
                    },
                    onTap: () => _pickTime(isStart: true),
                  ),
                ),
              ],
            ),

            verticalSpace(24),

            Text('End Date & Time', style: TextStyles.font16WhiteRegular(context)),
            verticalSpace(8),
            Row(
              children: [
                Expanded(
                  child: AppTextFormField(
                    hintText: 'mm/dd/yyyy',
                    readOnly: true,
                    controller: endDateController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '';
                      }
                      return null;
                    },
                    onTap: () => _pickDate(isStart: false),
                  ),
                ),
                horizontalSpace(12),
                Expanded(
                  child: AppTextFormField(
                    hintText: '-- : -- --',
                    readOnly: true,
                    controller: endTimeController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '';
                      }
                      return null;
                    },
                    onTap: () => _pickTime(isStart: false),
                  ),
                ),
              ],
            ),

            verticalSpace(24),

            AppTextFormField(
              hintText: 'Search or enter location',
              label: 'Event Location',
              controller: locationController,
              suffixIcon: Icon(
                Icons.map_outlined,
                color: ColorsManager.orange,
                size: 22.sp,
              ),
              validator: (value) {
                if (!isOnlineEvent && (value == null || value.trim().isEmpty)) {
                  return 'Please enter the event location';
                }
                return null;
              },
            ),

            verticalSpace(12),

            AppRadioButton(
              value: isOnlineEvent,
              label: 'Online event (Virtual)',
              onChanged: (value) {
                setState(() {
                  isOnlineEvent = value;
                });
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