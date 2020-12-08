import '../model/model.dart';

abstract class AuthRepository {
  Future<User> login(String username, String password);

  Future<void> logout();

  Stream<User> getCurrentUserStream();
}
