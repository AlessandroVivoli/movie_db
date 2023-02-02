import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../features/account/provider/account_service_provider.dart';
import '../../../auth/domain/user.dart';
import '../get_movie_details_provider.dart';
import 'get_movie_watchlist_provider.dart';

part 'add_movie_to_watchlist_provider.g.dart';

@riverpod
Future<void> addMovieToWatchlist(
  AddMovieToWatchlistRef ref, {
  required User user,
  required int movieId,
  required bool watchlist,
}) {
  return ref
      .watch(accountServiceProvider)
      .addMovieToWatchList(
        user: user,
        movieId: movieId,
        watchlist: watchlist,
      )
      .then((_) => _refreshWatchlist(ref, movieId));
}

_refreshWatchlist(FutureProviderRef<void> ref, int movieId) {
  ref.invalidate(addMovieToWatchlistProvider);
  ref.invalidate(getMovieDetailsProvider(movieId));
  ref.invalidate(getMovieWatchlistProvider);
}
