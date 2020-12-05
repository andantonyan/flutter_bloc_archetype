import '../model/model.dart';

abstract class AuthRepository {
  Future<User> login(String username, String password);

  Stream<User> getCurrentUserStream();
}
