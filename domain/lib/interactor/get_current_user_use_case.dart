part of interactor;

class GetCurrentUserUseCase implements UseCase<User, void> {
  final UserRepository userRepository;

  const GetCurrentUserUseCase(this.userRepository) : assert(userRepository != null);

  @override
  Stream<User> execute(void params) {
    return userRepository.getCurrentUser();
  }
}
