import 'package:dio/dio.dart';
import 'package:events_app/infrastructure/event_rest_client.dart';
import 'package:events_app/providers/json_data_provider.dart';
import 'package:events_app/repositories/event_repository/event_repository.dart';
import 'package:events_app/repositories/event_repository/models/event_list_response.dart';
import 'package:events_app/repositories/event_repository/models/favorite.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:result_dart/result_dart.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final eventRepositoryProvider = Provider.autoDispose((ref) {
  final client = EventRestClient(
    Dio(),
  );

  return EventRepository(client);
});

final startDateProvider = StateProvider<DateTime>((ref) => DateTime.now());
final endDateProvider = StateProvider<DateTime>((ref) => DateTime.now());
final locationProvider = StateProvider<String?>((ref) => null);
final categoryProvider = StateProvider<String?>((ref) => null);

final eventsProvider = FutureProvider.autoDispose<Result<EventListResponse, DioException>>((ref) async {
  final eventsRepository = ref.watch(eventRepositoryProvider);
  final accessToken = dotenv.get('PREDICTHQ_ACCESS_TOKEN');
  final location = ref.watch(locationProvider.notifier).state;
  final category = ref.watch(categoryProvider.notifier).state;
  final startDate = ref.watch(startDateProvider.notifier).state;
  final endDate = ref.watch(endDateProvider.notifier).state;

  final newStartDate = DateTime.utc(startDate.year, startDate.month, startDate.day, 0, 0, 0).toLocal();
  final formattedStart = DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'").format(newStartDate);
  final newEndDate = DateTime.utc(endDate.year, endDate.month, endDate.day, 23, 59, 59).toLocal();
  final formattedEnd = DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'").format(newEndDate);

  ref.keepAlive();

  // return eventsRepository.getEventsFromJson(
  //   location,
  //   category,
  //   formattedStart,
  //   formattedEnd,
  // );

  return eventsRepository.getEvents(
    location,
    category,
    formattedStart,
    formattedEnd,
    accessToken,
  );
});

final eventsFromJsonProvider = FutureProvider.autoDispose<EventListResponse>((ref) async {
  final eventsRepository = ref.watch(eventRepositoryProvider);
  final location = ref.watch(locationProvider.notifier).state;
  final category = ref.watch(categoryProvider.notifier).state;
  final startDate = ref.watch(startDateProvider.notifier).state;
  final endDate = ref.watch(endDateProvider.notifier).state;

  final newStartDate = DateTime.utc(startDate.year, startDate.month, startDate.day, 0, 0, 0).toLocal();
  final formattedStart = DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'").format(newStartDate);
  final newEndDate = DateTime.utc(endDate.year, endDate.month, endDate.day, 23, 59, 59).toLocal();
  final formattedEnd = DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'").format(newEndDate);

  // final globalEvents = ref.watch(jsonDataProvider.notifier).state;

  ref.keepAlive();

  return eventsRepository.getEventsFromJson(
    location,
    category,
    formattedStart,
    formattedEnd,
    // globalEvents,
  );
});

final saveFavoriteProvider = FutureProvider.autoDispose.family<void, Favorite>((ref, favorite) {
  final eventsRepository = ref.watch(eventRepositoryProvider);
  return eventsRepository.saveFavoriteEvent(favorite: favorite);
});

final favoriteEventsProvider = FutureProvider.autoDispose((ref) {
  final eventsRepository = ref.watch(eventRepositoryProvider);
  return eventsRepository.fetchAllFavoriteEvents();
});

final deleteFavoriteProvider = FutureProvider.autoDispose.family<void, String>((ref, id) {
  final eventsRepository = ref.watch(eventRepositoryProvider);
  return eventsRepository.deleteFromFavorite(id);
});
