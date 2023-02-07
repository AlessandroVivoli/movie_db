import '../../auth/domain/user.dart';
import '../../movies/domain/movie_list.dart';
import 'account_details.dart';

abstract class IAccountService {
  /// Returns [AccountDetails] future using the valid session id.
  Future<AccountDetails> getAccountDetails({required String sessionId});

  /// Marks the movie favorite if the [favorite] is true.
  ///
  /// Returns the status code of the api response.
  Future<int> markMovieAsFavorite({
    required User user,
    required int movieId,
    required bool favorite,
  });

  /// Adds movie to the watchlist if the [watchlist] is true.
  ///
  /// Returns the status code of the api response.
  Future<void> addMovieToWatchList({
    required User user,
    required int movieId,
    required bool watchlist,
  });

  /// Returns the user favorite movie list.
  Future<MovieListModel> getFavoriteMovies({
    required User user,
    int page = 1,
  });

  /// Returns the user movie watchlist.
  Future<MovieListModel> getMovieWatchlist({
    required User user,
    int page = 1,
  });

  /// Returns the user rated movie list.
  Future<MovieListModel> getRatedMovies({
    required User user,
    int page = 1,
  });
}
