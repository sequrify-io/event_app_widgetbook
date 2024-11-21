// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event_list_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EventListResponse _$EventListResponseFromJson(Map<String, dynamic> json) {
  return _EventListResponse.fromJson(json);
}

/// @nodoc
mixin _$EventListResponse {
// int? count,
// String? next,
// bool? overflow,
// String? previous,
  List<Event> get results => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EventListResponseCopyWith<EventListResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventListResponseCopyWith<$Res> {
  factory $EventListResponseCopyWith(
          EventListResponse value, $Res Function(EventListResponse) then) =
      _$EventListResponseCopyWithImpl<$Res, EventListResponse>;
  @useResult
  $Res call({List<Event> results});
}

/// @nodoc
class _$EventListResponseCopyWithImpl<$Res, $Val extends EventListResponse>
    implements $EventListResponseCopyWith<$Res> {
  _$EventListResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? results = null,
  }) {
    return _then(_value.copyWith(
      results: null == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<Event>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EventListResponseImplCopyWith<$Res>
    implements $EventListResponseCopyWith<$Res> {
  factory _$$EventListResponseImplCopyWith(_$EventListResponseImpl value,
          $Res Function(_$EventListResponseImpl) then) =
      __$$EventListResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Event> results});
}

/// @nodoc
class __$$EventListResponseImplCopyWithImpl<$Res>
    extends _$EventListResponseCopyWithImpl<$Res, _$EventListResponseImpl>
    implements _$$EventListResponseImplCopyWith<$Res> {
  __$$EventListResponseImplCopyWithImpl(_$EventListResponseImpl _value,
      $Res Function(_$EventListResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? results = null,
  }) {
    return _then(_$EventListResponseImpl(
      results: null == results
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<Event>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EventListResponseImpl extends _EventListResponse {
  _$EventListResponseImpl({required final List<Event> results})
      : _results = results,
        super._();

  factory _$EventListResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$EventListResponseImplFromJson(json);

// int? count,
// String? next,
// bool? overflow,
// String? previous,
  final List<Event> _results;
// int? count,
// String? next,
// bool? overflow,
// String? previous,
  @override
  List<Event> get results {
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventListResponseImpl &&
            const DeepCollectionEquality().equals(other._results, _results));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_results));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EventListResponseImplCopyWith<_$EventListResponseImpl> get copyWith =>
      __$$EventListResponseImplCopyWithImpl<_$EventListResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EventListResponseImplToJson(
      this,
    );
  }
}

abstract class _EventListResponse extends EventListResponse {
  factory _EventListResponse({required final List<Event> results}) =
      _$EventListResponseImpl;
  _EventListResponse._() : super._();

  factory _EventListResponse.fromJson(Map<String, dynamic> json) =
      _$EventListResponseImpl.fromJson;

  @override // int? count,
// String? next,
// bool? overflow,
// String? previous,
  List<Event> get results;
  @override
  @JsonKey(ignore: true)
  _$$EventListResponseImplCopyWith<_$EventListResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
