import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../auth/provider/auth_provider.dart';
import '../../../movies/provider/get_movie_details_provider.dart';
import '../../../tv_shows/provider/get_tv_details_provider.dart';
import '../../domain/account_media_state.dart';
import '../account_service_provider.dart';
import 'get_movie_watchlist_provider.dart';
import 'get_tv_watchlist_provider.dart';

part 'add_to_watchlist_provider.g.dart';

@riverpod
class Watchlist extends _$Watchlist {
  @override
  AccountMediaState build() => const AccountMediaState.success();

  void addMovieToWatchlist({
    required int movieId,
    required bool watchlist,
  }) async {
    state = const AccountMediaState.loading();

    state = await _addMediaToWatchlist(
      mediaId: movieId,
      watchlist: watchlist,
      mediaType: 'movie',
    )
        .then((_) => const AccountMediaState.success())
        .catchError(AccountMediaState.error);

    ref.invalidate(getMovieDetailsProvider(movieId));
    ref.invalidate(getMovieWatchlistProvider);
  }

  void addTVShowToWatchlist({
    required int tvId,
    required bool watchlist,
  }) async {
    state = const AccountMediaState.loading();

    state = await _addMediaToWatchlist(
      mediaId: tvId,
      watchlist: watchlist,
      mediaType: 'tv',
    )
        .then((_) => const AccountMediaState.success())
        .catchError(AccountMediaState.error);

    ref.invalidate(getTVDetailsProvider(tvId));
    ref.invalidate(getTVWatchlistProvider);
  }

  Future<void> _addMediaToWatchlist({
    required int mediaId,
    required bool watchlist,
    required String mediaType,
  }) {
    final user = ref.read(authProvider).whenOrNull(loggedIn: (user) => user)!;

    return ref.read(accountServiceProvider).addToWatchlist(
          accountId: user.accountDetails.id,
          mediaId: mediaId,
          mediaType: mediaType,
          watchlist: watchlist,
        );
  }
}
