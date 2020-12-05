import '../../model/model.dart';
import '../../repository/repository.dart';
import '../use_case_future.dart';

class Login implements UseCaseFuture<User, Params> {
  final AuthRepository _userRepository;

  const Login(this._userRepository) : assert(_userRepository != null);

  @override
  Future<User> execute(final Params params) {
    assert(params != null);
    return _userRepository.login(params.username, params.password);
  }
}

class Params {
  final String username;
  final String password;

  const Params(this.username, this.password)
      : assert(username != null),
        assert(password != null);
}
