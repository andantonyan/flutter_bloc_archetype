import '../../entity/entity.dart';

abstract class AuthClient {
  Future<UserEntity> login(String username, String password);
  Future<UserEntity> getCurrentUser();
}
