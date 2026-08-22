abstract class Failure {
  final String message;

  Failure(this.message);
}

class FirebaseFailure extends Failure {
  FirebaseFailure(super.message);
}