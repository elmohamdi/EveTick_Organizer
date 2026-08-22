import 'package:firebase_auth/firebase_auth.dart';

import 'failure.dart';

class FirebaseErrorHandler {
  static FirebaseFailure handle(FirebaseAuthException e) {
    switch (e.code) {
      case 'invalid-credential':
        return FirebaseFailure('Invalid email or password');

      case 'user-not-found':
        return FirebaseFailure('No account found with this email');

      case 'wrong-password':
        return FirebaseFailure('Incorrect password');

      case 'user-disabled':
        return FirebaseFailure('This account has been disabled');
      
      //sign up errors

      case 'email-already-in-use':
        return FirebaseFailure('This email is already registered');

      case 'weak-password':
        return FirebaseFailure('Password is too weak, use a stronger one');

      case 'invalid-email':
        return FirebaseFailure('Invalid email format');

      case 'operation-not-allowed':
        return FirebaseFailure('This sign-in method is not enabled');

      //public errors

      case 'too-many-requests':
        return FirebaseFailure('Too many attempts, try again later');

      case 'network-request-failed':
        return FirebaseFailure('No internet connection');

      case 'user-token-expired':
        return FirebaseFailure('Session expired, please login again');


      default:
        return FirebaseFailure('Error code: ${e.code} | ${e.message}');
    }
  }

  static FirebaseFailure handleGeneric(Object e) {
    return FirebaseFailure('Something went wrong, please try again');
  }
  
  static FirebaseFailure handleFirestore(FirebaseException e) {
  switch (e.code) {
    case 'permission-denied':
      return FirebaseFailure('Permission denied');

    case 'unavailable':
      return FirebaseFailure('Service unavailable');

    case 'not-found':
      return FirebaseFailure('Data not found');

    default:
      return FirebaseFailure(
        'Firestore Error: ${e.code}',
      );
  }
}

static FirebaseFailure handleStorage(FirebaseException e) {
  switch (e.code) {
    case 'object-not-found':
      return FirebaseFailure('File not found');

    case 'unauthorized':
      return FirebaseFailure('Unauthorized');

    case 'canceled':
      return FirebaseFailure('Upload cancelled');

    case 'unknown':
      return FirebaseFailure('Unknown storage error');

    default:
      return FirebaseFailure(e.message ?? 'Storage Error');
  }
}
}
