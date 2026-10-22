enum LocationErrorType { serviceDisabled, permissionDenied, addressNotFound }

/// A location failure the UI can react to (and localize) without parsing the
/// message. [toString] returns [message], so code that still shows
/// `e.toString()` keeps working.
class LocationException implements Exception {
  const LocationException(this.type, this.message);

  final LocationErrorType type;
  final String message;

  @override
  String toString() => message;
}
