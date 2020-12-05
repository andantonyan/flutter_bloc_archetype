import 'dart:async';

import '../../model/model.dart';
import '../../repository/repository.dart';
import '../use_case_stream.dart';

class CurrentUserStream implements UseCaseStream<User, int> {
  final AuthRepository _userRepository;

  const CurrentUserStream(this._userRepository) : assert(_userRepository != null);

  @override
  Stream<User> execute(_) {
    return _userRepository.getCurrentUserStream();
  }
}
