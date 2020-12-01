import 'package:hive/hive.dart';

import '../../entity/entity.dart';
import '../../exception/exception.dart';
import '../user_cache.dart';
import 'user_cache_object.dart';

class UserCacheImpl implements UserCache {
  static final _boxName = 'user_cache';
  static final _expirationTimeInMs = 60 * 10 * 1000;

  Box _box;

  UserCacheImpl() {
    _init();
  }

  Future _init() async {
    _box = await Hive.openBox(_boxName);
  }

  Stream<UserEntity> get(final String userId) async* {
    assert(userId != null);

    final userEntity = _box.get(userId)?.toEntity();

    if (userEntity != null) {
      yield userEntity;
    } else {
      throw UserNotFoundException();
    }
  }

  Future<void> put(final UserEntity userEntity) async {
    assert(userEntity != null);

    final obj = UserCacheObject.fromEntity(userEntity);
    await _box.put(obj.id, obj);
  }

  Future<bool> isCached(final String userId) async {
    assert(userId != null);

    return _box.containsKey(userId);
  }

  Future<bool> isExpired(final String userId) async {
    final UserCacheObject userCache = _box.get(userId);

    return userCache == null ||
        userCache.created.add(Duration(milliseconds: _expirationTimeInMs)).isAfter(DateTime.now());
  }

  Future<void> clear() async {
    await _box.clear();
  }
}
