import 'package:freezed_annotation/freezed_annotation.dart';

import 'user.dart';

part 'auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.loggedIn(User user) = LoggedIn;
  const factory AuthState.loggedOut() = LoggedOut;
  const factory AuthState.loading() = AuthLoading;
  const factory AuthState.error(Object? error, StackTrace stack) = AuthError;
}
