import 'package:evetick_organizer/core/di/dependency_injection.dart';
import 'package:evetick_organizer/features/animated_navbar/animated_navbar.dart';
import 'package:evetick_organizer/features/animated_navbar/navbar_item.dart';
import 'package:evetick_organizer/features/auth/logic/login_cubit/login_cubit.dart';
import 'package:evetick_organizer/features/home/home_screen.dart';
import 'package:evetick_organizer/features/pending_events/logic/cubit/pending_events_cubit.dart';
import 'package:evetick_organizer/features/pending_events/presentation/screens/pending_events_screen.dart';
import 'package:evetick_organizer/core/theming/extensions/build_context_extension.dart';
import 'package:evetick_organizer/features/profile/logic/profile_cubit.dart';
import 'package:evetick_organizer/features/profile/ui/screens/profile_screen.dart';
import 'package:evetick_organizer/features/ticket_scan/logic/cubit/ticket_scan_cubit.dart';
import 'package:evetick_organizer/features/ticket_scan/presentation/screens/ticket_scan_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainContainer extends StatefulWidget {
  const MainContainer({super.key});

  @override
  State<MainContainer> createState() => _MainContainerState();
}

class _MainContainerState extends State<MainContainer> {
  static const int _homeTabIndex = 0;
  static const int _scanTabIndex = 2;

  int _currentIndex = _homeTabIndex;

  // Owned here (not by the tab's BlocProvider) because the scan tab is
  // unmounted whenever it isn't selected, and we want the selected event and
  // scan count to survive switching tabs.
  late final TicketScanCubit _ticketScanCubit = getIt<TicketScanCubit>()
    ..init();

  // Not `const` anymore: the Profile tab now creates its own cubits via
  // getIt, so this list can no longer be a compile-time constant.
  // `late final` still guarantees it's built exactly once per State,
  // so switching tabs with setState() won't recreate the cubits.
  late final List<Widget> _pages = [
    const HomeScreen(),
    BlocProvider(
      create: (_) => getIt<PendingEventsCubit>()..getPendingEvents(),
      child: const PendingEventsScreen(),
    ),
    BlocProvider.value(
      value: _ticketScanCubit,
      child: TicketScanScreen(onBack: () => _onTabSelected(_homeTabIndex)),
    ),
    MultiBlocProvider(
      // ProfileScreen (and ProfileHeader inside it) reads ProfileCubit,
      // and its logout button reads LoginCubit. Previously neither was
      // provided here, so opening the Profile tab from the bottom nav
      // (as opposed to via Routes.profileScreen) threw
      // ProviderNotFoundException.
      providers: [
        BlocProvider(create: (_) => getIt<ProfileCubit>()..getUserData()),
        BlocProvider(create: (_) => getIt<LoginCubit>()),
      ],
      child: const ProfileScreen(),
    ),
  ];

  void _onTabSelected(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  void dispose() {
    _ticketScanCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.transparent,
      // IndexedStack keeps every tab alive. The scan tab is replaced by an
      // empty box while it isn't selected so the camera is released (and the
      // permission prompt doesn't appear on app start).
      body: IndexedStack(
        index: _currentIndex,
        children: [
          for (var i = 0; i < _pages.length; i++)
            i == _scanTabIndex && _currentIndex != _scanTabIndex
                ? const SizedBox.shrink()
                : _pages[i],
        ],
      ),
      bottomNavigationBar: AnimatedSpotlightNavbar(
        currentIndex: _currentIndex,
        backgroundColor: context.colors.lightBlue,
        onTap: _onTabSelected,
        items: const [
          AnimatedNavbarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
          ),
          AnimatedNavbarItem(
            icon: Icon(Icons.event_note_outlined),
            activeIcon: Icon(Icons.event_note),
          ),
          AnimatedNavbarItem(
            icon: Icon(Icons.qr_code_scanner_outlined),
            activeIcon: Icon(Icons.qr_code_scanner),
          ),
          AnimatedNavbarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
          ),
        ],
      ),
    );
  }
}
