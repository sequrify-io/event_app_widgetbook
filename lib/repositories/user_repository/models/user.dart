import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class LocalUser with _$LocalUser {
  @HiveType(typeId: 1)
  factory LocalUser({
    @HiveField(0) String? fullName,
    @HiveField(1) String? username,
    @HiveField(2) String? email,
    @HiveField(3) String? phoneNumber,
    @HiveField(4) String? photoURL,
  }) = _LocalUser;
  const LocalUser._();

  factory LocalUser.fromJson(Map<String, dynamic> json) => _$LocalUserFromJson(json);

  @override
  String toString() => toJson().toString();
}
