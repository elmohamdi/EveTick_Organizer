import 'package:evetick_organizer/features/terms/data/models/terms_block.dart';
import 'package:evetick_organizer/features/terms/presentation/widgets/terms_item_row.dart';
import 'package:evetick_organizer/features/terms/presentation/widgets/terms_note_card.dart';
import 'package:evetick_organizer/features/terms/presentation/widgets/terms_paragraph.dart';
import 'package:flutter/material.dart';

/// Picks the widget that matches the type of the [block].
class TermsBlockView extends StatelessWidget {
  const TermsBlockView({super.key, required this.block});

  final TermsBlock block;

  @override
  Widget build(BuildContext context) {
    final text = block.text.resolve(Localizations.localeOf(context).languageCode);

    return switch (block.type) {
      TermsBlockType.paragraph => TermsParagraph(text: text),
      TermsBlockType.note => TermsNoteCard(text: text),
      TermsBlockType.item => TermsItemRow(icon: block.icon.icon, text: text),
    };
  }
}
