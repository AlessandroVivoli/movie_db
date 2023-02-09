import '../../time_window/domain/time_window.dart';
import 'movie.dart';
import 'movie_details.dart';
import 'movie_list.dart';
import 'sort_by.dart';

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
    SortBy sortBy = SortBy.popularityDesc,
    bool includeAdult = false,
  });

  /// Returns [MovieDetails] future using the provided movie [id]
  Future<MovieDetails> getMovieDetails({required int id});

  /// Returns similar [List] of [Movie] using the provided movie [id]
  Future<List<Movie>> getSimilarMovies({required int id});

  /// Sets the movie [rating] using the movie [id]
  Future<void> rateMovie({required int id, required double rating});

  /// Deletes the movie rating set by user
  ///
  /// [id] is the movie id
  Future<void> deleteRating({required int id});

  Future<MovieListModel> searchMovies({
    required String query,
    bool includeAdult = false,
    int page = 1,
  });
}
