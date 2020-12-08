import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'auth/auth.dart';
import 'home/home.dart';
import 'login/login.dart';
import 'splash/splash.dart';

class App extends StatelessWidget {
  final CurrentUserStream currentUserStream;
  final Login login;
  final Logout logout;

  const App({Key key, this.currentUserStream, @required this.login, @required this.logout})
      : assert(currentUserStream != null),
        assert(login != null),
        assert(logout != null),
        super(key: key);

  @override
  Widget build(final BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: currentUserStream),
        RepositoryProvider.value(value: login),
        RepositoryProvider.value(value: logout),
      ],
      child: BlocProvider(
        create: (context) => AuthBloc(currentUserStream, logout),
        child: AppView(),
      ),
    );
  }
}

class AppView extends StatefulWidget {
  @override
  _AppViewState createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState get _navigator => _navigatorKey.currentState;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: _navigatorKey,
      builder: (context, child) {
        return BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            switch (state.status) {
              case AuthStatus.authenticated:
                _navigator.pushAndRemoveUntil<void>(
                  HomePage.route(),
                  (route) => false,
                );
                break;
              case AuthStatus.unauthenticated:
                _navigator.pushAndRemoveUntil<void>(
                  LoginPage.route(),
                  (route) => false,
                );
                break;
              default:
                break;
            }
          },
          child: child,
        );
      },
      onGenerateRoute: (_) => SplashPage.route(),
    );
  }
}
