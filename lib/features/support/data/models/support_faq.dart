import 'package:evetick_organizer/features/support/data/models/localized_text.dart';
import 'package:evetick_organizer/features/support/data/models/support_category.dart';

class SupportFaq {
  const SupportFaq({
    required this.id,
    required this.category,
    required this.question,
    required this.answer,
    this.order = 0,
  });

  final String id;
  final SupportCategory? category;
  final LocalizedText question;
  final LocalizedText answer;
  final int order;

  factory SupportFaq.fromMap(String id, Map<String, dynamic> map) {
    return SupportFaq(
      id: id,
      category: SupportCategory.fromKey(map['category']?.toString()),
      question: LocalizedText.fromRaw(map['question']),
      answer: LocalizedText.fromRaw(map['answer']),
      order: (map['order'] as num?)?.toInt() ?? 0,
    );
  }

  /// A document without a question or an answer is skipped.
  bool get isValid => !question.isEmpty && !answer.isEmpty;

  /// Searches the question and the answer in every language.
  bool matches(String query) {
    final text = query.trim().toLowerCase();
    if (text.isEmpty) return true;
    return question.contains(text) || answer.contains(text);
  }
}
