import 'package:evetick_organizer/features/support/data/models/localized_text.dart';
import 'package:evetick_organizer/features/terms/data/models/terms_block.dart';

class TermsSection {
  const TermsSection({required this.title, required this.blocks});

  /// Without the number, the screen numbers the sections.
  final LocalizedText title;
  final List<TermsBlock> blocks;

  factory TermsSection.fromMap(Map<String, dynamic> map) {
    final blocks = <TermsBlock>[];
    final rawBlocks = map['blocks'];
    if (rawBlocks is List) {
      for (final raw in rawBlocks) {
        if (raw is! Map) continue;
        final block = TermsBlock.fromMap(Map<String, dynamic>.from(raw));
        if (block.isValid) blocks.add(block);
      }
    }
    return TermsSection(
      title: LocalizedText.fromRaw(map['title']),
      blocks: blocks,
    );
  }

  bool get isValid => !title.isEmpty && blocks.isNotEmpty;
}
