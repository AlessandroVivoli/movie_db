import '../models/movie/details/movie_details.dart';
import '../models/movie/movie.dart';
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
  }) {
    return DioProvider.dio
        .get(
          '/discover/movie',
          queryParameters: {
            'sort_by': sortBy,
            'with_genres': withGenres?.join(','),
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
}
