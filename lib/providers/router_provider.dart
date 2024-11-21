import 'package:events_app/interface/auth/email_verification_screen.dart';
import 'package:events_app/interface/auth/sign_in_screen.dart';
import 'package:events_app/interface/event_detail_screen.dart';
import 'package:events_app/interface/favorite_screen.dart';

import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:events_app/interface/main.dart';
import 'package:events_app/loggers.dart';
import 'package:firebase_auth/firebase_auth.dart' hide AuthProvider, EmailAuthProvider;
import 'package:nx_profile/nx_profile.dart';
import 'package:nx_settings/nx_settings.dart';

class Routes {
  static const initial = '/sign_in';
  static const emailVerification = '/email_verification';
  static const home = '/home';
  static const eventDetail = '/event_detail';
  static const settings = '/settings';
  static const editProfile = '/edit_profile';
  static const favoriteEvents = '/favorite_events';
  static const location = '/location';

  static build(String route, List<String> params) => [route, ...params].join('/');
}

final navigatorKey = GlobalKey<NavigatorState>();

final routerProvider = Provider<GoRouter>((ref) {
  routerLogger.printStart();

  return GoRouter(
    // navigatorKey: navigatorKey,
    // debugLogDiagnostics: true,
    initialLocation: '/sign_in',
    redirect: (context, state) {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null && state.uri.toString() == Routes.initial) {
        if (user.emailVerified) {
          return '/home';
        }
        return Routes.emailVerification;
      }
    },
    routes: [
      buildRoute(Routes.initial, const LoginScreen()),
      buildRoute(Routes.emailVerification, const EmailVerification()),
      buildRoute(Routes.home, const MainScreen()),
      buildRoute(Routes.favoriteEvents, const FavoriteScreen()),
      GoRoute(
        name: 'settings',
        path: Routes.settings,
        builder: (BuildContext context, GoRouterState state) => NxSettingsScreen(
          arguments: state.extra! as SettingsArgs,
        ),
      ),
      GoRoute(
        name: 'edit_profile',
        path: Routes.editProfile,
        builder: (BuildContext context, GoRouterState state) => NxEditProfileScreenBody(
          arguments: state.extra! as EditProfileArgs,
        ),
      ),
      GoRoute(
        name: 'event_detail',
        path: Routes.eventDetail,
        builder: (BuildContext context, GoRouterState state) => EventDetailScreen(
          event: state.extra! as dynamic,
        ),
      ),
    ],
  );
});

/// Helper for creating simple route.
GoRoute buildRoute(String path, Widget screen) => GoRoute(
      path: path,
      builder: (BuildContext context, GoRouterState state) => screen,
    );
