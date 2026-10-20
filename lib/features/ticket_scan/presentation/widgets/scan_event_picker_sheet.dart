import 'package:evetick_organizer/core/helpers/extentions.dart';
import 'package:evetick_organizer/core/helpers/spacing.dart';
import 'package:evetick_organizer/core/theming/colors.dart';
import 'package:evetick_organizer/core/theming/text_styles.dart';
import 'package:evetick_organizer/features/ticket_scan/logic/cubit/ticket_scan_cubit.dart';
import 'package:evetick_organizer/features/ticket_scan/logic/cubit/ticket_scan_state.dart';
import 'package:evetick_organizer/features/ticket_scan/presentation/widgets/scan_event_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:evetick_organizer/l10n/app_localizations.dart';

class ScanEventPickerSheet extends StatelessWidget {
  const ScanEventPickerSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(AppLocalizations.of(context)!.scanSelectEventTitle, style: TextStyles.font18WhiteBold(context)),
            verticalSpace(16),
            BlocBuilder<TicketScanCubit, TicketScanState>(
              buildWhen: (previous, current) =>
                  previous.events != current.events ||
                  previous.selectedEvent != current.selectedEvent ||
                  previous.isLoadingEvents != current.isLoadingEvents,
              builder: (context, state) {
                if (state.events.isEmpty) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 24.h),
                    child: Center(
                      child: state.isLoadingEvents
                          ? const CircularProgressIndicator(
                              color: ColorsManager.orange,
                            )
                          : Text(
                              AppLocalizations.of(context)!.commonNoEventsFound,
                              style: TextStyles.font16LightGrayRegular(context),
                            ),
                    ),
                  );
                }

                return ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: MediaQuery.sizeOf(context).height * 0.5,
                  ),
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemCount: state.events.length,
                    separatorBuilder: (_, _) => verticalSpace(8),
                    itemBuilder: (context, index) {
                      final event = state.events[index];
                      return ScanEventTile(
                        event: event,
                        isSelected: event.id == state.selectedEvent?.id,
                        onTap: () {
                          context.read<TicketScanCubit>().selectEvent(event);
                          context.pop();
                        },
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
