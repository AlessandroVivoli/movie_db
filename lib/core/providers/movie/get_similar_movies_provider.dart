import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../models/movie/movie.dart';
import 'movie_service_provider.dart';

typedef GetSimilarMoviesProvider = FutureProviderFamily<List<Movie>, int>;

final getSimilarMoviesProvider = GetSimilarMoviesProvider(
  name: 'GetSimilarMoviesProvider',
  (ref, movieId) {
    return ref.watch(movieServiceProvider).getSimilarMovies(id: movieId);
  },
);
