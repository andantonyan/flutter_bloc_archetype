import 'package:hive/hive.dart';

class UserDataObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String username;

  const UserDataObject(this.id, this.username);
}
