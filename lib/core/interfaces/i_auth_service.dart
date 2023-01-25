import '../models/auth/login_response.dart';
import '../models/auth/request_token.dart';
import '../models/auth/session_id.dart';

abstract class IAuthService {
  /// Creates a temporary [RequestToken] that can then be validated \
  /// using the [validateTokenWithLogin] method.
  Future<RequestToken> createRequestToken();

  /// Validates the [requestToken] and returns a new [RequestToken] \
  /// containing the validated tmdb request token.
  ///
  /// The method takes in [username] and [password] of the user.
  ///
  /// The validated token can then be used to create a user session \
  /// using the [createSessionId] method.
  Future<RequestToken> validateTokenWithLogin({
    required String requestToken,
    required String username,
    required String password,
  });

  /// Creates a tmdb session id.
  ///
  /// The [requestToken] must be a validated tmdb request token.
  Future<SessionId> createSessionId({required String requestToken});

  /// Used from logging in to the tmdb account
  ///
  /// Takes in a [username] and [password].
  ///
  /// Returns [LoginResponse] with `success = true` and `sessionId` if the login
  /// is successful. \
  /// Otherwise returns [LoginResponse] with `success = false` along with\
  /// a `statusCode` and an error `message`.
  ///
  /// The `message` can then be displayed in a snack bar.
  Future<LoginResponse> login({
    required String username,
    required String password,
  });

  /// Used to logout user from the tmdb account
  ///
  /// Returns `true` if logout was successful. \
  /// Otherwise returns `false`.
  Future<bool> logout({required String sessionId});
}
