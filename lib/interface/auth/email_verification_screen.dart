import 'package:events_app/providers/router_provider.dart';
import 'package:firebase_auth/firebase_auth.dart' hide AuthProvider, EmailAuthProvider;
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nx_firebase_auth/nx_firebase_auth.dart';
// import 'package:firebase_ui_auth/firebase_ui_auth.dart';

class EmailVerification extends StatelessWidget {
  const EmailVerification({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EmailVerificationScreen(
        headerBuilder: (context, constraints, shrinkOffset) {
          return Padding(
            padding: const EdgeInsets.only(top: 50),
            child: TextButton(
              onPressed: () {
                EmailVerificationController(FirebaseAuth.instance).sendVerificationEmail(Theme.of(context).platform, null);
              },
              child: const Text('Resend verification email'),
            ),
          );
        },
        actions: [
          EmailVerifiedAction(() {
            context.go(Routes.home);
          }),
          AuthCancelledAction((context) async {
            await FirebaseUIAuth.signOut(context: context);
            if (context.mounted) {
              context.go(Routes.initial);
            }
          }),
        ],
      ),
    );
  }
}
