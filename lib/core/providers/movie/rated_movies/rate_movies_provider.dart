import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../unions/rate_state.dart';
import '../get_movie_details_provider.dart';
import '../movie_service_provider.dart';
import 'get_rated_movies_provider.dart';

class RateMovieNotifier extends AutoDisposeNotifier<RateState> {
  void rateMovie(int movieId, String sessionId, double rating) {
    state = const RateState.loading();

    ref
        .read(movieServiceProvider)
        .rateMovie(
          id: movieId,
          sessionId: sessionId,
          rating: rating,
        )
        .catchError((err) => state = RateState.error(err, err.stackTrace))
        .then((_) => _refreshRatings(ref, movieId));
  }

  @override
  RateState build() => const RateState.init();

  void _refreshRatings(Ref ref, int movieId) {
    ref.invalidate(getMovieDetailsProvider(movieId));
    ref.invalidate(getRatedMoviesProvider);

    state = const RateState.completed();
  }
}

typedef RateMovieProvider
    = AutoDisposeNotifierProvider<RateMovieNotifier, RateState>;

final rateMovieProvider = RateMovieProvider(
  name: 'RateMoviesProvider',
  () => RateMovieNotifier(),
);
