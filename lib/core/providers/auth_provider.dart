import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loggy/loggy.dart';

import '../error/invalid_user_error.dart';
import '../interfaces/i_auth_service.dart';
import '../models/user/user.dart';
import '../services/auth_service.dart';
import '../unions/auth_state.dart';
import 'account_service_provider.dart';
import 'dio_provider.dart';
import 'local_storage_provider.dart';

class AuthNotifier extends Notifier<AuthState> {
  Future<void> login(String username, String password) async {
    state = const AuthState.loading();

    await _login(username, password).then(
      (user) {
        state = AuthState.loggedIn(user);
      },
      onError: (e) => _handleLoginError(e),
    );
  }

  Future<void> logout() async {
    state = const AuthState.loading();

    final sessionId = ref.read(localStorageProvider).getSessionId();

    bool success = false;
    if (sessionId != null) {
      success = await ref.read(authServiceProvider).logout(
            sessionId: sessionId,
          );
    }

    if (!success) {
      state = AuthState.error(
        Exception('Could not logout'),
        StackTrace.current,
      );

      return;
    }

    ref.read(localStorageProvider).setSessionId(null);

    state = const AuthState.loggedOut();
  }

  Future<User> _login(String username, String password) async {
    return ref
        .read(authServiceProvider)
        .login(username: username, password: password)
        .then(
      (sessionId) async {
        ref.read(localStorageProvider).setSessionId(sessionId);

        final accountDetails = await ref
            .read(accountServiceProvider)
            .getAccountDetails(sessionId: sessionId);

        return User(accountDetails: accountDetails, sessionId: sessionId);
      },
    );
  }

  User? _handleLoginError(DioError err) {
    var message = 'Could not login.';

    if (err.response?.data['status_code'] == 30) {
      message = 'Invalid username and/or password';

      final invalidUserError = InvalidUserError(
        error: err,
        stackTrace: err.stackTrace!,
      );

      state = AuthState.error(
        invalidUserError,
        invalidUserError.stackTrace,
      );
    } else {
      state = AuthState.error(err, err.stackTrace!);
    }

    logError(message, err, err.stackTrace);

    return null;
  }

  @override
  AuthState build() {
    return const AuthState.loggedOut();
  }
}

final authServiceProvider = Provider<IAuthService>(
  (ref) => AuthService(ref.watch(dioProvider)),
);

final authProvider = NotifierProvider<AuthNotifier, AuthState>(() {
  return AuthNotifier();
});
