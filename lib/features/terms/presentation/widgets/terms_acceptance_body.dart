import 'package:evetick_organizer/features/terms/data/models/terms_document.dart';
import 'package:evetick_organizer/features/terms/presentation/widgets/terms_acceptance_actions.dart';
import 'package:evetick_organizer/features/terms/presentation/widgets/terms_document_view.dart';
import 'package:flutter/material.dart';

/// The terms plus the Accept / Reject bar. It tracks how far the user
/// scrolled: Accept is enabled once they reach the end (immediately if the
/// whole text already fits on screen).
class TermsAcceptanceBody extends StatefulWidget {
  const TermsAcceptanceBody({super.key, required this.document});

  final TermsDocument document;

  @override
  State<TermsAcceptanceBody> createState() => _TermsAcceptanceBodyState();
}

class _TermsAcceptanceBodyState extends State<TermsAcceptanceBody> {
  /// How close to the bottom counts as "reached the end".
  static const double _endTolerance = 24;

  bool _reachedEnd = false;

  void _checkEnd(ScrollMetrics metrics) {
    if (_reachedEnd || !mounted) return;
    if (metrics.extentAfter <= _endTolerance) {
      setState(() => _reachedEnd = true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          // ScrollMetricsNotification covers the first layout (short text),
          // ScrollNotification covers the user's scrolling.
          child: NotificationListener<ScrollMetricsNotification>(
            onNotification: (notification) {
              _checkEnd(notification.metrics);
              return false;
            },
            child: NotificationListener<ScrollNotification>(
              onNotification: (notification) {
                _checkEnd(notification.metrics);
                return false;
              },
              child: TermsDocumentView(document: widget.document),
            ),
          ),
        ),
        TermsAcceptanceActions(canAccept: _reachedEnd),
      ],
    );
  }
}
