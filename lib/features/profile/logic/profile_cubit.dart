import 'package:evetick_organizer/core/services/result.dart';
import 'package:evetick_organizer/features/profile/data/profile_repository.dart';
import 'package:evetick_organizer/features/profile/logic/profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepository profileRepo;
  ProfileCubit(this.profileRepo) : super(ProfileState.initial());

  void getUserData() async {
    emit(const ProfileState.loading());
    final result = await profileRepo.getUserData();
    result.when(
      success: (user) {
        emit(ProfileState.success(user));
      },
      failure: (failure) {
        emit(ProfileState.error(error: failure.message));
      },
    );
  }

  Future<void> uploadProfileImage() async {
    emit(const ProfileState.uploadingImage());

    final result = await profileRepo.uploadProfileImage();

    result.when(
      success: (imageUrl) {
        getUserData();
      },
      failure: (failure) {
        emit(ProfileState.error(error: failure.message));
      },
    );
  }

  Future<void> updateProfile({
    required String name,
    required String address,
    String? phone,
  }) async {
    emit(const ProfileState.updatingProfile());

    final result = await profileRepo.updateProfile(
      name: name,
      address: address,
      phone: phone,
    );

    result.when(
      success: (_) {
        getUserData(); // Refresh user data on success
      },
      failure: (failure) {
        emit(ProfileState.error(error: failure.message));
      },
    );
  }
}
