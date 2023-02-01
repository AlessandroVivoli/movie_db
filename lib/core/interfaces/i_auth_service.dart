abstract class IAuthService {
  /// Used from logging in to the tmdb account
  ///
  /// Takes in a [username] and [password].
  ///
  /// Returns sessionId if the login
  /// is successful. \
  /// Otherwise throws error.
  ///
  /// The `message` can then be displayed in a snack bar.
  Future<String> login({
    required String username,
    required String password,
  });

  /// Used to logout user from the tmdb account
  Future<void> logout({required String sessionId});
}
