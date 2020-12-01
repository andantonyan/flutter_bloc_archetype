import 'package:domain/domain.dart';

class RepositoryErrorBundle implements ErrorBundle {
  final Exception _exception;

  const RepositoryErrorBundle(this._exception);

  @override
  Exception getException() {
    return _exception;
  }

  @override
  String getErrorMessage() {
    return _exception?.toString();
  }
}
