// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'favorite.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Favorite _$FavoriteFromJson(Map<String, dynamic> json) {
  return _Favorite.fromJson(json);
}

/// @nodoc
mixin _$Favorite {
  @HiveField(0)
  bool get isFavorite => throw _privateConstructorUsedError;
  @HiveField(1)
  String get id => throw _privateConstructorUsedError;
  @HiveField(2)
  String get title => throw _privateConstructorUsedError;
  @HiveField(3)
  String get start => throw _privateConstructorUsedError;
  @HiveField(4)
  String get end => throw _privateConstructorUsedError;
  @HiveField(5)
  String? get cityName => throw _privateConstructorUsedError;
  @HiveField(6)
  List<num>? get location => throw _privateConstructorUsedError;
  @HiveField(7)
  String? get category => throw _privateConstructorUsedError;
  @HiveField(8)
  String? get country => throw _privateConstructorUsedError;
  @HiveField(9)
  String? get timezone => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FavoriteCopyWith<Favorite> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavoriteCopyWith<$Res> {
  factory $FavoriteCopyWith(Favorite value, $Res Function(Favorite) then) =
      _$FavoriteCopyWithImpl<$Res, Favorite>;
  @useResult
  $Res call(
      {@HiveField(0) bool isFavorite,
      @HiveField(1) String id,
      @HiveField(2) String title,
      @HiveField(3) String start,
      @HiveField(4) String end,
      @HiveField(5) String? cityName,
      @HiveField(6) List<num>? location,
      @HiveField(7) String? category,
      @HiveField(8) String? country,
      @HiveField(9) String? timezone});
}

/// @nodoc
class _$FavoriteCopyWithImpl<$Res, $Val extends Favorite>
    implements $FavoriteCopyWith<$Res> {
  _$FavoriteCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFavorite = null,
    Object? id = null,
    Object? title = null,
    Object? start = null,
    Object? end = null,
    Object? cityName = freezed,
    Object? location = freezed,
    Object? category = freezed,
    Object? country = freezed,
    Object? timezone = freezed,
  }) {
    return _then(_value.copyWith(
      isFavorite: null == isFavorite
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      start: null == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as String,
      end: null == end
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as String,
      cityName: freezed == cityName
          ? _value.cityName
          : cityName // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as List<num>?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      timezone: freezed == timezone
          ? _value.timezone
          : timezone // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FavoriteImplCopyWith<$Res>
    implements $FavoriteCopyWith<$Res> {
  factory _$$FavoriteImplCopyWith(
          _$FavoriteImpl value, $Res Function(_$FavoriteImpl) then) =
      __$$FavoriteImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) bool isFavorite,
      @HiveField(1) String id,
      @HiveField(2) String title,
      @HiveField(3) String start,
      @HiveField(4) String end,
      @HiveField(5) String? cityName,
      @HiveField(6) List<num>? location,
      @HiveField(7) String? category,
      @HiveField(8) String? country,
      @HiveField(9) String? timezone});
}

/// @nodoc
class __$$FavoriteImplCopyWithImpl<$Res>
    extends _$FavoriteCopyWithImpl<$Res, _$FavoriteImpl>
    implements _$$FavoriteImplCopyWith<$Res> {
  __$$FavoriteImplCopyWithImpl(
      _$FavoriteImpl _value, $Res Function(_$FavoriteImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFavorite = null,
    Object? id = null,
    Object? title = null,
    Object? start = null,
    Object? end = null,
    Object? cityName = freezed,
    Object? location = freezed,
    Object? category = freezed,
    Object? country = freezed,
    Object? timezone = freezed,
  }) {
    return _then(_$FavoriteImpl(
      isFavorite: null == isFavorite
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      start: null == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as String,
      end: null == end
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as String,
      cityName: freezed == cityName
          ? _value.cityName
          : cityName // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value._location
          : location // ignore: cast_nullable_to_non_nullable
              as List<num>?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      timezone: freezed == timezone
          ? _value.timezone
          : timezone // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 0)
class _$FavoriteImpl extends _Favorite {
  _$FavoriteImpl(
      {@HiveField(0) this.isFavorite = false,
      @HiveField(1) required this.id,
      @HiveField(2) required this.title,
      @HiveField(3) required this.start,
      @HiveField(4) required this.end,
      @HiveField(5) this.cityName,
      @HiveField(6) final List<num>? location,
      @HiveField(7) this.category,
      @HiveField(8) this.country,
      @HiveField(9) this.timezone})
      : _location = location,
        super._();

  factory _$FavoriteImpl.fromJson(Map<String, dynamic> json) =>
      _$$FavoriteImplFromJson(json);

  @override
  @JsonKey()
  @HiveField(0)
  final bool isFavorite;
  @override
  @HiveField(1)
  final String id;
  @override
  @HiveField(2)
  final String title;
  @override
  @HiveField(3)
  final String start;
  @override
  @HiveField(4)
  final String end;
  @override
  @HiveField(5)
  final String? cityName;
  final List<num>? _location;
  @override
  @HiveField(6)
  List<num>? get location {
    final value = _location;
    if (value == null) return null;
    if (_location is EqualUnmodifiableListView) return _location;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @HiveField(7)
  final String? category;
  @override
  @HiveField(8)
  final String? country;
  @override
  @HiveField(9)
  final String? timezone;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FavoriteImpl &&
            (identical(other.isFavorite, isFavorite) ||
                other.isFavorite == isFavorite) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.start, start) || other.start == start) &&
            (identical(other.end, end) || other.end == end) &&
            (identical(other.cityName, cityName) ||
                other.cityName == cityName) &&
            const DeepCollectionEquality().equals(other._location, _location) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.timezone, timezone) ||
                other.timezone == timezone));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      isFavorite,
      id,
      title,
      start,
      end,
      cityName,
      const DeepCollectionEquality().hash(_location),
      category,
      country,
      timezone);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FavoriteImplCopyWith<_$FavoriteImpl> get copyWith =>
      __$$FavoriteImplCopyWithImpl<_$FavoriteImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FavoriteImplToJson(
      this,
    );
  }
}

abstract class _Favorite extends Favorite {
  factory _Favorite(
      {@HiveField(0) final bool isFavorite,
      @HiveField(1) required final String id,
      @HiveField(2) required final String title,
      @HiveField(3) required final String start,
      @HiveField(4) required final String end,
      @HiveField(5) final String? cityName,
      @HiveField(6) final List<num>? location,
      @HiveField(7) final String? category,
      @HiveField(8) final String? country,
      @HiveField(9) final String? timezone}) = _$FavoriteImpl;
  _Favorite._() : super._();

  factory _Favorite.fromJson(Map<String, dynamic> json) =
      _$FavoriteImpl.fromJson;

  @override
  @HiveField(0)
  bool get isFavorite;
  @override
  @HiveField(1)
  String get id;
  @override
  @HiveField(2)
  String get title;
  @override
  @HiveField(3)
  String get start;
  @override
  @HiveField(4)
  String get end;
  @override
  @HiveField(5)
  String? get cityName;
  @override
  @HiveField(6)
  List<num>? get location;
  @override
  @HiveField(7)
  String? get category;
  @override
  @HiveField(8)
  String? get country;
  @override
  @HiveField(9)
  String? get timezone;
  @override
  @JsonKey(ignore: true)
  _$$FavoriteImplCopyWith<_$FavoriteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
