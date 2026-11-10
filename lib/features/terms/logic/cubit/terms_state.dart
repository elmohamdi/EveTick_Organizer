import 'package:evetick_organizer/features/terms/data/models/terms_document.dart';

class TermsState {
  const TermsState({this.document});

  /// `null` while the terms are loading.
  final TermsDocument? document;

  bool get isLoading => document == null;
}
