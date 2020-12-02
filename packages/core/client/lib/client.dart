library client;

import 'package:model/model.dart';

abstract class AuthClient {
  Future<User> authenticate(String username, String password);

  Future<User> getCurrentUser();
}
