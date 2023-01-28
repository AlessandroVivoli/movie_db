import 'dart:async';

import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loggy/loggy.dart';

import '../error/invalid_user_error.dart';
import '../models/user/user.dart';
import '../providers/account_service_provider.dart';
import '../providers/auth_provider.dart';
import '../providers/local_storage_provider.dart';
import '../providers/user_provider.dart';
import '../unions/auth_state.dart';

class AuthNotifier extends Notifier<AuthState> {
  Future<void> login(String username, String password) async {
    state = const AuthState.loading();

    final sessionId = await ref
        .read(authServiceProvider)
        .login(
          username: username,
          password: password,
        )
        .catchError((e) => _handleLoginError(e));

    if (sessionId != null) {
      ref.read(localStorageProvider)?.setSessionId(sessionId);

      final accountDetails = await ref
          .read(accountServiceProvider)
          .getAccountDetails(sessionId: sessionId);

      state = AuthState.loggedIn(User(
        accountDetails: accountDetails,
        sessionId: sessionId,
      ));
    }
  }

  Future<void> logout() async {
    state = const AuthState.loading();

    final sessionId = ref.read(localStorageProvider)?.getSessionId();

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

    ref.read(localStorageProvider)?.setSessionId(null);
    ref.read(userProvider.notifier).state = null;

    state = const AuthState.loggedOut();
  }

  String? _handleLoginError(Object e) {
    final err = e as DioError;

    var message = 'Could not login.';

    if (err.response!.data['status_code'] == 30) {
      message = 'Wrong username and/or password';

      final invalidUserError = InvalidUserError(
        error: err.error,
        stackTrace: err.stackTrace!,
      );

      state = AuthState.error(
        invalidUserError.error,
        invalidUserError.stackTrace,
      );
    } else {
      state = AuthState.error(err.error, err.stackTrace!);
    }

    logError(message, e.error, e.stackTrace);

    return null;
  }

  @override
  AuthState build() {
    return const AuthState.loggedOut();
  }
}
