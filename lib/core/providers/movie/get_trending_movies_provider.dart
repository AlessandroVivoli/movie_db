import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../utils/constants.dart';
import '../../models/movie/movie.dart';
import 'movie_service_provider.dart';

typedef GetTrendingMoviesProvider
    = FutureProviderFamily<List<Movie>, TimeWindow>;

final getTrendingMoviesProvider = GetTrendingMoviesProvider(
  name: 'GetTrendingMoviesProvider',
  (ref, timeWindow) {
    return ref
        .watch(movieServiceProvider)
        .getTrendingMovies(timeWindow: timeWindow);
  },
);
