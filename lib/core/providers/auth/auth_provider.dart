import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loggy/loggy.dart';

import '../../error/invalid_user_error.dart';
import '../../models/user/user.dart';
import '../../unions/auth_state.dart';
import '../account/account_service_provider.dart';
import '../local_storage/local_storage_provider.dart';
import 'auth_service_provider.dart';

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

    await _logout().then((success) {
      if (success) {
        state = const AuthState.loggedOut();
      }
    });
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

  Future<bool> _logout() async {
    final sessionId = ref.read(localStorageProvider).getSessionId();

    bool success = false;

    if (sessionId != null) {
      success = await ref
          .read(authServiceProvider)
          .logout(sessionId: sessionId)
          .catchError(
        (e) {
          state = AuthState.error(e, e.stackTrace);
          return false;
        },
      );
    }

    if (success) {
      ref.read(localStorageProvider).setSessionId(null);
    }

    return success;
  }

  @override
  AuthState build() {
    return const AuthState.loggedOut();
  }
}

final authProvider = NotifierProvider<AuthNotifier, AuthState>(() {
  return AuthNotifier();
});
