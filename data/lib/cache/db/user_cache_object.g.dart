// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_cache_object.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserCacheObjectAdapter extends TypeAdapter<UserCacheObject> {
  @override
  final int typeId = 3;

  @override
  UserCacheObject read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserCacheObject(
      fields[0] as String,
      fields[1] as String,
      fields[2] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, UserCacheObject obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.username)
      ..writeByte(2)
      ..write(obj.created);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserCacheObjectAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
