import '../entity/entity.dart';

abstract class UserCache {
  Stream<UserEntity> get(String userId);

  Stream<UserEntity> getCurrentUser();

  Future<void> put(UserEntity userEntity);

  Future<void> putAuthUser(UserEntity userEntity);

  Future<void> clear();
}
