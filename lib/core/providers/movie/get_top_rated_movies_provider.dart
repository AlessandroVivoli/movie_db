import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'movie_service_provider.dart';

final getTopRatedMoviesProvider = FutureProvider(
  (ref) => ref.watch(movieServiceProvider).getTopRatedMovies(),
);
