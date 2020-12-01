import 'package:hive/hive.dart';

import '../../entity/entity.dart';

part 'user_cache_object.g.dart';

@HiveType(typeId: 3)
class UserCacheObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String username;

  @HiveField(2)
  final DateTime created;

  const UserCacheObject(this.id, this.username, this.created);

  factory UserCacheObject.fromEntity(UserEntity entity) => UserCacheObject(entity.id, entity.username, DateTime.now());

  UserEntity toEntity() {
    return UserEntity(id, username);
  }
}
