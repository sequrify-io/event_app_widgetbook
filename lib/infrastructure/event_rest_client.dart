import 'package:events_app/repositories/event_repository/models/event_list_response.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'event_rest_client.g.dart';

@RestApi(baseUrl: 'https://api.predicthq.com/v1')
abstract class EventRestClient {
  factory EventRestClient(Dio dio, {String baseUrl}) = _EventRestClient;

  @GET('/events/')
  Future<EventListResponse> getEvents({
    @Query('q') String? query,
    @Query('within') String? within,
    @Query('limit') int? limit,
    @Query("category") String? category,
    @Query("start.gte") String? startGte,
    @Query("start.lte") String? startLte,
    @Query("end.gte") String? endGte,
    @Query("end.lte") String? endLte,
    @Header('Authorization') required String authorization,
  });
}
