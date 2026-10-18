import 'package:evetick_organizer/core/theming/colors.dart';
import 'package:evetick_organizer/core/theming/extensions/build_context_extension.dart';
import 'package:evetick_organizer/core/theming/text_styles.dart';
import 'package:evetick_organizer/features/home/logic/cubit/home_cubit.dart';
import 'package:evetick_organizer/features/home/logic/cubit/home_state.dart';
import 'package:evetick_organizer/features/home/presentation/widgets/home_content.dart';
import 'package:evetick_organizer/features/home/presentation/widgets/home_error_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Requires a [HomeCubit] above it. The "Create Event" FAB lives in
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
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is HomeInitial || state is HomeLoading) {
            return const Center(
              child: CircularProgressIndicator(color: ColorsManager.orange),
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
            onRefresh: () => context.read<HomeCubit>().load(isRefresh: true),
            child: HomeContent(overview: overview),
          );
        },
      ),
    );
  }
}
