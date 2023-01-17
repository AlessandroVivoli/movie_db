import '../models/auth/request_token.dart';
import '../models/auth/session_id.dart';
import '../providers/dio_provider.dart';

class AuthService {
  static Future<RequestToken> createRequestToken() {
    return DioProvider.dio
        .get('/authentication/token/new')
        .then((res) => Map<String, Object?>.from(res.data))
        .then(RequestToken.fromJson);
  }

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

  static Future<bool> logout({required String sessionId}) {
    return DioProvider.dio.delete(
      '/authentication/session',
      data: {
        'session_id': sessionId,
      },
    ).then((res) => res.data['success']);
  }
}
