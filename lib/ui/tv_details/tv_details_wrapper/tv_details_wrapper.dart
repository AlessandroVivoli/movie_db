import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/widgets/review_section/review_section.dart';
import '../../../features/account/provider/favorites/add_to_favorites_provider.dart';
import '../../../features/account/provider/watchlist/add_to_watchlist_provider.dart';
import '../../../features/auth/provider/auth_provider.dart';
import '../../../features/media/provider/delete_rating_provider.dart';
import '../../../features/media/provider/rate_media_provider.dart';
import '../../../features/tv_shows/domain/tv_show_details.dart';
import '../../media_widgets/media_account_actions/media_account_actions.dart';
import '../../media_widgets/media_cast.dart';
import '../../media_widgets/media_genres.dart';
import 'widgets/similar_tv_show_list.dart';
import 'widgets/tv_description.dart';
import 'widgets/tv_info.dart';
import 'widgets/tv_rating.dart';
import 'widgets/tv_season_list.dart';

class TVDetailsWrapper extends ConsumerWidget {
  const TVDetailsWrapper({super.key, required this.details});

  final TVShowDetails details;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authProvider);

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
              TVRating(details.voteAverage),
              user.maybeWhen(
                loggedIn: (user) => MediaAccountActions(
                  mediaId: details.id,
                  accountStates: details.accountStates!,
                  onWatchlistPressed: (watchlist) async => await ref
                      .read(watchlistProvider.notifier)
                      .addTVShowToWatchlist(
                        tvId: details.id,
                        watchlist: watchlist,
                      ),
                  onFavoritePressed: (favorite) async => await ref
                      .read(favoritesProvider.notifier)
                      .addTVShowToFavorites(
                        tvId: details.id,
                        favorite: favorite,
                      ),
                  onRate: (rating) async {
                    if (rating == null) {
                      return await ref
                          .read(deleteRatingProvider.notifier)
                          .deleteTVRating(details.id);
                    }

                    await ref.read(rateMediaProvider.notifier).rateTVShow(
                          details.id,
                          rating,
                        );
                  },
                ),
                orElse: () => const SizedBox(height: 0),
              ),
              TVDescription(details.overview),
              TVInfo(
                released: details.firstAirDate,
                lastReleaseDate: details.lastAirDate,
                seasonCount: details.numberOfSeasons,
              ),
              MediaGenres(genres: details.genres),
              TVSeasonList(
                seasons: details.seasons,
                showName: details.name,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: MediaCasts(mediaId: details.id, mediaType: 'tv'),
        ),
        SimilarTVShowList(tvId: details.id),
        ReviewsSection(reviews: details.reviews.results)
      ],
    );
  }
}
