import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:domain/domain.dart';
import 'package:equatable/equatable.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final CurrentUserStream _currentUserStream;
  final Logout _logout;

  StreamSubscription<User> _currentUserSubscription;

  AuthBloc(
    this._currentUserStream,
    this._logout,
  )   : assert(_currentUserStream != null),
        assert(_logout != null),
        super(const AuthState.unknown()) {
    _currentUserSubscription = _currentUserStream
        .execute(null)
        .listen((user) => add(AuthUserChanged(user)), onError: (err) {
          print('err $err');
          add(AuthUserChanged(null));
        });
  }

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    if (event is AuthUserChanged) {
      yield* _mapAuthUserChangedToState(event);
    } else if (event is AuthLogoutRequested) {
      await _logout.execute(null);
    }
  }

  @override
  Future<void> close() {
    _currentUserSubscription?.cancel();
    return super.close();
  }

  Stream<AuthState> _mapAuthUserChangedToState(
    AuthUserChanged event,
  ) async* {
    yield event.user != null ? AuthState.authenticated(event.user) : const AuthState.unauthenticated();
  }
}
