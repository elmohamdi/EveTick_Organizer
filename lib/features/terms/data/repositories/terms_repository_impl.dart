import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evetick_organizer/features/terms/data/models/default_terms.dart';
import 'package:evetick_organizer/features/terms/data/models/terms_document.dart';
import 'package:evetick_organizer/features/terms/data/repositories/terms_repository.dart';
import 'package:flutter/foundation.dart';

/// Firestore implementation.
///
/// legal_documents/organizer_terms
///     lastUpdated: String | {en: String, ar: String}
///     sections: [
///       {
///         title:  String | {en, ar}          (no number, it is added on screen)
///         blocks: [
///           { type: 'paragraph' | 'note' | 'item',
///             text: String | {en, ar}         (**word** is highlighted),
///             icon: 'block' | 'security' | 'person_off' | 'check' }  // item only
///         ]
///       }
///     ]
class TermsRepositoryImpl implements TermsRepository {
  TermsRepositoryImpl({required FirebaseFirestore firestore})
    : _firestore = firestore;

  final FirebaseFirestore _firestore;

  @override
  Future<TermsDocument> getTerms() async {
    try {
      final snapshot = await _firestore
          .collection('legal_documents')
          .doc('organizer_terms')
          .get();
      final data = snapshot.data();
      if (data != null) {
        final document = TermsDocument.fromMap(data);
        if (document.isValid) return document;
      }
    } catch (e, stackTrace) {
      // Offline or no permission: the built-in terms are shown instead.
      debugPrint('Terms error: $e\n$stackTrace');
    }
    return DefaultTerms.document;
  }
}
