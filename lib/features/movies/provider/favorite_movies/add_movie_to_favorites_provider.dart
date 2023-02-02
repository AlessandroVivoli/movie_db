import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../account/provider/account_service_provider.dart';
import '../../../auth/domain/user.dart';
import '../get_movie_details_provider.dart';
import 'get_favorite_movies_provider.dart';

part 'add_movie_to_favorites_provider.g.dart';

@riverpod
Future<void> addMovieToFavorites(
  AddMovieToFavoritesRef ref, {
  required User user,
  required int movieId,
  required bool favorite,
}) {
  return ref
      .watch(accountServiceProvider)
      .markMovieAsFavorite(
        user: user,
        movieId: movieId,
        favorite: favorite,
      )
      .then((_) => _refreshFavorites(ref, movieId));
}

_refreshFavorites(Ref ref, int movieId) {
  ref.invalidate(addMovieToFavoritesProvider);
  ref.invalidate(getMovieDetailsProvider(movieId));
  ref.invalidate(getFavoriteMoviesProvider);
}
