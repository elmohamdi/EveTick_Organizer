import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evetick_organizer/core/services/failure.dart';
import 'package:evetick_organizer/core/services/firebase_error_handler.dart';
import 'package:evetick_organizer/core/services/result.dart';
import 'package:evetick_organizer/features/auth/data/models/app_user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<Result<AppUserModel>> login({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password,
      );
      final firebaseUser = userCredential.user!;

      await firebaseUser.reload();
      final refreshedUser = auth.currentUser!;

      if (!refreshedUser.emailVerified) {
        await auth.signOut();
        return Result.failure(
          FirebaseFailure('Please verify your email before logging in'),
        );
      }
      final docRef = firestore.collection('users').doc(refreshedUser.uid);
      final doc = await firestore
          .collection('users')
          .doc(refreshedUser.uid)
          .get();

      if (!doc.exists) {
        await auth.signOut();
        return Result.failure(FirebaseFailure('User data not found'));
      }

      final data = doc.data()!;
      if (data['isEmailVerified'] != true) {
        await docRef.update({'isEmailVerified': true});
        data['isEmailVerified'] = true;
      }

      final user = AppUserModel.fromJson(doc.data()!);

      return Result.success(user);
    } on FirebaseAuthException catch (e) {
      return Result.failure(FirebaseErrorHandler.handle(e));
    } catch (e) {
      return Result.failure(FirebaseErrorHandler.handleGeneric(e));
    }
  }

  Future<Result<AppUserModel>> signup({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password,
      );
      await userCredential.user!.updateDisplayName(name.trim());

      await userCredential.user!.sendEmailVerification();

      AppUserModel user = AppUserModel(
        uid: userCredential.user!.uid,
        email: email.trim(),
        name: name.trim(),
        isEmailVerified: false,
        isGuest: false,
        role: 'Organizer',
      );
      await firestore.collection('users').doc(user.uid).set(user.toJson());

      await auth.signOut();

      return Result.success(user);
    } on FirebaseAuthException catch (e) {
      return Result.failure(FirebaseErrorHandler.handle(e));
    } catch (e) {
      return Result.failure(FirebaseErrorHandler.handleGeneric(e));
    }
  }

  Future<AppUserModel?> getCurrentUser() async {
    final firebaseUser = auth.currentUser;

    if (firebaseUser == null) return null;

    final doc = await firestore.collection('users').doc(firebaseUser.uid).get();

    if (!doc.exists) return null;

    return AppUserModel.fromJson(doc.data()!);
  }

  Future<Result<AppUserModel>> continueAsGuest() async {
    try {
      final credential = await auth.signInAnonymously();

      final user = AppUserModel(
        uid: credential.user!.uid,
        email: '',
        name: 'Guest',
        isEmailVerified: false,
        isGuest: true,
        role: 'Not Submitted , Guest',
      );

      final docRef = firestore.collection('users').doc(user.uid);
      final doc = await docRef.get();

      if (!doc.exists) {
        await docRef.set(user.toJson());
      }

      return Result.success(user);
    } on FirebaseAuthException catch (e) {
      return Result.failure(FirebaseErrorHandler.handle(e));
    } catch (e) {
      return Result.failure(FirebaseErrorHandler.handleGeneric(e));
    }
  }

  Future<void> logout() async {
    await auth.signOut();
  }
}
