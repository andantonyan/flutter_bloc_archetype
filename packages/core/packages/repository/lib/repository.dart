library repository;
import 'package:model/model.dart';

abstract class UserRepository {
  Future<User> login();
}
