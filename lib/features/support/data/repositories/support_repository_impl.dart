import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evetick_organizer/core/services/failure.dart';
import 'package:evetick_organizer/core/services/firebase_error_handler.dart';
import 'package:evetick_organizer/core/services/result.dart';
import 'package:evetick_organizer/features/support/data/models/default_support_faqs.dart';
import 'package:evetick_organizer/features/support/data/models/support_attachment.dart';
import 'package:evetick_organizer/features/support/data/models/support_category.dart';
import 'package:evetick_organizer/features/support/data/models/support_faq.dart';
import 'package:evetick_organizer/features/support/data/repositories/support_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';

/// Firebase implementation.
///
/// organizer_faqs/{faqId}
///     question:  String | {en: String, ar: String}
///     answer:    String | {en: String, ar: String}
///     category:  'account' | 'events' | 'ticketing' | 'payouts'
///     order:     number   (ascending)
///     isActive:  bool     (false hides it, missing means visible)
///
/// support_messages/{ticketId}
///     uid, name, email, category, message, status ('open'), source,
///     attachments: [{url, name, sizeBytes}], createdAt
///
/// Storage: support_attachments/{uid}/{ticketId}/{index}.{png|jpg|jpeg}
class SupportRepositoryImpl implements SupportRepository {
  SupportRepositoryImpl({
    required FirebaseFirestore firestore,
    required FirebaseAuth auth,
    required FirebaseStorage storage,
    required ImagePicker picker,
  }) : _firestore = firestore,
       _auth = auth,
       _storage = storage,
       _picker = picker;

  final FirebaseFirestore _firestore;
  final FirebaseAuth _auth;
  final FirebaseStorage _storage;
  final ImagePicker _picker;

  @override
  Future<Result<List<SupportFaq>>> getFaqs() async {
    try {
      final snapshot = await _firestore.collection('organizer_faqs').get();
      final faqs =
          snapshot.docs
              .where((doc) => doc.data()['isActive'] != false)
              .map((doc) => SupportFaq.fromMap(doc.id, doc.data()))
              .where((faq) => faq.isValid)
              .toList()
            ..sort((a, b) => a.order.compareTo(b.order));

      // Nothing published yet: fall back to the built-in answers.
      return Result.success(faqs.isEmpty ? DefaultSupportFaqs.items : faqs);
    } on FirebaseException catch (e) {
      return Result.failure(FirebaseErrorHandler.handleFirestore(e));
    } catch (e, stackTrace) {
      debugPrint('Support error: $e\n$stackTrace');
      return Result.failure(FirebaseErrorHandler.handleGeneric(e));
    }
  }

  @override
  Future<Result<SupportAttachment?>> pickScreenshot() async {
    try {
      final file = await _picker.pickImage(source: ImageSource.gallery);
      if (file == null) return const Result.success(null);

      final name = file.name.isNotEmpty
          ? file.name
          : file.path.split(RegExp(r'[\\/]')).last;
      return Result.success(
        SupportAttachment(
          path: file.path,
          name: name,
          sizeBytes: await file.length(),
        ),
      );
    } catch (e, stackTrace) {
      debugPrint('Support error: $e\n$stackTrace');
      return Result.failure(FirebaseErrorHandler.handleGeneric(e));
    }
  }

  @override
  Future<Result<void>> submitMessage({
    required SupportCategory category,
    required String message,
    required List<SupportAttachment> attachments,
  }) async {
    final user = _auth.currentUser;
    if (user == null) {
      return Result.failure(FirebaseFailure('You must be logged in'));
    }

    try {
      final ticketRef = _firestore.collection('support_messages').doc();

      final uploaded = <Map<String, dynamic>>[];
      for (var i = 0; i < attachments.length; i++) {
        final attachment = attachments[i];
        final ref = _storage.ref().child(
          'support_attachments/${user.uid}/${ticketRef.id}/$i.${attachment.extension}',
        );
        await ref.putFile(
          File(attachment.path),
          SettableMetadata(contentType: attachment.contentType),
        );
        uploaded.add({
          'url': await ref.getDownloadURL(),
          'name': attachment.name,
          'sizeBytes': attachment.sizeBytes,
        });
      }

      await ticketRef.set({
        'uid': user.uid,
        'name': await _userName(user),
        'email': user.email ?? '',
        'category': category.key,
        'message': message.trim(),
        'attachments': uploaded,
        'status': 'open',
        'source': 'organizer_app',
        'createdAt': FieldValue.serverTimestamp(),
      });
      return const Result.success(null);
    } on FirebaseException catch (e) {
      return Result.failure(
        e.plugin == 'firebase_storage'
            ? FirebaseErrorHandler.handleStorage(e)
            : FirebaseErrorHandler.handleFirestore(e),
      );
    } catch (e, stackTrace) {
      debugPrint('Support error: $e\n$stackTrace');
      return Result.failure(FirebaseErrorHandler.handleGeneric(e));
    }
  }

  /// Best effort: a missing profile must not block the message.
  Future<String> _userName(User user) async {
    try {
      final doc = await _firestore.collection('users').doc(user.uid).get();
      final name = doc.data()?['name'];
      if (name is String && name.trim().isNotEmpty) return name.trim();
    } catch (_) {}
    return user.displayName ?? '';
  }
}
