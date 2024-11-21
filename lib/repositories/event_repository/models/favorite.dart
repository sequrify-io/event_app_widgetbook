import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'favorite.freezed.dart';
part 'favorite.g.dart';

@freezed
class Favorite with _$Favorite {
  @HiveType(typeId: 0)
  factory Favorite({
    @HiveField(0) @Default(false) bool isFavorite,
    @HiveField(1) required String id,
    @HiveField(2) required String title,
    @HiveField(3) required String start,
    @HiveField(4) required String end,
    @HiveField(5) String? cityName,
    @HiveField(6) List<num>? location,
    @HiveField(7) String? category,
    @HiveField(8) String? country,
    @HiveField(9) String? timezone,
  }) = _Favorite;
  const Favorite._();

  factory Favorite.fromJson(Map<String, dynamic> json) => _$FavoriteFromJson(json);

  @override
  String toString() => toJson().toString();
}
