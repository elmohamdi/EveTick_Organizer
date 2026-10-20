import 'package:bloc/bloc.dart';
import 'package:evetick_organizer/features/terms/data/repositories/terms_repository.dart';
import 'package:evetick_organizer/features/terms/logic/cubit/terms_state.dart';

class TermsCubit extends Cubit<TermsState> {
  TermsCubit(this._repository) : super(const TermsState());

  final TermsRepository _repository;

  Future<void> load() async {
    final document = await _repository.getTerms();
    if (isClosed) return;
    emit(TermsState(document: document));
  }
}
