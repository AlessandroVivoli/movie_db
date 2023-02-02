import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/rate_state.dart';
import '../get_movie_details_provider.dart';
import '../movie_service_provider.dart';
import 'get_rated_movies_provider.dart';

part 'rate_movies_provider.g.dart';

@riverpod
class RateMovies extends _$RateMovies {
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