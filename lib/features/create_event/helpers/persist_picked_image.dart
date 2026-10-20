import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

/// image_picker بيرجّع ملف في الكاش المؤقت ممكن النظام يمسحه قبل الرفع.
/// الدالة دي بتنسخ الصورة لمكان دائم جوه الـ app قبل ما نحتفظ بالمسار.
Future<XFile> persistPickedImage(XFile picked) async {
  final dir = await getApplicationDocumentsDirectory();
  final imagesDir = Directory('${dir.path}/event_images');
  if (!await imagesDir.exists()) {
    await imagesDir.create(recursive: true);
  }
  final fileName = '${DateTime.now().microsecondsSinceEpoch}.jpg';
  final saved = await File(picked.path).copy('${imagesDir.path}/$fileName');
  return XFile(saved.path);
}
