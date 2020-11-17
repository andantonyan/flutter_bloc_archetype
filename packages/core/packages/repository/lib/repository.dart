library repository;
import 'package:model/model.dart';

abstract class UserRepository {
  Stream<User> login();
}
