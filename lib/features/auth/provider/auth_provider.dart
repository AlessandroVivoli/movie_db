import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/errors/invalid_user_error.dart';
import '../../account/provider/account_service_provider.dart';
import '../../local_storage/provider/local_storage_provider.dart';
import '../domain/auth_state.dart';
import '../domain/user.dart';
import 'auth_service_provider.dart';

part 'auth_provider.g.dart';

@Riverpod(keepAlive: true)
class Auth extends _$Auth {
  @override
  AuthState build() => const AuthState.loggedOut();

  Future<void> init() async {
    final sessionId = ref.read(localStorageProvider).getSessionId();

    if (sessionId == null) {
      state = const AuthState.loggedOut();
      return;
    }

    state = const AuthState.loading();

    state = await ref
        .read(accountServiceProvider)
        .getAccountDetails(sessionId: sessionId)
        .then(
          (details) => AuthState.loggedIn(
            User(
              accountDetails: details,
              sessionId: sessionId,
            ),
          ),
        )
        .catchError(AuthState.error);
  }

  Future<void> login(String username, String password) async {
    state = const AuthState.loading();

    state = await _login(username, password)
        .then(AuthState.loggedIn)
        .catchError(_handleLoginError);
  }

  Future<void> logout() async {
    state = const AuthState.loading();

    state = await _logout()
        .then((_) => const AuthState.loggedOut())
        .catchError(AuthState.error);
  }

  AuthState _handleLoginError(Object error, StackTrace stackTrace) {
    if (error is DioError && error.response?.data['status_code'] == 30) {
      final invalidUserError = InvalidUserError(
        error: error,
        stackTrace: error.stackTrace!,
      );

      return AuthState.error(
        invalidUserError,
        invalidUserError.stackTrace,
      );
    }

    return AuthState.error(error, stackTrace);
  }

  Future<User> _login(String username, String password) async {
    return ref
        .read(authServiceProvider)
        .login(username: username, password: password)
        .then(_getUser);
  }

  Future<User> _getUser(String sessionId) {
    ref.read(localStorageProvider).setSessionId(sessionId);

    return ref
        .read(accountServiceProvider)
        .getAccountDetails(sessionId: sessionId)
        .then(
          (accountDetails) => User(
            accountDetails: accountDetails,
            sessionId: sessionId,
          ),
        );
  }

  Future<void> _logout() {
    final sessionId = ref.read(localStorageProvider).getSessionId();

    if (sessionId == null) {
      return Future.error(Exception('Not logged in.'));
    }

    ref.read(localStorageProvider).setSessionId(null);

    return ref.read(authServiceProvider).logout(sessionId: sessionId);
  }
}
