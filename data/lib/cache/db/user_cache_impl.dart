import 'dart:async';

import 'package:hive/hive.dart';

import '../../entity/entity.dart';
import '../user_cache.dart';
import 'user_cache_object.dart';

class UserCacheImpl implements UserCache {
  static final _boxName = 'user_cache';
  static final _currentUserKey = 'current_user';
  static final _cacheTTL = Duration(minutes: 10);

  final Box _box;

  UserCacheImpl._(this._box);

  static Future create() async {
    final box = await Hive.openBox(_boxName);
    return UserCacheImpl._(box);
  }

  @override
  Stream<UserEntity> get(final String userId) async* {
    assert(userId != null);

    final UserCacheObject cachedUser = _box.get(userId);

    if (cachedUser != null && !cachedUser.isExpired) {
      yield cachedUser.toEntity();
    } else {
      yield null;
    }
  }

  @override
  Stream<UserEntity> getCurrentUser() async* {
    final UserCacheObject cachedUser = _box.get(_currentUserKey);

    if (cachedUser != null && !cachedUser.isExpired) {
      yield cachedUser.toEntity();
    } else {
      yield null;
    }
  }

  @override
  Future<void> put(final UserEntity userEntity) async {
    assert(userEntity != null);

    final obj = UserCacheObject.fromEntity(userEntity, _cacheTTL);
    await _box.put(obj.id, obj);
  }

  @override
  Future<void> putAuthUser(final UserEntity userEntity) async {
    assert(userEntity != null);

    final obj = UserCacheObject.fromEntity(userEntity, _cacheTTL);
    await _box.put(obj.id, obj);
    await _box.put(_currentUserKey, obj);
  }

  @override
  Future<void> clear() async {
    await _box.clear();
  }
}
