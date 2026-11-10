import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evetick_organizer/core/services/failure.dart';
import 'package:evetick_organizer/core/services/firebase_error_handler.dart';
import 'package:evetick_organizer/core/services/result.dart';
import 'package:evetick_organizer/features/auth/data/models/app_user_model.dart';
import 'package:evetick_organizer/features/auth/data/models/reauth_method.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class AuthRepository {
  static const String signInCancelledMessage = 'Sign-in was cancelled';

  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseStorage storage = FirebaseStorage.instance;

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

  Future<Result<AppUserModel>> signInWithGoogle() =>
      _signInWithProvider(GoogleAuthProvider()..addScope('email'));

  /// OAuth flow (Google) through Firebase's own provider
  /// sign-in: no extra packages needed. Creates the `users/{uid}` document the
  /// first time, exactly like a normal signup (role: Organizer).
  Future<Result<AppUserModel>> _signInWithProvider(
    AuthProvider provider,
  ) async {
    try {
      final credential = await auth.signInWithProvider(provider);
      final firebaseUser = credential.user!;

      final docRef = firestore.collection('users').doc(firebaseUser.uid);
      final doc = await docRef.get();

      if (!doc.exists) {
        final user = AppUserModel(
          uid: firebaseUser.uid,
          email: firebaseUser.email ?? '',
          name: firebaseUser.displayName ?? '',
          // The provider already verified the account.
          isEmailVerified: true,
          isGuest: false,
          role: 'Organizer',
        );
        await docRef.set(user.toJson());
        return Result.success(user);
      }

      return Result.success(AppUserModel.fromJson(doc.data()!));
    } on FirebaseAuthException catch (e) {
      return Result.failure(FirebaseErrorHandler.handle(e));
    } catch (e) {
      return Result.failure(FirebaseErrorHandler.handleGeneric(e));
    }
  }

  Future<void> logout() async {
    await auth.signOut();
  }

  /// Records that the signed-in user accepted the terms.
  Future<Result<void>> acceptTerms() async {
    try {
      final user = auth.currentUser;
      if (user == null) {
        return Result.failure(FirebaseFailure('User is not logged in'));
      }
      await firestore.collection('users').doc(user.uid).update({
        'termsAccepted': true,
        'termsAcceptedAt': FieldValue.serverTimestamp(),
      });
      return Result.success(null);
    } on FirebaseException catch (e) {
      return Result.failure(FirebaseErrorHandler.handleFirestore(e));
    } catch (e) {
      return Result.failure(FirebaseErrorHandler.handleGeneric(e));
    }
  }

  /// Sends Firebase's password reset email to [email].
  Future<Result<void>> sendPasswordResetEmail(String email) async {
    try {
      await auth.sendPasswordResetEmail(email: email.trim());
      return Result.success(null);
    } on FirebaseAuthException catch (e) {
      return Result.failure(FirebaseErrorHandler.handle(e));
    } catch (e) {
      return Result.failure(FirebaseErrorHandler.handleGeneric(e));
    }
  }

  /// How the current user must confirm a sensitive action.
  ReauthMethod get reauthMethod {
    final user = auth.currentUser;
    if (user == null) return ReauthMethod.none;

    final providerIds = user.providerData.map((info) => info.providerId);
    if (providerIds.contains('google.com')) return ReauthMethod.google;
    if (providerIds.contains('password')) return ReauthMethod.password;
    return ReauthMethod.none;
  }

  /// Permanently deletes the signed-in user: confirms their identity again,
  /// removes their profile document and image, then the Firebase account.
  ///
  /// [password] is required for email/password accounts.
  Future<Result<void>> deleteAccount({String? password}) async {
    try {
      final user = auth.currentUser;
      if (user == null) {
        return Result.failure(FirebaseFailure('User is not logged in'));
      }

      // Firebase only allows deleting an account after a recent sign-in.
      await _reauthenticate(user, password);

      // Data first: the rules need the user to still be signed in.
      await firestore.collection('users').doc(user.uid).delete();
      await _deleteProfileImage(user.uid);

      await user.delete();
      return Result.success(null);
    } on FirebaseAuthException catch (e) {
      return Result.failure(FirebaseErrorHandler.handle(e));
    } on FirebaseException catch (e) {
      return Result.failure(FirebaseErrorHandler.handleFirestore(e));
    } catch (e) {
      return Result.failure(FirebaseErrorHandler.handleGeneric(e));
    }
  }

  Future<void> _reauthenticate(User user, String? password) async {
    switch (reauthMethod) {
      case ReauthMethod.google:
        await user.reauthenticateWithProvider(
          GoogleAuthProvider()..addScope('email'),
        );
      case ReauthMethod.password:
        await user.reauthenticateWithCredential(
          EmailAuthProvider.credential(
            email: user.email ?? '',
            password: password ?? '',
          ),
        );
      case ReauthMethod.none:
        break;
    }
  }

  Future<void> _deleteProfileImage(String uid) async {
    try {
      await storage.ref().child('profile_images/$uid/profile.jpg').delete();
    } on FirebaseException catch (_) {
      // The user may never have uploaded a profile image.
    }
  }
}
