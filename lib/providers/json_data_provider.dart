// import 'dart:convert';

// import 'package:events_app/repositories/event_repository/models/event.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// final jsonDataProvider = StateProvider<List<Event>>((ref) => []);

// final loadJsonDataProvider = FutureProvider((ref) async {
//   final jsonString = await rootBundle.loadString('assets/events.json');
//   final jsonData = json.decode(jsonString);
//   ref.read(jsonDataProvider.notifier).update((_) => List<Event>.from(jsonData.map((e) => Event.fromJson(e)).toList()));
// });


