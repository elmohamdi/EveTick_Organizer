import 'package:evetick_organizer/core/helpers/spacing.dart';
import 'package:evetick_organizer/core/theming/colors.dart';
import 'package:evetick_organizer/core/theming/text_styles.dart';
import 'package:evetick_organizer/core/widgets/filled_app_text_button.dart';
import 'package:evetick_organizer/features/localization/logic/locale_cubit.dart';
import 'package:evetick_organizer/features/localization/ui/language_tile_widget.dart';
import 'package:evetick_organizer/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LanguageBottomSheet extends StatefulWidget {
  const LanguageBottomSheet({super.key});

  @override
  State<LanguageBottomSheet> createState() => _LanguageBottomSheetState();
}

class _LanguageBottomSheetState extends State<LanguageBottomSheet> {
  String selectedLanguage = 'en';

  @override
  void initState() {
    super.initState();
    selectedLanguage = context.read<LocaleCubit>().state.locale.languageCode;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 16.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Icon(Icons.language, color: ColorsManager.orange),
                  horizontalSpace(8),
                  Text(
                    AppLocalizations.of(context)!.settingsSelectLanguage,
                    style: TextStyles.font18WhiteBold(context),
                  ),
                ],
              ),
              verticalSpace(32),
              RadioTheme(
                data: RadioThemeData(
                  fillColor: WidgetStatePropertyAll(ColorsManager.orange),
                ),
                child: RadioGroup<String>(
                  groupValue: selectedLanguage,
                  onChanged: (value) {
                    setState(() {
                      selectedLanguage = value!;
                    });
                  },
                  child: Column(
                    children: [
                      LanguageTile(
                        title: AppLocalizations.of(
                          context,
                        )!.settingsLanguageOptionsEnglish,
                        subtitle: AppLocalizations.of(
                          context,
                        )!.settingsDefaultLanguage,
                        value: 'en',
                      ),
                      verticalSpace(8),
                      LanguageTile(
                        title: AppLocalizations.of(
                          context,
                        )!.settingsLanguageOptionsArabic,
                        subtitle: AppLocalizations.of(
                          context,
                        )!.settingsArabicLanguage,

                        value: 'ar',
                      ),
                    ],
                  ),
                ),
              ),
              verticalSpace(40),
              FilledAppTextButton(
                buttonText: AppLocalizations.of(
                  context,
                )!.settingsApplySelection,
                onPressed: () async {
                  await context.read<LocaleCubit>().changeLanguage(
                    selectedLanguage,
                  );
                  if (context.mounted) {
                    Navigator.pop(context);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
