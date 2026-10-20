import 'package:bloc/bloc.dart';
import 'package:evetick_organizer/core/services/result.dart';
import 'package:evetick_organizer/features/support/data/models/support_category.dart';
import 'package:evetick_organizer/features/support/data/repositories/support_repository.dart';
import 'package:evetick_organizer/features/support/logic/help_support_cubit/help_support_state.dart';

class HelpSupportCubit extends Cubit<HelpSupportState> {
  HelpSupportCubit(this._repository) : super(const HelpSupportState());

  final SupportRepository _repository;

  /// [isRefresh] keeps the current list visible while reloading.
  Future<void> loadFaqs({bool isRefresh = false}) async {
    if (!isRefresh || state.status != FaqLoadStatus.success) {
      emit(state.copyWith(status: FaqLoadStatus.loading));
    }

    final result = await _repository.getFaqs();
    if (isClosed) return;

    result.when(
      success: (faqs) {
        final loaded = state.copyWith(
          status: FaqLoadStatus.success,
          faqs: faqs,
        );
        final visible = loaded.visibleFaqs;
        final keepOpen = visible.any((faq) => faq.id == state.expandedFaqId);
        emit(
          loaded.copyWith(
            // The first answer is open by default.
            expandedFaqId: () => keepOpen
                ? state.expandedFaqId
                : (visible.isEmpty ? null : visible.first.id),
          ),
        );
      },
      failure: (failure) => emit(
        state.copyWith(
          status: FaqLoadStatus.failure,
          errorMessage: failure.message,
        ),
      ),
    );
  }

  void search(String query) {
    _emitFiltered(state.copyWith(query: query.trim()));
  }

  /// Tapping the selected category again clears the filter.
  void selectCategory(SupportCategory category) {
    final selected = state.selectedCategory == category ? null : category;
    _emitFiltered(state.copyWith(selectedCategory: () => selected));
  }

  void toggleFaq(String faqId) {
    emit(
      state.copyWith(
        expandedFaqId: () => state.expandedFaqId == faqId ? null : faqId,
      ),
    );
  }

  /// Closes the open answer when the new filter hides it.
  void _emitFiltered(HelpSupportState next) {
    final stillVisible = next.visibleFaqs.any(
      (faq) => faq.id == next.expandedFaqId,
    );
    emit(
      stillVisible ? next : next.copyWith(expandedFaqId: () => null),
    );
  }
}
