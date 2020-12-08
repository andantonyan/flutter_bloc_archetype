import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final tempDir = await getTemporaryDirectory();

  await initDB(tempDir.path);
  final userCache = await UserCacheImpl.create();
  final authClient = const AuthClientImpl();
  final authDataRepository = AuthDataRepository(authClient, userCache);
  final currentUserStream = CurrentUserStream(authDataRepository);
  final login = Login(authDataRepository);
  final logout = Logout(authDataRepository);

  runApp(
    App(
      currentUserStream: currentUserStream,
      login: login,
      logout: logout,
    ),
  );
}
