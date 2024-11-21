import 'package:freezed_annotation/freezed_annotation.dart';

part 'address.freezed.dart';
part 'address.g.dart';

@freezed
class Address with _$Address {
  factory Address({
    String? name,
    String? street,
    @JsonKey(name: 'ISO Country Code') String? isoCountryCode,
    String? country,
    @JsonKey(name: 'Postal code') String? postalCode,
    @JsonKey(name: 'Administrative area') String? administrativeArea,
    @JsonKey(name: 'Subadministrative area') String? subAdministrativeArea,
    String? locality,
    String? sublocality,
    String? thoroughfare,
    String? subthoroughfare,
  }) = _Address;
  const Address._();

  factory Address.fromJson(Map<String, dynamic> json) => _$AddressFromJson(json);

  @override
  String toString() => toJson().toString();
}
