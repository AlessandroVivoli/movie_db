import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../account/provider/get_rated_movies_provider.dart';
import '../../domain/rate_state.dart';
import '../get_movie_details_provider.dart';
import '../movie_service_provider.dart';

part 'rate_movies_provider.g.dart';

@riverpod
class RateMovies extends _$RateMovies {
  @override
  RateState build() => const RateState.idle();

  void rateMovie(int movieId, double rating) async {
    state = const RateState.loading();

    state = await ref
        .read(movieServiceProvider)
        .rateMovie(id: movieId, rating: rating)
        .then((_) => const RateState.success())
        .catchError((err) => state = RateState.error(err, err.stackTrace));

    ref.invalidate(getMovieDetailsProvider(movieId));
    ref.invalidate(getRatedMoviesProvider);
  }
}
