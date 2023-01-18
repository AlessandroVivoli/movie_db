import '../models/movie/details/movie_details.dart';
import '../models/movie/movie.dart';
import '../models/movie/movie_list.dart';
import '../providers/dio_provider.dart';

class MovieService {
  static Future<List<Movie>> getTrendingMovies({
    String timeWindow = 'week',
  }) {
    return DioProvider.dio
        .get('/trending/movie/$timeWindow')
        .then((res) => List<Map<String, Object?>>.from(res.data['results']))
        .then((rawList) => rawList.map(Movie.fromJson))
        .then((movies) => movies.toList());
  }

  static Future<List<Movie>> getTopRatedMovies() {
    return DioProvider.dio
        .get('/movie/top_rated')
        .then((res) => List<Map<String, Object?>>.from(res.data['results']))
        .then((rawList) => rawList.map(Movie.fromJson))
        .then((movies) => movies.toList());
  }

  static Future<List<Movie>> getMovies({
    List<int>? withGenres,
    String? sortBy,
    bool? includeAdult,
  }) {
    return DioProvider.dio
        .get(
          '/discover/movie',
          queryParameters: {
            'sort_by': sortBy,
            'with_genres': withGenres?.join(','),
            'include_adult': includeAdult ?? false,
          },
        )
        .then((res) => List<Map<String, Object?>>.from(res.data['results']))
        .then((rawList) => rawList.map(Movie.fromJson))
        .then((movies) => movies.toList());
  }

  static Future<MovieDetails> getMovieDetails({required int id}) {
    return DioProvider.dio
        .get('/movie/$id')
        .then((res) => Map<String, Object?>.from(res.data))
        .then(MovieDetails.fromJson);
  }

  static Future<List<Movie>> getSimilarMovies({required int id}) {
    return DioProvider.dio
        .get('/movie/$id/similar')
        .then((res) => List<Map<String, Object?>>.from(res.data['results']))
        .then((rawList) => rawList.map(Movie.fromJson))
        .then((movies) => movies.toList());
  }

  static Future<List<Movie>> getPersonCredits({required int personId}) {
    return DioProvider.dio
        .get('/person/$personId/movie_credits')
        .then((res) => List<Map<String, Object?>>.from(res.data['cast']))
        .then((rawList) => rawList.map(Movie.fromJson))
        .then((movies) => movies.toList());
  }

  static Future<MovieListModel> getFavoriteMovies({
    required int accountId,
    required String sessionId,
    int? page,
  }) {
    return DioProvider.dio
        .get(
          '/account/$accountId/favorite/movies',
          queryParameters: {
            'session_id': sessionId,
            'sort_by': 'created_at.desc',
            'page': '$page',
          },
        )
        .then((res) => Map<String, Object>.from(res.data))
        .then(MovieListModel.fromJson);
  }

  static Future<MovieListModel> getRatedMovies({
    required int accountId,
    required String sessionId,
    int? page,
  }) {
    return DioProvider.dio
        .get(
          '/account/$accountId/rated/movies',
          queryParameters: {
            'session_id': sessionId,
            'sort_by': 'created_at.desc',
            'page': '$page',
          },
        )
        .then((res) => Map<String, Object?>.from(res.data))
        .then(MovieListModel.fromJson);
  }
}
