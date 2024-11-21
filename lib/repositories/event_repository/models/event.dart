import 'package:events_app/repositories/geocode_repository/models/address.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'event.freezed.dart';
part 'event.g.dart';

@freezed
class Event with _$Event {
  factory Event({
    String? category,
    String? country,
    required String end,
    String? id,
    List<num>? location,
    required String start,
    String? timezone,
    required String title,
    String? cityName,
    Address? address,
  }) = _Event;
  const Event._();

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);

  @override
  String toString() => toJson().toString();
}

@freezed
class Entity with _$Entity {
  factory Entity({
    String? entity_id,
    String? name,
    String? type,
  }) = _Entity;
  const Entity._();

  factory Entity.fromJson(Map<String, dynamic> json) => _$EntityFromJson(json);

  @override
  String toString() => toJson().toString();
}
