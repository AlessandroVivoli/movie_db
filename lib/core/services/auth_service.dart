import 'package:dio/dio.dart';

import '../models/auth/login_response.dart';
import '../models/auth/request_token.dart';
import '../models/auth/session_id.dart';
import '../providers/dio_provider.dart';

class AuthService {
  /// Creates a temporary [RequestToken] that can then be validated \
  /// using the [validateTokenWithLogin] method.
  static Future<RequestToken> createRequestToken() {
    return DioProvider.dio
        .get('/authentication/token/new')
        .then((res) => Map<String, Object?>.from(res.data))
        .then(RequestToken.fromJson);
  }

  /// Validates the [requestToken] and returns a new [RequestToken] \
  /// containing the validated tmdb request token.
  ///
  /// The method takes in [username] and [password] of the user.
  ///
  /// The validated token can then be used to create a user session \
  /// using the [createSessionId] method.
  static Future<RequestToken> validateTokenWithLogin({
    required String requestToken,
    required String username,
    required String password,
  }) {
    return DioProvider.dio
        .post(
          '/authentication/token/validate_with_login',
          data: {
            'username': username,
            'password': password,
            'request_token': requestToken,
          },
        )
        .then((res) => Map<String, Object?>.from(res.data))
        .then(RequestToken.fromJson);
  }

  /// Creates a tmdb session id.
  ///
  /// The [requestToken] must be a validated tmdb request token.
  static Future<SessionId> createSessionId({
    required String requestToken,
  }) {
    return DioProvider.dio
        .post(
          '/authentication/session/new',
          data: {
            'request_token': requestToken,
          },
        )
        .then((res) => Map<String, Object?>.from(res.data))
        .then(SessionId.fromJson);
  }

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
  static Future<LoginResponse> login({
    required String username,
    required String password,
  }) async {
    bool success = true;
    int statusCode = 0;
    String message = '';
    String? sessionId;

    final token = await createRequestToken().catchError((_) {
      message = 'Could not get request token.';

      return const RequestToken(
        success: false,
        expiresAt: '',
        requestToken: '',
      );
    });

    if (token.success) {
      final validatedToken = await validateTokenWithLogin(
        requestToken: token.requestToken,
        username: username,
        password: password,
      ).catchError((error) {
        success = false;
        statusCode = 2;
        message = 'Could not get session id';

        if (error is DioError && error.response?.statusCode == 401) {
          message = 'Wrong username and/or password';
        }

        return const RequestToken(
          success: false,
          expiresAt: '',
          requestToken: '',
        );
      });

      if (validatedToken.success) {
        final session = await createSessionId(
          requestToken: validatedToken.requestToken,
        ).catchError((_) {
          return const SessionId(success: false, sessionId: '');
        });

        if (session.success) {
          sessionId = session.sessionId;
        }
      }
    }

    return LoginResponse(
      success: success,
      statusCode: statusCode,
      message: message,
      sessionId: sessionId,
    );
  }

  /// Used to logout user from the tmdb account
  ///
  /// Returns `true` if logout was successful. \
  /// Otherwise returns `false`.
  static Future<bool> logout({required String sessionId}) {
    return DioProvider.dio.delete(
      '/authentication/session',
      data: {
        'session_id': sessionId,
      },
    ).then((res) => res.data['success']);
  }
}
