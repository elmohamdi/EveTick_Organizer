import 'package:evetick_organizer/features/ticket_scan/logic/cubit/ticket_scan_cubit.dart';
import 'package:evetick_organizer/features/ticket_scan/presentation/widgets/scan_result_banner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Slides the [ScanResultBanner] in from the top of the screen. Must be a
/// child of a [Stack] so it floats above the content without moving it.
class ScanResultOverlay extends StatelessWidget {
  const ScanResultOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    final result = context.select(
      (TicketScanCubit cubit) => cubit.state.result,
    );

    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 0),
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            transitionBuilder: (child, animation) => SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0, -1.2),
                end: Offset.zero,
              ).animate(animation),
              child: FadeTransition(opacity: animation, child: child),
            ),
            child: result == null
                ? const SizedBox.shrink(key: ValueKey('no-result'))
                : ScanResultBanner(
                    key: ObjectKey(result),
                    result: result,
                    onDismiss: context.read<TicketScanCubit>().dismissResult,
                  ),
          ),
        ),
      ),
    );
  }
}
