// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyC-BuS-_-f5H-Dko8L2pbwIbGTmrzm18BQ',
    appId: '1:952897876922:web:38745d75dd74ed587da383',
    messagingSenderId: '952897876922',
    projectId: 'sequrify-ca97a',
    authDomain: 'sequrify-ca97a.firebaseapp.com',
    storageBucket: 'sequrify-ca97a.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC_R4UUEmaAWHMJobr1uFiePF2NQFpdIs4',
    appId: '1:952897876922:android:c49d32c6d513bfc27da383',
    messagingSenderId: '952897876922',
    projectId: 'sequrify-ca97a',
    storageBucket: 'sequrify-ca97a.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCEq58BOw2mrMfNmcJvF4OT35w0tyta26U',
    appId: '1:952897876922:ios:c5d557212c6fe65e7da383',
    messagingSenderId: '952897876922',
    projectId: 'sequrify-ca97a',
    storageBucket: 'sequrify-ca97a.appspot.com',
    iosClientId: '952897876922-8h00ehfv4noblup0ghrccdc8pjja4df0.apps.googleusercontent.com',
    iosBundleId: 'com.nx.eventsApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCEq58BOw2mrMfNmcJvF4OT35w0tyta26U',
    appId: '1:952897876922:ios:6880aca30e5cbb6a7da383',
    messagingSenderId: '952897876922',
    projectId: 'sequrify-ca97a',
    storageBucket: 'sequrify-ca97a.appspot.com',
    iosClientId: '952897876922-7aciesupn894tgdn2t1afs2fd1i5l2dd.apps.googleusercontent.com',
    iosBundleId: 'com.nx.eventsApp.RunnerTests',
  );
}