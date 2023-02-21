import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../features/auth/provider/auth_provider.dart';
import '../../../core/widgets/review_section/review_section.dart';
import '../../../features/account/provider/favorites/add_to_favorites_provider.dart';
import '../../../features/account/provider/watchlist/add_to_watchlist_provider.dart';
import '../../../features/image/provider/image_service_provider.dart';
import '../../../features/media/provider/delete_rating_provider.dart';
import '../../../features/media/provider/rate_media_provider.dart';
import '../../../features/movies/domain/movie_details.dart';
import '../../media_widgets/media_account_actions/media_account_actions.dart';
import '../../media_widgets/media_cast.dart';
import '../../media_widgets/media_genres.dart';
import 'widgets/movie_description.dart';
import 'widgets/movie_info.dart';
import 'widgets/movie_rating.dart';
import 'widgets/similar_movie_list.dart';

class MovieDetailsWrapper extends ConsumerWidget {
  final MovieDetails details;

  const MovieDetailsWrapper({super.key, required this.details});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authProvider);

    final imageService = ref.watch(imageServiceProvider);

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MovieRating(details.voteAverage),
              user.maybeWhen(
                loggedIn: (user) => MediaAccountActions(
                  mediaId: details.id,
                  accountStates: details.accountStates!,
                  onFavoritePressed: (favorite) async {
                    await ref
                        .read(favoritesProvider.notifier)
                        .addMovieToFavorites(
                          movieId: details.id,
                          favorite: favorite,
                        );
                  },
                  onWatchlistPressed: (watchlist) async {
                    await ref
                        .read(watchlistProvider.notifier)
                        .addMovieToWatchlist(
                          movieId: details.id,
                          watchlist: watchlist,
                        );
                  },
                  onRate: (rating) async {
                    if (rating == null) {
                      return await ref
                          .read(deleteRatingProvider.notifier)
                          .deleteMovieRating(details.id);
                    }

                    await ref.read(rateMediaProvider.notifier).rateMovie(
                          details.id,
                          rating,
                        );
                  },
                ),
                orElse: () => const SizedBox(height: 0),
              ),
              MovieDescription(details.overview),
              MovieInfo(
                budget: details.budget,
                runtime: details.runtime,
                releaseDate: details.releaseDate,
              ),
              MediaGenres(genres: details.genres),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: MediaCasts(mediaId: details.id, mediaType: 'movie'),
        ),
        SimilarMovieList(movieId: details.id),
        ReviewsSection(
          reviews: details.reviews.results,
          avatarBuilder: (avatarPath) =>
              imageService.getImageUrl(path: avatarPath),
        )
      ],
    );
  }
}
