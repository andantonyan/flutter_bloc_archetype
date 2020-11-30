import '../../entity/entity.dart';

abstract class AuthClient {
  Future<UserEntity> authenticate(String username, String password);
}
