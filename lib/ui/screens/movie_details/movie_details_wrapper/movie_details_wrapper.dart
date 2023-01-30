import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/models/movie/details/movie_details.dart';
import '../../../../core/providers/auth_provider.dart';
import 'widgets/movie_account_actions/movie_account_actions.dart';
import 'widgets/movie_casts.dart';
import 'widgets/movie_description.dart';
import 'widgets/movie_genres.dart';
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
                loggedIn: (user) => MovieAccountActions(movieDetails: details),
                orElse: () => const SizedBox(height: 0),
              ),
              MovieDescription(details.overview!),
              MovieInfo(
                budget: details.budget,
                runtime: details.runtime,
                releaseDate: details.releaseDate!,
              ),
              MovieGenres(details: details),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: MovieCasts(details: details),
        ),
        SimilarMovieList(details: details),
      ],
    );
  }
}
