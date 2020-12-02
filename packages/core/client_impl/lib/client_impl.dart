library client_impl;

import 'package:client/client.dart';
import 'package:model/model.dart';

class AuthClientImpl implements AuthClient {
  @override
  Future<User> authenticate(final String username, final String password) async {
    return User(id: 'id', firstName: 'firstName', lastName: 'lastName');
  }

  @override
  Future<User> getCurrentUser() async {
    return User(id: 'id', firstName: 'firstName', lastName: 'lastName');
  }
}
