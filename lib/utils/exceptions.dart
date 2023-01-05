class DioProviderException implements Exception {
  DioProviderException([this.message]);

  final String? message;

  @override
  String toString() {
    const String result = 'DioProviderException';

    if (message is String) return '$result: $message';

    return result;
  }
}
