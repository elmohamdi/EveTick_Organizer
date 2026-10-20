import 'package:evetick_organizer/features/support/data/models/support_category.dart';
import 'package:evetick_organizer/features/support/data/models/support_faq.dart';
import 'package:flutter/foundation.dart';

enum FaqLoadStatus { initial, loading, success, failure }

class HelpSupportState {
  const HelpSupportState({
    this.status = FaqLoadStatus.initial,
    this.faqs = const [],
    this.query = '',
    this.selectedCategory,
    this.expandedFaqId,
    this.errorMessage,
  });

  final FaqLoadStatus status;
  final List<SupportFaq> faqs;
  final String query;
  final SupportCategory? selectedCategory;
  final String? expandedFaqId;
  final String? errorMessage;

  bool get isFiltering => selectedCategory != null || query.isNotEmpty;

  /// The FAQs matching the selected category and the search text.
  List<SupportFaq> get visibleFaqs {
    return faqs.where((faq) {
      final inCategory =
          selectedCategory == null || faq.category == selectedCategory;
      return inCategory && faq.matches(query);
    }).toList();
  }

  /// Nullable fields are passed as getters so they can be reset to `null`.
  HelpSupportState copyWith({
    FaqLoadStatus? status,
    List<SupportFaq>? faqs,
    String? query,
    ValueGetter<SupportCategory?>? selectedCategory,
    ValueGetter<String?>? expandedFaqId,
    String? errorMessage,
  }) {
    return HelpSupportState(
      status: status ?? this.status,
      faqs: faqs ?? this.faqs,
      query: query ?? this.query,
      selectedCategory: selectedCategory != null
          ? selectedCategory()
          : this.selectedCategory,
      expandedFaqId: expandedFaqId != null
          ? expandedFaqId()
          : this.expandedFaqId,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
