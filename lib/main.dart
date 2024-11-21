import 'dart:async';
import 'dart:convert';
import 'dart:isolate';

import 'package:events_app/repositories/event_repository/models/event.dart';
import 'package:events_app/repositories/event_repository/models/favorite.dart';
import 'package:events_app/repositories/user_repository/models/user.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'package:events_app/config.dart';
import 'package:events_app/generated/intl/messages_all.dart';
import 'package:events_app/generated/l10n.dart';
import 'package:events_app/infrastructure/firebase_options.dart';
import 'package:events_app/providers/router_provider.dart';
import 'package:events_app/theme/theme.dart';
import 'package:nx_localizations/generated/l10n.dart';
import 'package:multiple_localization/multiple_localization.dart';
import 'package:nx_firebase_auth/nx_firebase_auth.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:nx_settings/nx_settings.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:flutter/services.dart' show DeviceOrientation, SystemChrome, rootBundle;

List<Event> globalEvents = [];

Future<void> loadJsonData() async {
  final jsonString = await rootBundle.loadString('assets/events.json');
  final jsonData = json.decode(jsonString);
  globalEvents = List<Event>.from(jsonData.map((e) => Event.fromJson(e)).toList());
}

Future<void> main() async {
  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

    await Hive.initFlutter();
    Hive
      ..registerAdapter(FavoriteImplAdapter())
      ..registerAdapter(LocalUserImplAdapter());
    // await Hive.openBox<Favorite>(Config.favoritesBox);
    // await Hive.openBox<LocalUser>(Config.userBox);
    // await initializeDateFormatting();
    // tz.initializeTimeZones();

    // await Preferences.init();
    // await loadJsonData();

    await Future.wait([
      Hive.openBox<Favorite>(Config.favoritesBox),
      Hive.openBox<LocalUser>(Config.userBox),
      initializeDateFormatting(),
      Preferences.init(),
      loadJsonData(),
    ]);

    tz.initializeTimeZones();

    FirebaseUIAuth.configureProviders([
      EmailAuthProvider(),
    ]);

    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;

    Isolate.current.addErrorListener(
      RawReceivePort((pair) async {
        final List<dynamic> errorAndStacktrace = pair;
        await FirebaseCrashlytics.instance.recordError(errorAndStacktrace.first, errorAndStacktrace.last);
      }).sendPort,
    );

    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
      (value) => runApp(
        const ProviderScope(
          child: MyApp(),
        ),
      ),
    );
  }, (error, stackTrace) {
    FirebaseCrashlytics.instance.recordError(error, stackTrace, fatal: true);
  });
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: Config.appTitle,
      builder: (context, child) {
        if (!kDebugMode) {
          // ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
          //   return CustomError(errorDetails: errorDetails);
          // };
        }
        return child ?? Container();
      },
      // showSemanticsDebugger: true,
      themeMode: ref.watch(themeProvider),
      theme: MaterialTheme(Theme.of(context).textTheme).light(),
      darkTheme: MaterialTheme(Theme.of(context).textTheme).dark(),
      routerConfig: router,
      localizationsDelegates: const [
        _S.delegate,
        S.delegate,
      ],
      supportedLocales: AppLocalizations.delegate.supportedLocales,
      locale: ref.watch(languageProvider),
    );
  }
}

class _S extends AppLocalizations {
  static const _SDelegate delegate = _SDelegate();
}

class _SDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _SDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      // Locale.fromSubtags(languageCode: 'pl'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);

  @override
  Future<AppLocalizations> load(Locale locale) {
    return MultipleLocalizations.load(initializeMessages, locale, (l) => AppLocalizations.load(Locale(l)), setDefaultLocale: true);
  }

  @override
  bool shouldReload(LocalizationsDelegate<AppLocalizations> old) {
    return false;
  }

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
