import 'dart:typed_data';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:events_app/repositories/user_repository/user_repository.dart';

final photoBytesProvider = StateProvider<Uint8List?>((ref) => null);

final usersRepositoryProvider = Provider.autoDispose((ref) {
  return UsersRepository();
});
