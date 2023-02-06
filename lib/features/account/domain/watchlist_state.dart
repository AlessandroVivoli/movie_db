import 'package:freezed_annotation/freezed_annotation.dart';

part 'watchlist_state.freezed.dart';

@freezed
class WatchlistState with _$WatchlistState {
  const factory WatchlistState.success(bool watchlist) = WatchlistSuccess;
  const factory WatchlistState.loading() = WatchlistLoading;
  const factory WatchlistState.error(
    Object error,
    StackTrace stackTrace,
  ) = WatchlistError;
}
