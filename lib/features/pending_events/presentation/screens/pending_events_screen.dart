import 'package:evetick_organizer/core/theming/extensions/build_context_extension.dart';
import 'package:evetick_organizer/core/theming/text_styles.dart';
import 'package:evetick_organizer/features/pending_events/logic/cubit/pending_events_cubit.dart';
import 'package:evetick_organizer/features/pending_events/presentation/widgets/build_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:evetick_organizer/l10n/app_localizations.dart';

class PendingEventsScreen extends StatelessWidget {
  const PendingEventsScreen({super.key});

  /// Needs a [PendingEventsCubit] above it (owned by `MainContainer`). Staff
  /// invitations are no longer listed here: they live on the Notifications
  /// screen.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.darkBlue,
      appBar: AppBar(
        backgroundColor: context.colors.darkBlue,
        title: Text(AppLocalizations.of(context)!.myEventsTitle, style: TextStyles.font18WhiteBold(context)),
        centerTitle: true,
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            tooltip: AppLocalizations.of(context)!.commonRefresh,
            onPressed: () => context.read<PendingEventsCubit>().getPendingEvents(),
            icon: Icon(Icons.refresh_rounded, color: context.colors.white),
          ),
        ],
      ),
      body: BuildEvent(),
    );
  }
}
