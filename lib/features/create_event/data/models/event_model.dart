import 'package:evetick_organizer/features/create_event/data/models/ticket_tier_model.dart';
import 'package:image_picker/image_picker.dart';

class EventModel {
  final String eventId;
  final String eventTitle;
  final String eventCategory;
  final DateTime startAt;
  final DateTime endAt;
  final String eventLocation;
  final XFile eventCoverImage;
  final List<XFile>? eventPhotos;
  final String eventDescription;
  final List<TicketTierModel> eventTicketTier;
  final bool isOnlineEvent;
  EventModel({
    required this.eventId,
    required this.eventTitle,
    required this.eventCategory,
    required this.eventLocation,
    required this.eventCoverImage,
    required this.eventTicketTier,
    required this.startAt,
    required this.endAt,
    required this.isOnlineEvent,
    required this.eventDescription,
    this.eventPhotos,
  });
  Map<String, dynamic> toJson() {
    return {
      'eventId': eventId,
      'eventTitle': eventTitle,
      'eventCategory': eventCategory,
      'startAt': startAt.toIso8601String(),
      'endAt': endAt.toIso8601String(),
      'eventLocation': eventLocation,
      'eventCoverImage': eventCoverImage.path,
      'eventPhotos': eventPhotos?.map((e) => e.path).toList(),
      'eventDescription': eventDescription,
      'isOnlineEvent': isOnlineEvent,
      'ticketTiers': eventTicketTier.map((e) => e.toJson()).toList(),
    };
  }
}
