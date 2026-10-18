import 'package:bloc/bloc.dart';
import 'package:evetick_organizer/features/pending_events/data/repositories/pending_events_repository.dart';
import 'package:evetick_organizer/features/pending_events/logic/cubit/pending_events_state.dart';

class PendingEventsCubit extends Cubit<PendingEventsState> {
  final PendingEventsRepository repository;
  PendingEventsCubit(this.repository) : super(PendingEventsInitial());

  Future<void> getPendingEvents() async {
    emit(PendingEventsLoading());
    try {
      final events = await repository.getPendingEvents();
      emit(PendingEventsSuccess(events));
    } catch (e) {
      emit(PendingEventsFailure(e.toString()));
    }
  }
}
