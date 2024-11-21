
import 'package:events_app/interface/home_screen.dart';
import 'package:events_app/interface/profile_screen.dart';
import 'package:events_app/providers/router_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nx_main_screen/nx_main_screen.dart';
import 'package:ionicons/ionicons.dart';
import 'package:nx_ui/nx_ui.dart';
import 'package:nx_sequrify/nx_sequrify.dart';

class MainScreen extends ConsumerWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navigationIndex = ref.watch(navigationStateProvider);
    final pages = <Widget>[
      const HomeScreen(),
      const ProfileScreen(),
    ];

    final destinations = [
      const NavigationDestination(
        icon: Icon(Ionicons.home_outline),
        selectedIcon: Icon(Ionicons.home),
        label: 'Home',
      ),
      const NavigationDestination(
        icon: Icon(Ionicons.person_outline),
        selectedIcon: Icon(Ionicons.person),
        label: 'Profile',
      ),
    ];

    final drawerOptions = {
      const [
        'Home',
        Icon(Icons.home_outlined),
      ]: () {
        ref.read(navigationStateProvider.notifier).state = 0;
        context.go(Routes.home);
      },
      const [
        'Profile',
        Icon(Icons.person_outline),
      ]: () {
        ref.read(navigationStateProvider.notifier).state = 1;
        context.go(Routes.home);
      },
    };

    return NxMainScreen(
      drawer: NxCustomDrawer(
        sequrifyButton: SequrifyButton(
          onPressed: () {},
        ),
        drawerOptions: drawerOptions,
        signOutFunction: () async {
          await FirebaseAuth.instance.signOut();
          if (context.mounted) {
            context.go(Routes.initial);
          }
        },
      ),
      currentTab: navigationIndex,
      onTabChange: (int index) {
        ref.read(navigationStateProvider.notifier).state = index;
      },
      pages: pages,
      destinations: destinations,
    );
  }
}
