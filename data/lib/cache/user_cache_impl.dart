import './user_cache.dart';
import '../entity/entity.dart';

class UserCacheImpl implements UserCache {
  Stream<UserEntity> get(String userId) async* {}

  void put(UserEntity userEntity) {}

  bool isCached(String userId) {}

  bool isExpired() {}

  void evictAll() {}
}
