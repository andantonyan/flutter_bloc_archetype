library repository_impl;

import 'package:model/model.dart';
import 'package:repository/repository.dart';

class UserRepositoryImpl implements UserRepository {
  @override
  Future<User> login() async {
    return User();
  }
}
