// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'address.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Address _$AddressFromJson(Map<String, dynamic> json) {
  return _Address.fromJson(json);
}

/// @nodoc
mixin _$Address {
  String? get name => throw _privateConstructorUsedError;
  String? get street => throw _privateConstructorUsedError;
  @JsonKey(name: 'ISO Country Code')
  String? get isoCountryCode => throw _privateConstructorUsedError;
  String? get country => throw _privateConstructorUsedError;
  @JsonKey(name: 'Postal code')
  String? get postalCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'Administrative area')
  String? get administrativeArea => throw _privateConstructorUsedError;
  @JsonKey(name: 'Subadministrative area')
  String? get subAdministrativeArea => throw _privateConstructorUsedError;
  String? get locality => throw _privateConstructorUsedError;
  String? get sublocality => throw _privateConstructorUsedError;
  String? get thoroughfare => throw _privateConstructorUsedError;
  String? get subthoroughfare => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AddressCopyWith<Address> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddressCopyWith<$Res> {
  factory $AddressCopyWith(Address value, $Res Function(Address) then) =
      _$AddressCopyWithImpl<$Res, Address>;
  @useResult
  $Res call(
      {String? name,
      String? street,
      @JsonKey(name: 'ISO Country Code') String? isoCountryCode,
      String? country,
      @JsonKey(name: 'Postal code') String? postalCode,
      @JsonKey(name: 'Administrative area') String? administrativeArea,
      @JsonKey(name: 'Subadministrative area') String? subAdministrativeArea,
      String? locality,
      String? sublocality,
      String? thoroughfare,
      String? subthoroughfare});
}

/// @nodoc
class _$AddressCopyWithImpl<$Res, $Val extends Address>
    implements $AddressCopyWith<$Res> {
  _$AddressCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? street = freezed,
    Object? isoCountryCode = freezed,
    Object? country = freezed,
    Object? postalCode = freezed,
    Object? administrativeArea = freezed,
    Object? subAdministrativeArea = freezed,
    Object? locality = freezed,
    Object? sublocality = freezed,
    Object? thoroughfare = freezed,
    Object? subthoroughfare = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      street: freezed == street
          ? _value.street
          : street // ignore: cast_nullable_to_non_nullable
              as String?,
      isoCountryCode: freezed == isoCountryCode
          ? _value.isoCountryCode
          : isoCountryCode // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      postalCode: freezed == postalCode
          ? _value.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as String?,
      administrativeArea: freezed == administrativeArea
          ? _value.administrativeArea
          : administrativeArea // ignore: cast_nullable_to_non_nullable
              as String?,
      subAdministrativeArea: freezed == subAdministrativeArea
          ? _value.subAdministrativeArea
          : subAdministrativeArea // ignore: cast_nullable_to_non_nullable
              as String?,
      locality: freezed == locality
          ? _value.locality
          : locality // ignore: cast_nullable_to_non_nullable
              as String?,
      sublocality: freezed == sublocality
          ? _value.sublocality
          : sublocality // ignore: cast_nullable_to_non_nullable
              as String?,
      thoroughfare: freezed == thoroughfare
          ? _value.thoroughfare
          : thoroughfare // ignore: cast_nullable_to_non_nullable
              as String?,
      subthoroughfare: freezed == subthoroughfare
          ? _value.subthoroughfare
          : subthoroughfare // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddressImplCopyWith<$Res> implements $AddressCopyWith<$Res> {
  factory _$$AddressImplCopyWith(
          _$AddressImpl value, $Res Function(_$AddressImpl) then) =
      __$$AddressImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? name,
      String? street,
      @JsonKey(name: 'ISO Country Code') String? isoCountryCode,
      String? country,
      @JsonKey(name: 'Postal code') String? postalCode,
      @JsonKey(name: 'Administrative area') String? administrativeArea,
      @JsonKey(name: 'Subadministrative area') String? subAdministrativeArea,
      String? locality,
      String? sublocality,
      String? thoroughfare,
      String? subthoroughfare});
}

/// @nodoc
class __$$AddressImplCopyWithImpl<$Res>
    extends _$AddressCopyWithImpl<$Res, _$AddressImpl>
    implements _$$AddressImplCopyWith<$Res> {
  __$$AddressImplCopyWithImpl(
      _$AddressImpl _value, $Res Function(_$AddressImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? street = freezed,
    Object? isoCountryCode = freezed,
    Object? country = freezed,
    Object? postalCode = freezed,
    Object? administrativeArea = freezed,
    Object? subAdministrativeArea = freezed,
    Object? locality = freezed,
    Object? sublocality = freezed,
    Object? thoroughfare = freezed,
    Object? subthoroughfare = freezed,
  }) {
    return _then(_$AddressImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      street: freezed == street
          ? _value.street
          : street // ignore: cast_nullable_to_non_nullable
              as String?,
      isoCountryCode: freezed == isoCountryCode
          ? _value.isoCountryCode
          : isoCountryCode // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      postalCode: freezed == postalCode
          ? _value.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as String?,
      administrativeArea: freezed == administrativeArea
          ? _value.administrativeArea
          : administrativeArea // ignore: cast_nullable_to_non_nullable
              as String?,
      subAdministrativeArea: freezed == subAdministrativeArea
          ? _value.subAdministrativeArea
          : subAdministrativeArea // ignore: cast_nullable_to_non_nullable
              as String?,
      locality: freezed == locality
          ? _value.locality
          : locality // ignore: cast_nullable_to_non_nullable
              as String?,
      sublocality: freezed == sublocality
          ? _value.sublocality
          : sublocality // ignore: cast_nullable_to_non_nullable
              as String?,
      thoroughfare: freezed == thoroughfare
          ? _value.thoroughfare
          : thoroughfare // ignore: cast_nullable_to_non_nullable
              as String?,
      subthoroughfare: freezed == subthoroughfare
          ? _value.subthoroughfare
          : subthoroughfare // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AddressImpl extends _Address {
  _$AddressImpl(
      {this.name,
      this.street,
      @JsonKey(name: 'ISO Country Code') this.isoCountryCode,
      this.country,
      @JsonKey(name: 'Postal code') this.postalCode,
      @JsonKey(name: 'Administrative area') this.administrativeArea,
      @JsonKey(name: 'Subadministrative area') this.subAdministrativeArea,
      this.locality,
      this.sublocality,
      this.thoroughfare,
      this.subthoroughfare})
      : super._();

  factory _$AddressImpl.fromJson(Map<String, dynamic> json) =>
      _$$AddressImplFromJson(json);

  @override
  final String? name;
  @override
  final String? street;
  @override
  @JsonKey(name: 'ISO Country Code')
  final String? isoCountryCode;
  @override
  final String? country;
  @override
  @JsonKey(name: 'Postal code')
  final String? postalCode;
  @override
  @JsonKey(name: 'Administrative area')
  final String? administrativeArea;
  @override
  @JsonKey(name: 'Subadministrative area')
  final String? subAdministrativeArea;
  @override
  final String? locality;
  @override
  final String? sublocality;
  @override
  final String? thoroughfare;
  @override
  final String? subthoroughfare;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddressImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.street, street) || other.street == street) &&
            (identical(other.isoCountryCode, isoCountryCode) ||
                other.isoCountryCode == isoCountryCode) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.postalCode, postalCode) ||
                other.postalCode == postalCode) &&
            (identical(other.administrativeArea, administrativeArea) ||
                other.administrativeArea == administrativeArea) &&
            (identical(other.subAdministrativeArea, subAdministrativeArea) ||
                other.subAdministrativeArea == subAdministrativeArea) &&
            (identical(other.locality, locality) ||
                other.locality == locality) &&
            (identical(other.sublocality, sublocality) ||
                other.sublocality == sublocality) &&
            (identical(other.thoroughfare, thoroughfare) ||
                other.thoroughfare == thoroughfare) &&
            (identical(other.subthoroughfare, subthoroughfare) ||
                other.subthoroughfare == subthoroughfare));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      street,
      isoCountryCode,
      country,
      postalCode,
      administrativeArea,
      subAdministrativeArea,
      locality,
      sublocality,
      thoroughfare,
      subthoroughfare);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddressImplCopyWith<_$AddressImpl> get copyWith =>
      __$$AddressImplCopyWithImpl<_$AddressImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AddressImplToJson(
      this,
    );
  }
}

abstract class _Address extends Address {
  factory _Address(
      {final String? name,
      final String? street,
      @JsonKey(name: 'ISO Country Code') final String? isoCountryCode,
      final String? country,
      @JsonKey(name: 'Postal code') final String? postalCode,
      @JsonKey(name: 'Administrative area') final String? administrativeArea,
      @JsonKey(name: 'Subadministrative area')
      final String? subAdministrativeArea,
      final String? locality,
      final String? sublocality,
      final String? thoroughfare,
      final String? subthoroughfare}) = _$AddressImpl;
  _Address._() : super._();

  factory _Address.fromJson(Map<String, dynamic> json) = _$AddressImpl.fromJson;

  @override
  String? get name;
  @override
  String? get street;
  @override
  @JsonKey(name: 'ISO Country Code')
  String? get isoCountryCode;
  @override
  String? get country;
  @override
  @JsonKey(name: 'Postal code')
  String? get postalCode;
  @override
  @JsonKey(name: 'Administrative area')
  String? get administrativeArea;
  @override
  @JsonKey(name: 'Subadministrative area')
  String? get subAdministrativeArea;
  @override
  String? get locality;
  @override
  String? get sublocality;
  @override
  String? get thoroughfare;
  @override
  String? get subthoroughfare;
  @override
  @JsonKey(ignore: true)
  _$$AddressImplCopyWith<_$AddressImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
