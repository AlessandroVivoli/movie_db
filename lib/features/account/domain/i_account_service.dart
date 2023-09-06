import '../../movies/domain/movie_list.dart';
import '../../tv_shows/domain/tv_list_model.dart';

abstract class IAccountService {
  /// Marks the movie favorite if the [favorite] is true.
  ///
  /// Returns the status code of the api response.
  Future<int> markAsFavorite({
    required int accountId,
    required int mediaId,
    required bool favorite,
    required String mediaType,
  });

  /// Adds movie to the watchlist if the [watchlist] is true.
  ///
  /// Returns the status code of the api response.
  Future<void> addToWatchlist({
    required int accountId,
    required int mediaId,
    required String mediaType,
    required bool watchlist,
  });

  /// Returns the user favorite tv show list.
  Future<TVListModel> getFavoriteTVShows({
    required int accountId,
    int page = 1,
  });

  /// Returns the user favorite movie list.
  Future<MovieListModel> getFavoriteMovies({
    required int accountId,
    int page = 1,
  });

  /// Returns the user movie watchlist.
  Future<MovieListModel> getMovieWatchlist({
    required int accountId,
    int page = 1,
  });

  /// Returns the user rated movie list.
  Future<MovieListModel> getRatedMovies({
    required int accountId,
    int page = 1,
  });

  Future<TVListModel> getRatedTVShows({
    required int accountId,
    int page = 1,
  });

  Future<TVListModel> getTVWatchlist({required int accountId, int page = 1});
}
