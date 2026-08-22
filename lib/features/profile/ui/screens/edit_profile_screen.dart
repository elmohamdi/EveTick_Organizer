import 'package:evetick_organizer/core/helpers/app_regex.dart';
import 'package:evetick_organizer/core/helpers/spacing.dart';
import 'package:evetick_organizer/core/widgets/app_text_form_field.dart';
import 'package:evetick_organizer/features/profile/logic/profile_cubit.dart';
import 'package:evetick_organizer/features/profile/logic/profile_state.dart';
import 'package:evetick_organizer/features/profile/ui/widgets/edit_profile_app_bar.dart';
import 'package:evetick_organizer/features/profile/ui/widgets/profile_header.dart';
import 'package:evetick_organizer/l10n/app_localizations.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  var isEditing = false;
  var _isSavingProfile = false;
  final formKey = GlobalKey<FormState>();

  late final TextEditingController nameController;
  late final TextEditingController phoneController;
  late final TextEditingController addressController;
  late final TextEditingController emailController;
  bool initialized = false;

  @override
  void initState() {
    super.initState();

    nameController = TextEditingController();
    phoneController = TextEditingController();
    addressController = TextEditingController();
    emailController = TextEditingController();

    context.read<ProfileCubit>().getUserData();
  }

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    addressController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<ProfileCubit, ProfileState>(
          listener: (context, state) {
            state.whenOrNull(
              success: (user) {
                nameController.text = user.name;
                addressController.text = user.address ?? '';
                phoneController.text = user.phone ?? '';
                emailController.text = user.email ?? FirebaseAuth.instance.currentUser?.email ?? '';

                if (_isSavingProfile) {
                  setState(() {
                    _isSavingProfile = false;
                    isEditing = false;
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(AppLocalizations.of(context)!.profileUpdatedSuccess),
                      backgroundColor: Colors.green,
                    ),
                  );
                }
              },
              error: (error) {
                if (_isSavingProfile) {
                  setState(() {
                    _isSavingProfile = false;
                  });
                }
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(error),
                    backgroundColor: Colors.red,
                  ),
                );
              },
            );
          },
          builder: (context, state) {
            final isLoading = _isSavingProfile || state is UpdatingProfile;

            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      EditProfileAppBar(
                        isEditing: isEditing,
                        isLoading: isLoading,
                        onActionPressed: isLoading
                            ? () {}
                            : () {
                                if (isEditing) {
                                  if (formKey.currentState!.validate()) {
                                    setState(() {
                                      _isSavingProfile = true;
                                    });
                                    context.read<ProfileCubit>().updateProfile(
                                      name: nameController.text.trim(),
                                      address: addressController.text.trim(),
                                      phone: phoneController.text.trim(),
                                    );
                                  }
                                } else {
                                  setState(() {
                                    isEditing = true;
                                  });
                                }
                              },
                      ),
                      verticalSpace(16),
                      ProfileHeader(isEditable: isEditing),

                      verticalSpace(14),
                      AppTextFormField(
                        label: AppLocalizations.of(context)!.profileFullName,
                        controller: nameController,
                        hintText: AppLocalizations.of(context)!.profileFullNameHint,
                        readOnly: !isEditing || isLoading,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return AppLocalizations.of(context)!.profileFullNameRequired;
                          }
                          return null;
                        },
                      ),
                      verticalSpace(16),
                      AppTextFormField(
                        keyboardType: TextInputType.emailAddress,
                        label: AppLocalizations.of(context)!.profileEmail,
                        controller: emailController,
                        hintText: AppLocalizations.of(context)!.profileEmailHint,
                        readOnly: true,
                        validator: (_) => null,
                      ),
                      verticalSpace(16),

                      AppTextFormField(
                        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                        keyboardType: TextInputType.phone,
                        label: AppLocalizations.of(context)!.profilePhone,
                        controller: phoneController,
                        hintText: AppLocalizations.of(context)!.profilePhoneHint,
                        readOnly: !isEditing || isLoading,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return null;
                          }

                          if (!AppRegex.isPhoneNumberValid(value)) {
                            return AppLocalizations.of(context)!.profilePhoneInvalid;
                          }

                          return null;
                        },
                      ),

                      verticalSpace(16),
                      AppTextFormField(
                        label: AppLocalizations.of(context)!.profileAddress,
                        controller: addressController,
                        hintText: AppLocalizations.of(context)!.profileAddressHint,
                        readOnly: !isEditing || isLoading,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return AppLocalizations.of(context)!.profileAddressRequired;
                          }
                          return null;
                        },
                      ),
                      verticalSpace(20),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
