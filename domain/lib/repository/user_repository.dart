part of repository;

abstract class UserRepository {
  Stream<User> login(String username, String password);

  Stream<User> getCurrentUser();
}
