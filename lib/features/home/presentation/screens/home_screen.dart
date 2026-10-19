import 'package:evetick_organizer/core/theming/colors.dart';
import 'package:evetick_organizer/core/theming/extensions/build_context_extension.dart';
import 'package:evetick_organizer/core/theming/text_styles.dart';
import 'package:evetick_organizer/features/home/logic/cubit/home_cubit.dart';
import 'package:evetick_organizer/features/home/logic/cubit/home_state.dart';
import 'package:evetick_organizer/features/home/presentation/widgets/home_content.dart';
import 'package:evetick_organizer/features/home/presentation/widgets/home_error_view.dart';
import 'package:evetick_organizer/features/pending_events/logic/cubit/pending_events_cubit.dart';
import 'package:evetick_organizer/features/staff_access/logic/cubit/staff_invites_cubit.dart';
import 'package:evetick_organizer/features/staff_access/presentation/widgets/staff_invites_banner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Requires a [HomeCubit], a [StaffInvitesCubit] and a [PendingEventsCubit]
/// above it. The "Create Event" FAB lives in
/// `MainContainer` so Material positions it above the bottom navbar.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.darkBlue,
      appBar: AppBar(
        backgroundColor: context.colors.darkBlue,
        scrolledUnderElevation: 0,
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text('Overview', style: TextStyles.font18WhiteBold(context)),
      ),
      body: Column(
        children: [
          // Home is the landing tab, so a staff invitation must show up here
          // and not only under "My Events".
          StaffInvitesBanner(
            onAccepted: () =>
                context.read<PendingEventsCubit>().getPendingEvents(),
          ),
          Expanded(
            child: BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                if (state is HomeInitial || state is HomeLoading) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: ColorsManager.orange,
                    ),
                  );
                }

                if (state is HomeFailure) {
                  return HomeErrorView(
                    message: state.error,
                    onRetry: () => context.read<HomeCubit>().load(),
                  );
                }

                final overview = (state as HomeSuccess).overview;
                return RefreshIndicator(
                  color: ColorsManager.orange,
                  backgroundColor: context.colors.lightBlue,
                  onRefresh: () => Future.wait([
                    context.read<HomeCubit>().load(isRefresh: true),
                    context.read<StaffInvitesCubit>().load(),
                  ]),
                  child: HomeContent(overview: overview),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
