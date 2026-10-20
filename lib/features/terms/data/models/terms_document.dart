import 'package:evetick_organizer/features/support/data/models/localized_text.dart';
import 'package:evetick_organizer/features/terms/data/models/terms_section.dart';

class TermsDocument {
  const TermsDocument({required this.lastUpdated, required this.sections});

  final LocalizedText lastUpdated;
  final List<TermsSection> sections;

  factory TermsDocument.fromMap(Map<String, dynamic> map) {
    final sections = <TermsSection>[];
    final rawSections = map['sections'];
    if (rawSections is List) {
      for (final raw in rawSections) {
        if (raw is! Map) continue;
        final section = TermsSection.fromMap(Map<String, dynamic>.from(raw));
        if (section.isValid) sections.add(section);
      }
    }
    return TermsDocument(
      lastUpdated: LocalizedText.fromRaw(map['lastUpdated']),
      sections: sections,
    );
  }

  bool get isValid => sections.isNotEmpty;
}
