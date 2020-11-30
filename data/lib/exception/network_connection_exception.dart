class NetworkConnectionException implements Exception {
  final String cause;

  const NetworkConnectionException(this.cause);
}
