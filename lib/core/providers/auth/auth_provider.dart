import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../error/invalid_user_error.dart';
import '../../models/user/user.dart';
import '../../unions/auth_state.dart';
import '../account/account_service_provider.dart';
import '../local_storage/local_storage_provider.dart';
import 'auth_service_provider.dart';

class AuthNotifier extends Notifier<AuthState> {
  Future<void> login(String username, String password) async {
    state = const AuthState.loading();

    state = await _login(username, password)
        .then(AuthState.loggedIn)
        .catchError(_handleLoginError);
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

  Future<void> logout() async {
    state = const AuthState.loading();

    state = await _logout()
        .then((_) => const AuthState.loggedOut())
        .catchError(AuthState.error);
  }

  Future<void> _logout() {
    final sessionId = ref.read(localStorageProvider).getSessionId();

    if (sessionId == null) {
      return Future.error('Not logged in.');
    }

    return ref.read(authServiceProvider).logout(sessionId: sessionId);
  }

  Future<void> init() async {
    final sessionId = ref.read(localStorageProvider).getSessionId();

    state = AuthState.error('Something went wrong', StackTrace.current);

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

  @override
  AuthState build() {
    return const AuthState.loggedOut();
  }
}

final authProvider = NotifierProvider<AuthNotifier, AuthState>(() {
  return AuthNotifier();
});
