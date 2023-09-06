import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../account/provider/get_rated_movies_provider.dart';
import '../../movies/provider/get_movie_details_provider.dart';
import '../../movies/provider/movie_service_provider.dart';
import '../../tv_shows/provider/get_rated_tv_shows_provider.dart';
import '../../tv_shows/provider/get_tv_details_provider.dart';
import '../../tv_shows/provider/tv_show_service_provider.dart';
import '../domain/rate_state.dart';

part 'rate_media_provider.g.dart';

@riverpod
class RateMedia extends _$RateMedia {
  @override
  RateState build() => const RateState.idle();

  Future<void> rateMovie(int movieId, double rating) async {
    state = const RateState.loading();

    state = await ref
        .read(movieServiceProvider)
        .rateMovie(id: movieId, rating: rating)
        .then((_) => const RateState.success())
        .catchError((err) => state = RateState.error(err, err.stackTrace));

    ref.invalidate(getMovieDetailsProvider(movieId));
    ref.invalidate(getRatedMoviesProvider);
  }

  Future<void> rateTVShow(int tvId, double rating) async {
    state = const RateState.loading();

    state = await ref
        .read(tvShowServiceProvider)
        .rateTV(id: tvId, rating: rating)
        .then((_) => const RateState.success())
        .catchError(RateState.error);

    ref.invalidate(getTVDetailsProvider(tvId));
    ref.invalidate(getRatedTVShowsProvider);
  }
}
