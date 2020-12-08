import 'dart:async';

import '../../model/model.dart';
import '../../repository/repository.dart';
import '../use_case_stream.dart';

class CurrentUserStream implements UseCaseStream<User, void> {
  final AuthRepository _authRepository;

  const CurrentUserStream(this._authRepository) : assert(_authRepository != null);

  @override
  Stream<User> execute(_) {
    return _authRepository.getCurrentUserStream();
  }
}
