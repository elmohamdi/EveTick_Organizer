import 'package:evetick_organizer/core/helpers/spacing.dart';
import 'package:evetick_organizer/core/theming/text_styles.dart';
import 'package:evetick_organizer/core/widgets/app_text_form_field.dart';
import 'package:flutter/material.dart';

class DateTimeSectionField extends StatelessWidget {
  const DateTimeSectionField({
    super.key,
    required this.title,
    required this.dateController,
    required this.timeController,
    required this.onPickDate,
    required this.onPickTime,
  });

  final String title;
  final TextEditingController dateController;
  final TextEditingController timeController;
  final VoidCallback onPickDate;
  final VoidCallback onPickTime;

  String? _requiredValidator(String? value) {
    if (value == null || value.isEmpty) return '';
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TextStyles.font16WhiteRegular(context)),
        verticalSpace(8),
        Row(
          children: [
            Expanded(
              child: AppTextFormField(
                hintText: 'mm/dd/yyyy',
                readOnly: true,
                controller: dateController,
                validator: _requiredValidator,
                onTap: onPickDate,
              ),
            ),
            horizontalSpace(12),
            Expanded(
              child: AppTextFormField(
                hintText: '-- : -- --',
                readOnly: true,
                controller: timeController,
                validator: _requiredValidator,
                onTap: onPickTime,
              ),
            ),
          ],
        ),
      ],
    );
  }
}