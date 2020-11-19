library repository_impl;

import 'package:client/client.dart';
import 'package:model/model.dart';
import 'package:repository/repository.dart';

class UserRepositoryImpl implements UserRepository {
  final AuthClient authClient;

  const UserRepositoryImpl(this.authClient): assert(authClient != null);

  @override
  Stream<User> login() {
    return authClient.authenticate('username', 'password').asStream();
  }
}
