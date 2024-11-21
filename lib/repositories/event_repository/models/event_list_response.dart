import 'package:events_app/repositories/event_repository/models/event.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'event_list_response.freezed.dart';
part 'event_list_response.g.dart';

@freezed
class EventListResponse with _$EventListResponse {
  factory EventListResponse({
    // int? count,
    // String? next,
    // bool? overflow,
    // String? previous,
    required List<Event> results,
  }) = _EventListResponse;
  const EventListResponse._();

  factory EventListResponse.fromJson(Map<String, dynamic> json) => _$EventListResponseFromJson(json);

  @override
  String toString() => toJson().toString();
}
