import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../auth/provider/auth_provider.dart';
import '../../../movies/provider/get_movie_details_provider.dart';
import '../../../tv_shows/provider/get_tv_details_provider.dart';
import '../../domain/account_media_state.dart';
import '../account_service_provider.dart';
import 'get_favorite_movies_provider.dart';
import 'get_favorite_tv_shows_provider.dart';

part 'add_to_favorites_provider.g.dart';

@riverpod
class Favorites extends _$Favorites {
  @override
  AccountMediaState build() => const AccountMediaState.success();

  void addMovieToFavorites({
    required int movieId,
    required bool favorite,
  }) async {
    state = const AccountMediaState.loading();

    state = await _addMediaToFavorites(
      mediaId: movieId,
      favorite: favorite,
      mediaType: 'movie',
    )
        .then((_) => const AccountMediaState.success())
        .catchError(AccountMediaState.error);

    ref.invalidate(getMovieDetailsProvider(movieId));
    ref.invalidate(getFavoriteMoviesProvider);
  }

  void addTVShowToFavorites({
    required int tvId,
    required bool favorite,
  }) async {
    state = const AccountMediaState.loading();

    state = await _addMediaToFavorites(
      mediaId: tvId,
      favorite: favorite,
      mediaType: 'tv',
    )
        .then((_) => const AccountMediaState.success())
        .catchError(AccountMediaState.error);

    ref.invalidate(getTVDetailsProvider(tvId));
    ref.invalidate(getFavoriteTVShowsProvider);
  }

  Future<void> _addMediaToFavorites({
    required int mediaId,
    required bool favorite,
    required String mediaType,
  }) {
    final user = ref.read(authProvider).whenOrNull(loggedIn: (user) => user)!;

    return ref.watch(accountServiceProvider).markAsFavorite(
          accountId: user.accountDetails.id,
          mediaId: mediaId,
          favorite: favorite,
          mediaType: mediaType,
        );
  }
}
