import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../models/movie/movie.dart';
import '../../models/movie/movie_arguments.dart';
import 'movie_service_provider.dart';

typedef GetMoviesProvider = FutureProviderFamily<List<Movie>, MovieArguments>;

final getMoviesProvider = GetMoviesProvider(
  name: 'GetMoviesProvider',
  (ref, arguments) => ref.watch(movieServiceProvider).getMovies(
        withGenres: arguments.withGenres,
        sortBy: arguments.sortBy,
        includeAdult: arguments.includeAdult,
      ),
);