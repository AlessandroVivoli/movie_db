
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../auth/provider/auth_provider.dart';
import '../../../movies/provider/get_movie_details_provider.dart';
import '../../domain/account_movies_state.dart';
import '../account_service_provider.dart';
import 'get_favorite_movies_provider.dart';

part 'add_movie_to_favorites_provider.g.dart';

@riverpod
class Favorites extends _$Favorites {
  @override
  AccountMoviesState build() => const AccountMoviesState.success();

  void addMovieToFavorites({
    required int movieId,
    required bool favorite,
  }) async {
    state = const AccountMoviesState.loading();

    state = await _addMovieToFavorites(movieId: movieId, favorite: favorite)
        .then((_) => _onSuccess(movieId, favorite))
        .catchError(AccountMoviesState.error);
  }

  void _refreshFavorites(Ref ref, int movieId) {
    ref.invalidate(getMovieDetailsProvider(movieId));
    ref.invalidate(getFavoriteMoviesProvider);
  }

  AccountMoviesState _onSuccess(int movieId, bool favorite) {
    _refreshFavorites(ref, movieId);
    return const AccountMoviesState.success();
  }

  Future<void> _addMovieToFavorites({
    required int movieId,
    required bool favorite,
  }) {
    final user = ref.read(authProvider).whenOrNull(loggedIn: (user) => user)!;

    return ref.watch(accountServiceProvider).markMovieAsFavorite(
          user: user,
          movieId: movieId,
          favorite: favorite,
        );
  }
}
