import 'package:flutter/material.dart';

class Config {
  /// App title used in [MaterialApp]; Is passed to [WidgetsApp.title].
  static const appTitle = 'Nextapps app';

  /// When deep linking is configured, this prefix should be used in every navigation link that should be opened in a native app.
  static const deepLinkPrefix = 'nextapps://nextapps.co';
  // TODO design a system to manage api url. Variable, .env, ENV?
  static const apiUrl = 'https://app.nextapps.co';

  // Hive box names
  static const nxBox = '__NXBOX__';
  static const passwordlessLoginBox = 'passwordlessLogin';
  static const userSettingsBox = 'userSettings';
  static const userBox = 'user';
  static const favoritesBox = 'favorites';

  // static const path = '/Users/justyna/jsonfiles/';
  // // static const nowyPlikNowyAdres = path + 'nowy_adres.json';
  // static const eventsExportFile = path + 'events.json';
  // static const readEvents = path + 'ready_events.json';
  // static const events = path + 'many_events_no_address.json';
  // static const newEvents = path + 'newEvents.json';

   static const categoryList = <String>[
    'school-holidays',
    'public-holidays',
    'observances',
    'politics',
    'conferences',
    'expos',
    'concerts',
    'festivals',
    'performing-arts',
    'sports',
    'community',
    'daylight-savings',
    'airport-delays',
    'severe-weather',
    'disasters',
    'terror',
    'health-warnings',
    'academic',
  ];
}
