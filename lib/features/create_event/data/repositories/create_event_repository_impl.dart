import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evetick_organizer/features/create_event/data/models/event_model.dart';
import 'package:evetick_organizer/features/create_event/data/repositories/create_event_repository.dart';
import 'package:evetick_organizer/features/create_event/services/upload_event_images_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CreateEventRepositoryImpl implements CreateEventRepository {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  @override
  Future<void> createEvent(EventModel event) async {
    final String? organizerId = FirebaseAuth.instance.currentUser?.uid;
    if (organizerId == null) {
      throw Exception('You must be logged in to create an event');
    }
    final eventDoc = firebaseFirestore.collection('events').doc();
    final String eventId = eventDoc.id;
    final uploadEventImagesService = UploadEventImagesService();
    final String coverImageUrl = await uploadEventImagesService
        .uploadEventCoverImage(eventId, event.eventCoverImage.path);
    final List<String> galleryImagesUrls = await uploadEventImagesService
        .uploadEventGalleryImages(
          eventId,
          event.eventPhotos?.map((photo) => photo.path).toList() ?? [],
        );
    final eventData = {
      'eventId': eventId,
      'organizerId': organizerId,
      'eventTitle': event.eventTitle,
      'eventCategory': event.eventCategory,
      'startAt': event.startAt.toIso8601String(),
      'endAt': event.endAt.toIso8601String(),
      'eventLocation': event.eventLocation,
      'eventUrl': event.eventUrl,
      'coverImageUrl': coverImageUrl,
      'galleryImagesUrls': galleryImagesUrls,
      'eventDescription': event.eventDescription,
      'isOnlineEvent': event.isOnlineEvent,
      'status': 'pending',
      'ticketTiers': event.eventTicketTier
          .map((tier) => tier.toJson())
          .toList(),
      'seatingConfig': event.seatingConfig?.toJson(),
      'paymentMethods': event.paymentMethods
          .map((method) => method.toJson())
          .toList(),
    };
    await eventDoc.set(eventData);
  }
}
