import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_account_state.freezed.dart';
part 'movie_account_state.g.dart';

@freezed
class MovieAccountState with _$MovieAccountState {
  const factory MovieAccountState({
    required int id,
    required bool favorite,
    required dynamic rated,
    required bool watchlist,
  }) = _MovieAccountState;

  factory MovieAccountState.fromJson(Map<String, Object?> json) =>
      _$MovieAccountStateFromJson(json);
}
