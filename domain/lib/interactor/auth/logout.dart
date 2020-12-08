import '../use_case_future.dart';
import '../../repository/repository.dart';

class Logout implements UseCaseFuture<void, void> {
  final AuthRepository _authRepository;

  const Logout(this._authRepository) : assert(_authRepository != null);

  @override
  Future<void> execute(_) {
    return _authRepository.logout();
  }
}
