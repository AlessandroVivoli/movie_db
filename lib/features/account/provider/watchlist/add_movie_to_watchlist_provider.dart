import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../auth/provider/auth_provider.dart';
import '../../../movies/provider/get_movie_details_provider.dart';
import '../../domain/account_movies_state.dart';
import '../account_service_provider.dart';
import 'get_movie_watchlist_provider.dart';

part 'add_movie_to_watchlist_provider.g.dart';

@riverpod
class Watchlist extends _$Watchlist {
  @override
  AccountMoviesState build() => const AccountMoviesState.success();

  void addMovieToWatchlist({
    required int movieId,
    required bool watchlist,
  }) async {
    state = const AccountMoviesState.loading();

    state = await _addMovieToWatchlist(movieId: movieId, watchlist: watchlist)
        .then((_) => _onSuccess(movieId, watchlist))
        .catchError(AccountMoviesState.error);
  }

  void _refreshWatchlist(Ref ref, int movieId) {
    ref.invalidate(getMovieDetailsProvider(movieId));
    ref.invalidate(getMovieWatchlistProvider);
  }

  AccountMoviesState _onSuccess(int movieId, bool watchlist) {
    _refreshWatchlist(ref, movieId);
    return const AccountMoviesState.success();
  }

  Future<void> _addMovieToWatchlist({
    required int movieId,
    required bool watchlist,
  }) {
    final user = ref.read(authProvider).whenOrNull(loggedIn: (user) => user)!;

    return ref.read(accountServiceProvider).addMovieToWatchList(
          user: user,
          movieId: movieId,
          watchlist: watchlist,
        );
  }
}
