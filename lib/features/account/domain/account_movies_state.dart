import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_movies_state.freezed.dart';

@freezed
class AccountMoviesState with _$AccountMoviesState {
  const factory AccountMoviesState.success() = AccountMoviesSuccess;
  const factory AccountMoviesState.loading() = AccountMoviesLoading;
  const factory AccountMoviesState.error(
    Object error,
    StackTrace stackTrace,
  ) = AccountMoviesError;
}
