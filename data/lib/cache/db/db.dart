library db;

import 'dart:io';

import 'package:hive/hive.dart';

import 'user_cache_object.dart';

export 'user_cache_impl.dart';

void init() {
  Hive
    ..init(Directory.current.path)
    ..registerAdapter(UserCacheObjectAdapter());
}
