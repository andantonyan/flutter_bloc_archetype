import 'package:data/data.dart';

import '../../entity/entity.dart';
import '../client/client.dart';

class AuthClientImpl implements AuthClient {
  const AuthClientImpl();

  @override
  Future<UserEntity> login(final String username, final String password) async {
    await Future.delayed(const Duration(seconds: 1));

    if (username == 'admin') {
      return UserEntity('test_id', username);
    }

    throw NetworkConnectionException('Invalid credentials');
  }

  @override
  Future<UserEntity> getCurrentUser() async {
    await Future.delayed(const Duration(seconds: 1));
    throw NetworkConnectionException();
  }
}
