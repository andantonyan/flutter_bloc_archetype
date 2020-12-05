import '../../entity/entity.dart';
import '../client/client.dart';

class AuthClientImpl implements AuthClient {
  @override
  Future<UserEntity> login(final String username, final String password) async {
    return UserEntity('test_id', username);
  }

  @override
  Future<UserEntity> getCurrentUser() async {
    return UserEntity('id', 'from_api');
  }
}
