import 'package:evetick_organizer/features/create_event/data/models/event_model.dart';

abstract class CreateEventRepository {
  Future<void> createEvent(EventModel event);
}
