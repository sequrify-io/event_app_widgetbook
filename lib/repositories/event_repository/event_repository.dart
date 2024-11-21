import 'package:events_app/config.dart';
import 'package:events_app/infrastructure/event_rest_client.dart';
import 'package:dio/dio.dart';
import 'package:events_app/interface/auth/sign_in_screen.dart';
import 'package:events_app/interface/home_screen.dart';
import 'package:events_app/main.dart';
import 'package:events_app/repositories/event_repository/models/event.dart';
import 'package:events_app/repositories/event_repository/models/event_list_response.dart';
import 'package:events_app/repositories/event_repository/models/favorite.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:result_dart/result_dart.dart';
import 'package:logger/logger.dart';
import 'package:timezone/timezone.dart' as tz;

class EventRepository {
  EventRepository(this.client);
  final EventRestClient client;
  final logger = Logger();

  Future<void> saveFavoriteEvent({
    required Favorite favorite,
  }) async {
    await Hive.box<Favorite>(Config.favoritesBox).put(favorite.id, favorite);
  }

  Future<void> deleteFromFavorite(String key) => Hive.box<Favorite>(Config.favoritesBox).delete(key);

  Future<List<Favorite>> fetchAllFavoriteEvents() async {
    final localFavorites = Hive.box<Favorite>(Config.favoritesBox).values.toList();
    return localFavorites;
  }

  String convertToTimeZone(String date, String timezone, {String? format}) {
    final dateTime = DateTime.parse(date);
    final datetimezone = tz.getLocation(timezone);
    final tzDateTime = tz.TZDateTime.from(dateTime, datetimezone);
    if (format == null) {
      return tzDateTime.toString();
    }
    final formatter = DateFormat(format);
    return formatter.format(tzDateTime).toString();
  }

  bool checkIfFavorite(String id) {
    final favorite = Hive.box<Favorite>(Config.favoritesBox).get(id);
    return favorite?.isFavorite ?? false;
  }

  List<Event> mergeEvents(List<Event> existingEvents, List<Event> newEvents) {
    List<Event> mergedEvents = List.from(existingEvents);

    for (var event in newEvents) {
      final isDuplicate = existingEvents.any((existingEvent) => existingEvent.id == event.id);
      if (!isDuplicate) {
        mergedEvents.add(event);
      }
    }

    return mergedEvents;
  }

  // static void exportEvents(List<Event> data) {
  //   try {
  //     var jsonList = [];
  //     data.forEach((item) => jsonList.add(json.encode(item.toJson())));
  //     File(Config.eventsExportFile).writeAsStringSync(jsonList.toString());
  //     print('Saved data successfully!');
  //   } catch (e) {
  //     print('Error: $e');
  //   }
  // }

  // List<Event> readFromJson() {
  //   try {
  //     // final stringContent = await rootBundle
  //     // .loadString('assets/events.json');
  //     // final jsonList = json.decode(stringContent);

  //     final stringContent = File(Config.eventsExportFile).readAsStringSync();
  //     final jsonList = json.decode(stringContent);
  //     return List<Event>.from(jsonList.map((e) => Event.fromJson(e)).toList());
  //   } catch (e) {
  //     print('Error: $e');
  //     return [];
  //   }
  // }

  EventListResponse getEventsFromJson(
    String? location,
    String? category,
    String startDate,
    String endDate,
    // List<Event> globalEvents,
  ) {
    final existingData = globalEvents;
    // print(existingData);
    final existingResponse = existingData.isNotEmpty ? EventListResponse(results: existingData) : EventListResponse(results: []);

    if (existingResponse.results.isNotEmpty) {
      final resultsByEndDate = existingResponse.results.where((event) {
        final eventEnd = DateTime.parse(event.end);
        final eventStart = DateTime.parse(event.start);
        return eventEnd.isBefore(DateTime.parse(endDate)) && eventStart.isAfter(DateTime.parse(startDate)) && (location == null || location == '' || event.cityName == location) && (category == null || event.category == category);
      }).toList();

      final resultsByStartDate = existingResponse.results.where((event) {
        final eventEnd = DateTime.parse(event.end);
        final eventStart = DateTime.parse(event.start);
        return eventStart.isAfter(DateTime.parse(startDate)) && eventEnd.isBefore(DateTime.parse(endDate)) && (location == null || location == '' || event.cityName == location) && (category == null || event.category == category);
      }).toList();

      var mergedEvents = [
        ...resultsByEndDate,
        ...resultsByStartDate,
      ];

      mergedEvents = mergedEvents.toSet().toList();

      final updatedEventListResponse = existingResponse.copyWith(
        results: mergedEvents,
      );

      return updatedEventListResponse;
    }
    return existingResponse;
  }

  AsyncResult<EventListResponse, DioException> getEvents(
    String? location,
    String? category,
    String? startDate,
    String? endDate,
    String accessToken,
  ) async {
    try {
      final eventsByEndDate = await client.getEvents(
        query: location,
        limit: 100,
        category: category,
        endLte: endDate,
        endGte: startDate,
        authorization: 'Bearer $accessToken',
      );

      final eventsByStartDate = await client.getEvents(
        query: location,
        limit: 100,
        category: category,
        startGte: startDate,
        startLte: endDate,
        authorization: 'Bearer $accessToken',
      );

      var mergedEvents = [
        ...eventsByEndDate.results,
        ...eventsByStartDate.results,
      ];

      mergedEvents = mergedEvents.toSet().toList();

      final finalResults = EventListResponse(results: mergedEvents);

      final results = finalResults.results.map((event) {
        return event.copyWith(
          cityName: location,
          start: convertToTimeZone(event.start, event.timezone ?? ''),
          end: convertToTimeZone(event.end, event.timezone ?? ''),
        );
      }).toList();

      final updatedEventListResponse = finalResults.copyWith(
        results: results,
      );

      // final existingData = globalEvents;
      // final existingResponse = existingData.isNotEmpty ? EventListResponse(results: existingData) : EventListResponse(results: []);

      // if (existingResponse != []) {
      //   final events = mergeEvents(existingResponse.results, updatedEventListResponse.results);
      //   // exportEvents(events);
      // } else {
      //   // exportEvents(updatedEventListResponse.results);
      // }

      logger.d('Got data : ${updatedEventListResponse.toJson()}');
      return Success(updatedEventListResponse);
    } on DioException catch (e) {
      final res = e.response;
      logger.e('Got error : ${res!.statusCode} -> ${res.statusMessage}');
      return Failure(e);
    }
  }
}
