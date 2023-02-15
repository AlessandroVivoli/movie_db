import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../features/auth/provider/auth_provider.dart';
import '../../../core/widgets/review_section/review_section.dart';
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
        ReviewsSection(reviews: details.reviews.results)
      ],
    );
  }
}
