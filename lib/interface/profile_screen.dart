import 'package:events_app/providers/router_provider.dart';
import 'package:events_app/repositories/user_repository/models/user.dart';
import 'package:events_app/repositories/user_repository/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nx_localizations/generated/l10n.dart';

import 'package:nx_main_screen/nx_main_screen.dart';
import 'package:nx_profile/nx_profile.dart';
import 'dart:typed_data';
import 'package:hooks_riverpod/hooks_riverpod.dart' hide Provider;
import 'package:nx_settings/nx_settings.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authUser = FirebaseAuth.instance.currentUser;
    final user = ref.watch(usersRepositoryProvider).getUserData(email: authUser?.email);
    final photoBytes = ref.watch(photoBytesProvider);
    return NxBasicScreen(
      body: NxProfileScreenBody(
        arguments: ProfileArgs(
          customColumn: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: ProfileColumnElement(
                  name: S.of(context).settings,
                  icon: Icons.settings_outlined,
                  onTap: () {
                    context.push(
                      Routes.settings,
                      extra: SettingsArgs(
                        context: context,
                        showLanguage: false,
                        showNotifications: false,
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: ProfileColumnElement(
                  name: 'Favourite events',
                  icon: Icons.event_outlined,
                  onTap: () {
                    context.push(Routes.favoriteEvents);
                  },
                ),
              ),
              ProfileColumnElement(
                name: S.of(context).log_out,
                onTap: () async {
                  await FirebaseAuth.instance.signOut();
                  if (context.mounted) {
                    context.go(Routes.initial);
                  }
                },
                icon: Icons.logout_outlined,
              ),
            ],
          ),
          profilePictureBytes: photoBytes,
          onEditProfilePressed: () {
            context.push(
              Routes.editProfile,
              extra: EditProfileArgs(
                buttonMinWidth: 300,
                profilePictureBytes: photoBytes,
                appContext: context,
                appBar: AppBar(
                  title: Text(S.of(context).edit_profile),
                  elevation: 0,
                ),
                formArgumentsMap: [
                  EditFormArgs(label: 'Full name', value: user?.fullName ?? authUser?.displayName),
                  EditFormArgs(label: 'Username', value: user?.username ?? authUser?.displayName),
                  EditFormArgs(label: 'Email', value: user?.email ?? authUser?.email ?? '', isEditable: false),
                ],

                // EditFormArgs(
                //   formArguments: {
                //     'Full name': user?.fullName ?? authUser?.displayName ?? '',
                //     'Username': user?.username ?? authUser?.displayName ?? '',
                //     // 'Email': user?.email ?? authUser?.email ?? '',
                //     'Phone number': user?.phoneNumber ?? authUser?.phoneNumber ?? '',
                //   },
                // ),
                onSavedPressed: (List<EditFormArgs> formArgs, Uint8List? photoBytes) {
                  ref.read(photoBytesProvider.notifier).update((_) => photoBytes);
                  final localUser = LocalUser(
                    fullName: formArgs.isNotEmpty ? formArgs.elementAt(0).value : null,
                    username: formArgs.isNotEmpty ? formArgs.elementAt(1).value : null,
                    email: user?.email ?? authUser?.email ?? '',
                  );
                  ref.read(usersRepositoryProvider).saveUserData(user: localUser);
                  ref.refresh(usersRepositoryProvider);
                  context.pop();
                },
              ),
            );
          },
          userFullName: user?.fullName ?? authUser?.displayName ?? '',
          username: user?.username == '' ? null : user?.username,
        ),
      ),
      title: 'Profile',
      leftButton: IconButton(
        onPressed: () => Scaffold.of(context).openDrawer(),
        icon: Icon(
          Icons.more_vert,
          color: Theme.of(context).colorScheme.onBackground,
        ),
      ),
      rightButtons: [],
    );
  }
}
