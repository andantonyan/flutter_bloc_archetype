import '../../model/model.dart';
import '../../repository/repository.dart';
import '../use_case_future.dart';

class Login implements UseCaseFuture<User, Params> {
  final AuthRepository _authRepository;

  const Login(this._authRepository) : assert(_authRepository != null);

  @override
  Future<User> execute(final Params params) {
    assert(params != null);
    return _authRepository.login(params.username, params.password);
  }
}

class Params {
  final String username;
  final String password;

  const Params(this.username, this.password)
      : assert(username != null),
        assert(password != null);
}
