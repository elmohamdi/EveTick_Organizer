import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_state.freezed.dart';

@freezed
class ProfileState<T> with _$ProfileState<T> {
  const factory ProfileState.initial() = _Initial;
  const factory ProfileState.loading() =Loading;
  const factory ProfileState.success(T data) =Success<T>;
  const factory ProfileState.error({required String error}) =Error;
  const factory ProfileState.updatingProfile() = UpdatingProfile;
  const factory ProfileState.uploadingImage() = UploadingImage;
}
