class InvalidUserError implements Exception {
  final Object error;
  final StackTrace stackTrace;

  const InvalidUserError({
    required this.error,
    required this.stackTrace,
  });

  @override
  String toString() {
    return 'Invalid username and/or password';
  }
}
