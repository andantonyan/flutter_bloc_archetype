import '../entity/entity.dart';

abstract class UserCache {
  Stream<UserEntity> get(String userId);

  Future<void> put(UserEntity userEntity);

  Future<bool> isCached(String userId);

  Future<bool> isExpired(String userId);

  Future<void> clear();
}
