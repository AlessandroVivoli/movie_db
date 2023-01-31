import '../../utils/constants.dart';
import '../models/movie/account_state/movie_account_state.dart';
import '../models/movie/details/movie_details.dart';
import '../models/movie/movie.dart';
import '../models/movie/movie_list.dart';
import '../models/sort_by/sort_by.dart';

abstract class IMovieService {
  /// Returns trending [List] of [Movie] future.
  ///
  /// [timeWindow] can only be `week` or `day`.\
  /// Defaults to `week`.
  Future<List<Movie>> getTrendingMovies({
    TimeWindow timeWindow = TimeWindow.week,
  });

  /// Returns top rated [List] of [Movie] future.
  Future<List<Movie>> getTopRatedMovies();

  /// Returns [List] of [Movie] future.
  ///
  /// If provided [withGenres], the api will return the movies\
  /// that fit the genre criteria.
  ///
  /// If provided [sortBy], the api will return the sorted movies.\
  /// [sortBy] can be any of `SortBy` constants.\
  /// Defaults to `SortBy.popularityDescending`
  ///
  /// If provided [includeAdult], the api will return movies that are adult if\
  /// it is `true`. Defaults to `false`.
  Future<List<Movie>> getMovies({
    List<int>? withGenres,
    SortBy sortBy = Sorts.popularityDesc,
    bool? includeAdult,
  });

  /// Returns [MovieDetails] future using the provided movie [id]
  Future<MovieDetails> getMovieDetails({required int id});

  /// Returns similar [List] of [Movie] using the provided movie [id]
  Future<List<Movie>> getSimilarMovies({required int id});

  /// Returns the [List] of [Movie] credits using the provided [personId]
  Future<List<Movie>> getPersonCredits({required int personId});

  /// Returns the [MovieAccountState] of movie using the movie [id] and [sessionId]
  Future<MovieAccountState> getAccountMovieState({
    required int id,
    required String sessionId,
  });

  /// Returns the user favorite movie list.
  Future<MovieListModel> getFavoriteMovies({
    required int accountId,
    required String sessionId,
    int page = 1,
  });

  /// Returns the user movie watchlist.
  Future<MovieListModel> getMovieWatchlist({
    required int accountId,
    required String sessionId,
    int page = 1,
  });

  /// Returns the user rated movie list.
  Future<MovieListModel> getRatedMovies({
    required int accountId,
    required String sessionId,
    int page = 1,
  });

  /// Sets the movie [rating] using the movie [id] and [sessionId]
  Future<void> rateMovie({
    required int id,
    required String sessionId,
    required double rating,
  });

  /// Deletes the movie rating set by user
  ///
  /// [id] is the movie id\
  /// [sessionId] is the user session id
  Future<void> deleteRating({
    required int id,
    required String sessionId,
  });
}
