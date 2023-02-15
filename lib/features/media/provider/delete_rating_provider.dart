import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../account/provider/get_rated_movies_provider.dart';
import '../../movies/provider/get_movie_details_provider.dart';
import '../../movies/provider/movie_service_provider.dart';
import '../../tv_shows/provider/get_rated_tv_shows_provider.dart';
import '../../tv_shows/provider/get_tv_details_provider.dart';
import '../../tv_shows/provider/tv_show_service_provider.dart';
import '../domain/rate_state.dart';

part 'delete_rating_provider.g.dart';

@riverpod
class DeleteRating extends _$DeleteRating {
  @override
  RateState build() => const RateState.idle();

  void deleteMovieRating(int movieId) async {
    state = const RateState.loading();

    state = await ref
        .read(movieServiceProvider)
        .deleteRating(id: movieId)
        .then((_) => const RateState.success())
        .catchError(RateState.error);

    ref.invalidate(getMovieDetailsProvider(movieId));
    ref.invalidate(getRatedMoviesProvider);
  }

  void deleteTVRating(int tvId) async {
    state = const RateState.loading();

    state = await ref
        .read(tvShowServiceProvider)
        .deleteTVRating(id: tvId)
        .then((_) => const RateState.success())
        .catchError(RateState.error);

    ref.invalidate(getTVDetailsProvider(tvId));
    ref.invalidate(getRatedTVShowsProvider);
  }
}
