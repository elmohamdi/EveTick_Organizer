/// A screenshot the organizer picked to send along with a support message.
class SupportAttachment {
  const SupportAttachment({
    required this.path,
    required this.name,
    required this.sizeBytes,
  });

  static const int maxCount = 3;
  static const int maxSizeBytes = 5 * 1024 * 1024;
  static const Set<String> supportedExtensions = {'png', 'jpg', 'jpeg'};

  final String path;
  final String name;
  final int sizeBytes;

  String get extension {
    final dot = name.lastIndexOf('.');
    return dot == -1 ? '' : name.substring(dot + 1).toLowerCase();
  }

  bool get isSupportedFormat => supportedExtensions.contains(extension);

  bool get isWithinSizeLimit => sizeBytes <= maxSizeBytes;

  String get contentType => extension == 'png' ? 'image/png' : 'image/jpeg';

  String get readableSize {
    if (sizeBytes < 1024) return '$sizeBytes B';
    if (sizeBytes < 1024 * 1024) {
      return '${(sizeBytes / 1024).toStringAsFixed(0)} KB';
    }
    return '${(sizeBytes / (1024 * 1024)).toStringAsFixed(1)} MB';
  }
}
