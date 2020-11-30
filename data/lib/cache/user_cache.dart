import '../entity/entity.dart';

abstract class UserCache {
  Stream<UserEntity> get(String userId);

  void put(UserEntity userEntity);

  bool isCached(String userId);

  bool isExpired();

  void evictAll();
}
