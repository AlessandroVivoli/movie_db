import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../models/movie/movie_user_action_arguments.dart';
import '../../account/account_service_provider.dart';
import '../get_movie_details_provider.dart';
import 'get_movie_watchlist_provider.dart';

typedef AddMovieToWatchlistProvider
    = FutureProviderFamily<void, MovieUserActionArguments>;

final addMovieToWatchlistProvider = AddMovieToWatchlistProvider(
  name: 'AddMovieToWatchlistProvider',
  (ref, args) => ref
      .watch(accountServiceProvider)
      .addMovieToWatchList(
        user: args.user,
        movieId: args.movieId,
        watchlist: args.action,
      )
      .then((_) => _refreshWatchlist(ref, args.movieId)),
);

_refreshWatchlist(FutureProviderRef<void> ref, int movieId) {
  ref.invalidate(addMovieToWatchlistProvider);
  ref.invalidate(getMovieDetailsProvider(movieId));
  ref.invalidate(getMovieWatchlistProvider);
}
