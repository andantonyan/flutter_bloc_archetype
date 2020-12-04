part of interactor;

class GetCurrentUserUseCase implements UseCase<User, NoParams> {
  final UserRepository userRepository;

  const GetCurrentUserUseCase(this.userRepository) : assert(userRepository != null);

  @override
  Stream<User> execute(_) {
    return userRepository.getCurrentUser();
  }
}
