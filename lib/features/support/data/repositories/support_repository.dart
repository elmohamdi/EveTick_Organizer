import 'package:evetick_organizer/core/services/result.dart';
import 'package:evetick_organizer/features/support/data/models/support_attachment.dart';
import 'package:evetick_organizer/features/support/data/models/support_category.dart';
import 'package:evetick_organizer/features/support/data/models/support_faq.dart';

abstract class SupportRepository {
  /// The organizer FAQs, sorted by their `order`.
  Future<Result<List<SupportFaq>>> getFaqs();

  /// Opens the gallery. Succeeds with `null` when the user closes the picker
  /// without choosing anything.
  Future<Result<SupportAttachment?>> pickScreenshot();

  /// Uploads the [attachments] and creates the support ticket.
  Future<Result<void>> submitMessage({
    required SupportCategory category,
    required String message,
    required List<SupportAttachment> attachments,
  });
}
