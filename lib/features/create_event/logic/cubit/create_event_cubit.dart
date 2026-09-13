import 'package:bloc/bloc.dart';
import 'package:evetick_organizer/features/create_event/data/models/event_model.dart';
import 'package:evetick_organizer/features/create_event/data/repositories/create_event_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_event_state.dart';
part 'create_event_cubit.freezed.dart';

class CreateEventCubit extends Cubit<CreateEventState> {
  final CreateEventRepository createEventRepository;
  CreateEventCubit({required this.createEventRepository})
    : super(CreateEventState.initial());
  Future<void> createEvent(EventModel event) async {
    try {
      emit(CreateEventState.loading());
      await createEventRepository.createEvent(event);
      emit(CreateEventState.success());
    } catch (e) {
      emit(CreateEventState.failure(e.toString()));
    }
  }
}
