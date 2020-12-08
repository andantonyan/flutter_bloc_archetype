import 'dart:async';

import '../../model/model.dart';
import '../../repository/repository.dart';
import '../use_case_stream.dart';

class AuthStatusStream implements UseCaseStream<AuthStatus, void> {
  final AuthRepository _authRepository;

  AuthStatusStream(this._authRepository) : assert(_authRepository != null);

  @override
  Stream<AuthStatus> execute(_) {
    return _authRepository.getCurrentUserStream().transform(
      StreamTransformer<User, AuthStatus>.fromHandlers(
        handleData: (user, sink) {
          sink.add(user == null ? AuthStatus.unauthenticated : AuthStatus.authenticated);
        },
      ),
    );
  }
}
