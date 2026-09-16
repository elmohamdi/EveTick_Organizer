import 'package:evetick_organizer/core/di/dependency_injection.dart';
import 'package:evetick_organizer/features/animated_navbar/animated_navbar.dart';
import 'package:evetick_organizer/features/animated_navbar/navbar_item.dart';
import 'package:evetick_organizer/features/auth/logic/login_cubit/login_cubit.dart';
import 'package:evetick_organizer/features/home/home_screen.dart';
import 'package:evetick_organizer/features/profile/logic/profile_cubit.dart';
import 'package:evetick_organizer/features/profile/ui/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainContainer extends StatefulWidget {
  const MainContainer({super.key});

  @override
  State<MainContainer> createState() => _MainContainerState();
}

class _MainContainerState extends State<MainContainer> {
  int _currentIndex = 0;

  // Not `const` anymore: the Profile tab now creates its own cubits via
  // getIt, so this list can no longer be a compile-time constant.
  // `late final` still guarantees it's built exactly once per State,
  // so switching tabs with setState() won't recreate the cubits.
  late final List<Widget> _pages = [
    const HomeScreen(),
    const Center(child: Text('Favorites Screen')),
    const Center(child: Text('Tickets Screen')),
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
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.transparent,
      body: IndexedStack(index: _currentIndex, children: _pages),
      bottomNavigationBar: AnimatedSpotlightNavbar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          AnimatedNavbarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
          ),
          AnimatedNavbarItem(
            icon: Icon(Icons.favorite_border),
            activeIcon: Icon(Icons.favorite),
          ),
          AnimatedNavbarItem(
            icon: Icon(Icons.confirmation_number_outlined),
            activeIcon: Icon(Icons.confirmation_number),
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
