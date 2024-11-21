// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AddressImpl _$$AddressImplFromJson(Map<String, dynamic> json) =>
    _$AddressImpl(
      name: json['name'] as String?,
      street: json['street'] as String?,
      isoCountryCode: json['ISO Country Code'] as String?,
      country: json['country'] as String?,
      postalCode: json['Postal code'] as String?,
      administrativeArea: json['Administrative area'] as String?,
      subAdministrativeArea: json['Subadministrative area'] as String?,
      locality: json['locality'] as String?,
      sublocality: json['sublocality'] as String?,
      thoroughfare: json['thoroughfare'] as String?,
      subthoroughfare: json['subthoroughfare'] as String?,
    );

Map<String, dynamic> _$$AddressImplToJson(_$AddressImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'street': instance.street,
      'ISO Country Code': instance.isoCountryCode,
      'country': instance.country,
      'Postal code': instance.postalCode,
      'Administrative area': instance.administrativeArea,
      'Subadministrative area': instance.subAdministrativeArea,
      'locality': instance.locality,
      'sublocality': instance.sublocality,
      'thoroughfare': instance.thoroughfare,
      'subthoroughfare': instance.subthoroughfare,
    };
