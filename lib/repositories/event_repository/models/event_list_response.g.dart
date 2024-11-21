// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EventListResponseImpl _$$EventListResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$EventListResponseImpl(
      results: (json['results'] as List<dynamic>)
          .map((e) => Event.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$EventListResponseImplToJson(
        _$EventListResponseImpl instance) =>
    <String, dynamic>{
      'results': instance.results,
    };
