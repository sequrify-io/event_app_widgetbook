// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FavoriteImplAdapter extends TypeAdapter<_$FavoriteImpl> {
  @override
  final int typeId = 0;

  @override
  _$FavoriteImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$FavoriteImpl(
      isFavorite: fields[0] as bool,
      id: fields[1] as String,
      title: fields[2] as String,
      start: fields[3] as String,
      end: fields[4] as String,
      cityName: fields[5] as String?,
      location: (fields[6] as List?)?.cast<num>(),
      category: fields[7] as String?,
      country: fields[8] as String?,
      timezone: fields[9] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, _$FavoriteImpl obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.isFavorite)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.start)
      ..writeByte(4)
      ..write(obj.end)
      ..writeByte(5)
      ..write(obj.cityName)
      ..writeByte(7)
      ..write(obj.category)
      ..writeByte(8)
      ..write(obj.country)
      ..writeByte(9)
      ..write(obj.timezone)
      ..writeByte(6)
      ..write(obj.location);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FavoriteImplAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FavoriteImpl _$$FavoriteImplFromJson(Map<String, dynamic> json) =>
    _$FavoriteImpl(
      isFavorite: json['isFavorite'] as bool? ?? false,
      id: json['id'] as String,
      title: json['title'] as String,
      start: json['start'] as String,
      end: json['end'] as String,
      cityName: json['cityName'] as String?,
      location:
          (json['location'] as List<dynamic>?)?.map((e) => e as num).toList(),
      category: json['category'] as String?,
      country: json['country'] as String?,
      timezone: json['timezone'] as String?,
    );

Map<String, dynamic> _$$FavoriteImplToJson(_$FavoriteImpl instance) =>
    <String, dynamic>{
      'isFavorite': instance.isFavorite,
      'id': instance.id,
      'title': instance.title,
      'start': instance.start,
      'end': instance.end,
      'cityName': instance.cityName,
      'location': instance.location,
      'category': instance.category,
      'country': instance.country,
      'timezone': instance.timezone,
    };
