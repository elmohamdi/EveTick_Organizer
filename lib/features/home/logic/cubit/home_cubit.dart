import 'package:bloc/bloc.dart';
import 'package:evetick_organizer/core/services/result.dart';
import 'package:evetick_organizer/features/home/data/repositories/home_repository.dart';
import 'package:evetick_organizer/features/home/logic/cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._repository) : super(HomeInitial());

  final HomeRepository _repository;

  /// [isRefresh] keeps the current numbers on screen while reloading
  /// (pull-to-refresh) instead of flashing the full-screen loader.
  Future<void> load({bool isRefresh = false}) async {
    if (!isRefresh || state is! HomeSuccess) {
      emit(HomeLoading());
    }

    final result = await _repository.getOverview();
    if (isClosed) return;

    result.when(
      success: (overview) => emit(HomeSuccess(overview)),
      failure: (failure) => emit(HomeFailure(failure.message)),
    );
  }
}
