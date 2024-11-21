// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EventImpl _$$EventImplFromJson(Map<String, dynamic> json) => _$EventImpl(
      category: json['category'] as String?,
      country: json['country'] as String?,
      end: json['end'] as String,
      id: json['id'] as String?,
      location:
          (json['location'] as List<dynamic>?)?.map((e) => e as num).toList(),
      start: json['start'] as String,
      timezone: json['timezone'] as String?,
      title: json['title'] as String,
      cityName: json['cityName'] as String?,
      address: json['address'] == null
          ? null
          : Address.fromJson(json['address'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$EventImplToJson(_$EventImpl instance) =>
    <String, dynamic>{
      'category': instance.category,
      'country': instance.country,
      'end': instance.end,
      'id': instance.id,
      'location': instance.location,
      'start': instance.start,
      'timezone': instance.timezone,
      'title': instance.title,
      'cityName': instance.cityName,
      'address': instance.address,
    };

_$EntityImpl _$$EntityImplFromJson(Map<String, dynamic> json) => _$EntityImpl(
      entity_id: json['entity_id'] as String?,
      name: json['name'] as String?,
      type: json['type'] as String?,
    );

Map<String, dynamic> _$$EntityImplToJson(_$EntityImpl instance) =>
    <String, dynamic>{
      'entity_id': instance.entity_id,
      'name': instance.name,
      'type': instance.type,
    };
