part of interactor;

class LoginUserCase implements UseCase<User, Params> {
  final UserRepository userRepository;

  const LoginUserCase(this.userRepository) : assert(userRepository != null);

  @override
  Stream<User> execute(final Params params) {
    assert(params != null);
    return userRepository.login(params.username, params.password);
  }
}

class Params {
  final String username;
  final String password;

  const Params(this.username, this.password)
      : assert(username != null),
        assert(password != null);
}
