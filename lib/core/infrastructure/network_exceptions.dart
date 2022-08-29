class RestApiException implements Exception {
  final int? errorCode;

  RestApiException(this.errorCode);
}
