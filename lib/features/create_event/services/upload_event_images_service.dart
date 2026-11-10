import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class UploadEventImagesService {
  final storageRef = FirebaseStorage.instance.ref();
  File _checkedFile(String path) {
    final file = File(path);
    if (!file.existsSync()) {
      throw Exception('Image file not found, please pick the image again');
    }
    return file;
  }

  Future<String> uploadEventCoverImage(String eventId, String filePath) async {
    final coverImageRef = storageRef.child('events/$eventId/cover_image.jpg');
    final uploadTask = coverImageRef.putFile(
      _checkedFile(filePath),
      SettableMetadata(contentType: 'image/jpeg'),
    );
    final snapshot = await uploadTask.whenComplete(() => null);
    final downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  Future<List<String>> uploadEventGalleryImages(
    String eventId,
    List<String> filePaths,
  ) async {
    List<String> downloadUrls = [];
    for (int i = 0; i < filePaths.length; i++) {
      final eventGalleryImageRef = storageRef.child(
        'events/$eventId/gallery/event_$i.jpg',
      );
      final uploadTask = eventGalleryImageRef.putFile(
        _checkedFile(filePaths[i]),
        SettableMetadata(contentType: 'image/jpeg'),
      );
      final snapshot = await uploadTask.whenComplete(() => null);
      final downloadUrl = await snapshot.ref.getDownloadURL();
      downloadUrls.add(downloadUrl);
    }
    return downloadUrls;
  }
}
