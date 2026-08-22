import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evetick_organizer/core/services/failure.dart';
import 'package:evetick_organizer/core/services/firebase_error_handler.dart';
import 'package:evetick_organizer/core/services/result.dart';
import 'package:evetick_organizer/features/profile/data/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class ProfileRepository {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseStorage storage = FirebaseStorage.instance;
  final ImagePicker _picker = ImagePicker();

  Future<Result<UserModel>> getUserData() async {
    try {
      final user = auth.currentUser;
      if (user == null) {
        return Result.failure(FirebaseFailure('User is not logged in'));
      }
      final doc = await firestore.collection('users').doc(user.uid).get();
      if (!doc.exists) {
        return Result.failure(FirebaseFailure('User data not found'));
      }
      final userdata = UserModel.fromJson(doc.data()!, user.uid);
      return Result.success(userdata);
    } on FirebaseException catch (e) {
      return Result.failure(FirebaseErrorHandler.handleFirestore(e));
    } catch (e) {
      return Result.failure(FirebaseErrorHandler.handleGeneric(e));
    }
  }

  Future<Result<File>> pickImage() async {
    try {
      final image = await _picker.pickImage(source: ImageSource.gallery);
      if (image == null) {
        return Result.failure(FirebaseFailure('Image selection cancelled'));
      }
      return Result.success(File(image.path));
    } catch (e) {
      return Result.failure(FirebaseErrorHandler.handleGeneric(e));
    }
  }

  Future<Result<String>> uploadImage(File image) async {
    try {
      final uid = auth.currentUser!.uid;
      final ref = storage.ref().child(
      'profile_images/$uid/profile.jpg',
    );

      await ref.putFile(image);

      final imageUrl = await ref.getDownloadURL();
      return Result.success(imageUrl);
    }  on FirebaseException catch (e) {
    return Result.failure(
      FirebaseErrorHandler.handleStorage(e),
    );
  } catch (e) {
      return Result.failure(FirebaseErrorHandler.handleGeneric(e));
    }
  }

  Future<Result<void>> updateProfileImage(String imageUrl) async {
    try {
      final uid = auth.currentUser!.uid;
      await firestore.collection('users').doc(uid).update({
        'imageUrl': imageUrl,
      });
      return Result.success(null);
    } on FirebaseException catch (e) {
      return Result.failure(FirebaseErrorHandler.handleFirestore(e));
    } catch (e) {
      return Result.failure(FirebaseErrorHandler.handleGeneric(e));
    }
  }

  Future<Result<void>> updateProfile({
    required String name,
    required String address,
    String? phone,
  }) async {
    try {
      final uid = auth.currentUser!.uid;
      await firestore.collection('users').doc(uid).update({
        'name': name,
        'address': address,
        if (phone != null) 'phone': phone,
      });
      return Result.success(null);
    } on FirebaseException catch (e) {
      return Result.failure(FirebaseErrorHandler.handleFirestore(e));
    } catch (e) {
      return Result.failure(FirebaseErrorHandler.handleGeneric(e));
    }
  }

  Future<Result<String>> uploadProfileImage() async {
    final pickedImage = await pickImage();

    return await pickedImage.when(
      success: (image) async {
        final uploadedImage = await uploadImage(image);

        return await uploadedImage.when(
          success: (imageUrl) async {
            final updateResult = await updateProfileImage(imageUrl);

            return updateResult.when(
              success: (_) => Result.success(imageUrl),
              failure: (failure) => Result.failure(failure),
            );
          },
          failure: (failure) => Result.failure(failure),
        );
      },
      failure: (failure) => Result.failure(failure),
    );
  }
}
