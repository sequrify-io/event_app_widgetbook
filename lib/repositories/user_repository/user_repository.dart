import 'package:events_app/config.dart';
import 'package:events_app/repositories/user_repository/models/user.dart';
import 'package:hive/hive.dart';

class UsersRepository {
  UsersRepository();

  Future<void> saveUserData({
    required LocalUser user,
  }) async {
    await Hive.box<LocalUser>(Config.userBox).put(user.email, user);
  }

  LocalUser? getUserData({
    String? email,
  }) {
    return Hive.box<LocalUser>(Config.userBox).get(email);
  }
}
