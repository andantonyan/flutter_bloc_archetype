import '../../entity/entity.dart';
import '../client/client.dart';

class AuthClientImpl implements AuthClient {
  Future<UserEntity> authenticate(final String username, final String password) async {
    return UserEntity('test_id', username);
  }
}
