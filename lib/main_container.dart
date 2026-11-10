import 'package:evetick_organizer/core/di/dependency_injection.dart';
import 'package:evetick_organizer/features/animated_navbar/animated_navbar.dart';
import 'package:evetick_organizer/features/animated_navbar/navbar_item.dart';
import 'package:evetick_organizer/features/auth/logic/login_cubit/login_cubit.dart';
import 'package:evetick_organizer/features/home/logic/cubit/home_cubit.dart';
import 'package:evetick_organizer/features/home/presentation/screens/home_screen.dart';
import 'package:evetick_organizer/features/home/presentation/widgets/create_event_fab.dart';
import 'package:evetick_organizer/features/notifications/logic/cubit/notifications_cubit.dart';
import 'package:evetick_organizer/features/notifications/logic/cubit/notifications_state.dart';
import 'package:evetick_organizer/features/pending_events/logic/cubit/pending_events_cubit.dart';
import 'package:evetick_organizer/features/pending_events/presentation/screens/pending_events_screen.dart';
import 'package:evetick_organizer/core/theming/extensions/build_context_extension.dart';
import 'package:evetick_organizer/features/profile/logic/profile_cubit.dart';
import 'package:evetick_organizer/features/profile/ui/screens/profile_screen.dart';
import 'package:evetick_organizer/features/staff_access/logic/cubit/staff_invites_cubit.dart';
import 'package:evetick_organizer/features/ticket_scan/logic/cubit/ticket_scan_cubit.dart';
import 'package:evetick_organizer/features/ticket_scan/presentation/screens/ticket_scan_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainContainer extends StatefulWidget {
  const MainContainer({super.key});

  @override
  State<MainContainer> createState() => _MainContainerState();
}

class _MainContainerState extends State<MainContainer>
    with WidgetsBindingObserver {
  static const int _homeTabIndex = 0;
  static const int _eventsTabIndex = 1;
  static const int _scanTabIndex = 2;

  int _currentIndex = _homeTabIndex;

  // Owned here (not by the tab's BlocProvider) because the scan tab is
  // unmounted whenever it isn't selected, and we want the selected event and
  // scan count to survive switching tabs.
  late final TicketScanCubit _ticketScanCubit = getIt<TicketScanCubit>()
    ..init();

  // Owned here so the Home bell badge and the Notifications screen share one
  // state, and so staff invitations can be re-checked when the user returns
  // to Home or to the app (an invitation sent while the app was already open
  // used to stay invisible until a manual refresh).
  late final StaffInvitesCubit _staffInvitesCubit = getIt<StaffInvitesCubit>()
    ..load();
  late final PendingEventsCubit _pendingEventsCubit =
      getIt<PendingEventsCubit>()..getPendingEvents();

  // Live listener behind the Home bell and the Notifications screen.
  late final NotificationsCubit _notificationsCubit =
      getIt<NotificationsCubit>()..start();

  // Not `const` anymore: the Profile tab now creates its own cubits via
  // getIt, so this list can no longer be a compile-time constant.
  // `late final` still guarantees it's built exactly once per State,
  // so switching tabs with setState() won't recreate the cubits.
  late final List<Widget> _pages = [
    BlocProvider(
      create: (_) => getIt<HomeCubit>()..load(),
      child: const HomeScreen(),
    ),
    const PendingEventsScreen(),
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

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state != AppLifecycleState.resumed) return;
    _staffInvitesCubit.load();
    // A listener that died (e.g. while offline) is restarted on return.
    if (_notificationsCubit.state.status == NotificationsStatus.failure) {
      _notificationsCubit.start();
    }
  }

  void _onTabSelected(int index) {
    // Home shows the bell badge, which counts pending invitations: re-check
    // on every visit.
    if (index == _homeTabIndex && index != _currentIndex) {
      _staffInvitesCubit.load();
    }
    // Reload My Events on every visit so a just-created event shows up.
    if (index == _eventsTabIndex && index != _currentIndex) {
      _pendingEventsCubit.getPendingEvents();
    }
    // Events the user just joined as staff become scannable right away.
    if (index == _scanTabIndex && _currentIndex != _scanTabIndex) {
      _ticketScanCubit.loadEvents();
    }
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _staffInvitesCubit.close();
    _pendingEventsCubit.close();
    _notificationsCubit.close();
    _ticketScanCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: _staffInvitesCubit),
        BlocProvider.value(value: _pendingEventsCubit),
        BlocProvider.value(value: _notificationsCubit),
      ],
      child: Scaffold(
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
        // Only on the home tab. As the Scaffold's own FAB it is placed above
        // the bottom navbar automatically.
        floatingActionButton:
            _currentIndex == _homeTabIndex ? const CreateEventFab() : null,
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
      ),
    );
  }
}
