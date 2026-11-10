import 'package:evetick_organizer/features/support/data/models/localized_text.dart';
import 'package:evetick_organizer/features/terms/data/models/terms_icon.dart';

/// How a block of a section is drawn.
enum TermsBlockType {
  /// Plain text.
  paragraph('paragraph'),

  /// Text inside a highlighted card.
  note('note'),

  /// A line with an icon in front of it.
  item('item');

  const TermsBlockType(this.key);

  final String key;

  static TermsBlockType fromKey(String? key) {
    for (final value in values) {
      if (value.key == key) return value;
    }
    return paragraph;
  }
}

/// A piece of a section. Wrap words in `**double stars**` to highlight them.
class TermsBlock {
  const TermsBlock({
    required this.type,
    required this.text,
    this.icon = TermsIcon.check,
  });

  final TermsBlockType type;
  final LocalizedText text;
  final TermsIcon icon;

  factory TermsBlock.fromMap(Map<String, dynamic> map) {
    return TermsBlock(
      type: TermsBlockType.fromKey(map['type']?.toString()),
      text: LocalizedText.fromRaw(map['text']),
      icon: TermsIcon.fromKey(map['icon']?.toString()),
    );
  }

  bool get isValid => !text.isEmpty;
}
