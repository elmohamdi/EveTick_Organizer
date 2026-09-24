import 'package:evetick_organizer/features/create_event/data/models/seating_config_model.dart';
import 'package:evetick_organizer/features/create_event/data/models/ticket_tier_model.dart';
import 'package:image_picker/image_picker.dart';

class EventModel {
  final String eventTitle;
  final String eventCategory;
  final DateTime startAt;
  final DateTime endAt;
  final String eventLocation;
  final String? eventUrl;
  final XFile eventCoverImage;
  final List<XFile>? eventPhotos;
  final String? eventDescription;
  final List<TicketTierModel> eventTicketTier;
  final bool isOnlineEvent;
  final SeatingConfigModel? seatingConfig;
  EventModel({
    required this.eventTitle,
    required this.eventCategory,
    required this.eventLocation,
    this.eventUrl,
    required this.eventCoverImage,
    required this.eventTicketTier,
    required this.startAt,
    required this.endAt,
    required this.isOnlineEvent,
    required this.eventDescription,
    this.eventPhotos,
    this.seatingConfig,
  });
  Map<String, dynamic> toJson() {
    return {
      'eventTitle': eventTitle,
      'eventCategory': eventCategory,
      'startAt': startAt.toIso8601String(),
      'endAt': endAt.toIso8601String(),
      'eventLocation': eventLocation,
      'eventUrl': eventUrl,
      'eventCoverImage': eventCoverImage.path,
      'eventPhotos': eventPhotos?.map((e) => e.path).toList(),
      'eventDescription': eventDescription,
      'isOnlineEvent': isOnlineEvent,
      'ticketTiers': eventTicketTier.map((e) => e.toJson()).toList(),
      'seatingConfig': seatingConfig?.toJson(),
    };
  }
}
