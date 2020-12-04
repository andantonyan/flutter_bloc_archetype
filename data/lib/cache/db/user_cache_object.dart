import 'package:hive/hive.dart';

import '../../entity/entity.dart';

part 'user_cache_object.g.dart';

@HiveType(typeId: 4)
class UserCacheObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String username;

  @HiveField(2)
  final DateTime created;

  @HiveField(3)
  final DateTime expires;

  bool get isExpired {
    return expires.isAfter(created);
  }

  const UserCacheObject(this.id, this.username, this.created, this.expires);

  factory UserCacheObject.fromEntity(UserEntity entity, Duration ttl) =>
      UserCacheObject(entity.id, entity.username, DateTime.now(), DateTime.now()..add(ttl));

  UserEntity toEntity() {
    return UserEntity(id, username);
  }
}
