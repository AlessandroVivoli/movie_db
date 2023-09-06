import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_media_state.freezed.dart';

@freezed
class AccountMediaState with _$AccountMediaState {
  const factory AccountMediaState.success() = AccountMoviesSuccess;
  const factory AccountMediaState.loading() = AccountMoviesLoading;
  const factory AccountMediaState.error(
    Object error,
    StackTrace stackTrace,
  ) = AccountMoviesError;
}
