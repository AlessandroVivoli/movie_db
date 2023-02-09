import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../auth/provider/auth_provider.dart';
import '../../../movies/provider/get_movie_details_provider.dart';
import '../../domain/account_media_state.dart';
import '../account_service_provider.dart';
import 'get_movie_watchlist_provider.dart';

part 'add_movie_to_watchlist_provider.g.dart';

@riverpod
class MovieWatchlist extends _$MovieWatchlist {
  @override
  AccountMediaState build() => const AccountMediaState.success();

  void addMovieToWatchlist({
    required int movieId,
    required bool watchlist,
  }) async {
    state = const AccountMediaState.loading();

    state = await _addMovieToWatchlist(movieId: movieId, watchlist: watchlist)
        .then((_) => const AccountMediaState.success())
        .catchError(AccountMediaState.error);

    ref.invalidate(getMovieDetailsProvider(movieId));
    ref.invalidate(getMovieWatchlistProvider);
  }

  Future<void> _addMovieToWatchlist({
    required int movieId,
    required bool watchlist,
  }) {
    final user = ref.read(authProvider).whenOrNull(loggedIn: (user) => user)!;

    return ref.read(accountServiceProvider).addToWatchlist(
          accountId: user.accountDetails.id,
          mediaId: movieId,
          mediaType: 'movie',
          watchlist: watchlist,
        );
  }
}
