library db;

import 'package:hive/hive.dart';

import 'user_cache_object.dart';

export 'user_cache_impl.dart';

void initDB(final String path) {
  Hive
    ..init(path)
    ..registerAdapter(UserCacheObjectAdapter());
}
