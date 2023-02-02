import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../features/account/provider/account_service_provider.dart';
import '../../domain/movie_user_action_arguments.dart';
import '../get_movie_details_provider.dart';
import 'get_favorite_movies_provider.dart';

typedef AddMovieToFavoritesProvider
    = FutureProviderFamily<void, MovieUserActionArguments>;

final addMovieToFavoritesProvider = AddMovieToFavoritesProvider(
  name: 'AddMovieToFavoritesProvider',
  (ref, args) => ref
      .watch(accountServiceProvider)
      .markMovieAsFavorite(
        user: args.user,
        movieId: args.movieId,
        favorite: args.action,
      )
      .then(
        (_) => _refreshFavorites(ref, args.movieId),
      ),
);

_refreshFavorites(FutureProviderRef<void> ref, int movieId) {
  ref.invalidate(addMovieToFavoritesProvider);
  ref.invalidate(getMovieDetailsProvider(movieId));
  ref.invalidate(getFavoriteMoviesProvider);
}
