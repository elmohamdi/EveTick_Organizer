import 'package:evetick_organizer/core/helpers/app_regex.dart';
import 'package:evetick_organizer/core/helpers/spacing.dart';
import 'package:evetick_organizer/core/theming/colors.dart';
import 'package:evetick_organizer/core/widgets/app_text_form_field.dart';
import 'package:evetick_organizer/features/auth/logic/signup_cubit/signup_cubit.dart';
import 'package:evetick_organizer/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NameEmailAndPassword extends StatefulWidget {
  const NameEmailAndPassword({super.key});

  @override
  State<NameEmailAndPassword> createState() => _NameEmailAndPasswordState();
}

class _NameEmailAndPasswordState extends State<NameEmailAndPassword> {
  bool isObscureText = true;


  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    
    return Form(
      key: context.read<SignupCubit>().formKey,
      child: Column(
        children: [
          AppTextFormField(
            label:  AppLocalizations.of(context)!.authFullNameLabel,
            hintText: AppLocalizations.of(context)!.authFullNamePlaceholder,
            validator: (value){
              if(value == null || value.isEmpty){
                return 'Please enter a valid name';
              }
            },
            controller: context.read<SignupCubit>().nameController,
          ),
          verticalSpace(16),
          AppTextFormField(
            label: AppLocalizations.of(context)!.authEmailAddressLabel,
            hintText: AppLocalizations.of(context)!.authEmailPlaceholder,
            suffixIcon: Icon(
              Icons.email_outlined,
              color: ColorsManager.lightGray,
              size: 24.sp,
            ),
            validator: (value){
              if(value == null || value.isEmpty){
                return 'Please enter a valid email';
              }
            },
            controller: context.read<SignupCubit>().emailController,
          ),
          verticalSpace(16),

          AppTextFormField(
            label: AppLocalizations.of(context)!.authPasswordLabel,
            hintText: AppLocalizations.of(context)!.authPasswordPlaceholder,
            isObscureText: isObscureText,
            controller: context.read<SignupCubit>().passwordController,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isObscureText = !isObscureText;
                });
              },
              child: Icon(
                isObscureText ? Icons.visibility_off : Icons.visibility,
                color: ColorsManager.lightGray,
                size: 24.sp,
              ),
            ),
            validator: (value) {
              if(value == null || value.isEmpty || AppRegex.isPasswordValid(value)){
                return 'Please enter a valid password';
              }
            },
          ),
        ],
      ),
    );
  }
}
