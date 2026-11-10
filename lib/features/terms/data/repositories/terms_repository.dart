import 'package:evetick_organizer/features/terms/data/models/terms_document.dart';

abstract class TermsRepository {
  /// Never throws: when the document cannot be read, the built-in terms are
  /// returned so the screen is never empty.
  Future<TermsDocument> getTerms();
}
