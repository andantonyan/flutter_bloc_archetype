import 'error_bundle.dart';

class DefaultErrorBundle implements ErrorBundle {
  static final String _defaultErrorMsg = "Unknown error";

  final Exception _exception;

  const DefaultErrorBundle(this._exception);

  @override
  Exception getException() {
    return _exception;
  }

  @override
  String getErrorMessage() {
    return _exception?.toString() ?? _defaultErrorMsg;
  }
}
