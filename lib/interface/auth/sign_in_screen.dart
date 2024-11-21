import 'dart:convert';

import 'package:events_app/providers/router_provider.dart';
import 'package:events_app/repositories/event_repository/models/event.dart';
import 'package:events_app/repositories/user_repository/models/user.dart';
import 'package:events_app/repositories/user_repository/provider.dart';
import 'package:firebase_auth/firebase_auth.dart' hide AuthProvider, EmailAuthProvider;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nx_firebase_auth/nx_firebase_auth.dart';
import 'package:nx_main_screen/nx_main_screen.dart';


// List<Event> globalEvents = [];

// Future<void> loadJsonData() async {
//   final jsonString = await rootBundle.loadString('assets/events.json');
//   final jsonData = json.decode(jsonString);
//   globalEvents = List<Event>.from(jsonData.map((e) => Event.fromJson(e)).toList());
// }

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SignInScreen(
        headerMaxExtent: 260,
        providers: FirebaseUIAuth.providersFor(
          FirebaseAuth.instance.app,
        ),
        actions: [
          AuthStateChangeAction<SignedIn>((context, state) async {
            if (state.user!.emailVerified) {
              final newUser = LocalUser(
                fullName: state.user!.displayName,
                email: state.user!.email,
                phoneNumber: state.user!.phoneNumber,
                photoURL: state.user!.photoURL,
              );

              await ref.read(usersRepositoryProvider).saveUserData(user: newUser);
              ref.read(navigationStateProvider.notifier).state = 0;
              // await loadJsonData();
              context.go(Routes.home);
            } else {
              if (context.mounted) {
                context.pushReplacement(Routes.emailVerification);
              }
            }
          }),
        ],
      ),
    );
  }
}
