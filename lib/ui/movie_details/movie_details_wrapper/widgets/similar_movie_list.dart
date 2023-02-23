import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/extensions/build_context_extensions.dart';
import '../../../../core/widgets/error_text/error_text.dart';
import '../../../../core/widgets/movie_list/movie_list.dart';
import '../../../../features/movies/domain/poster_sizes_enum.dart';
import '../../../../features/movies/provider/get_similar_movies_provider.dart';
import '../../../../features/movies/provider/images/movie_image_service_provider.dart';
import '../../../../routing/routes.dart';

class SimilarMovieList extends StatelessWidget {
  const SimilarMovieList({
    super.key,
    required this.movieId,
  });

  final int movieId;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            context.locale.similarMoviesSectionTitle.toUpperCase(),
            style: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        SizedBox(
          height: 300,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: _SimilarMoviesBuilder(movieId: movieId),
          ),
        ),
      ],
    );
  }
}

class _SimilarMoviesBuilder extends ConsumerWidget {
  const _SimilarMoviesBuilder({
    required this.movieId,
  });

  final int movieId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final similarMovieList = ref.watch(getSimilarMoviesProvider(movieId));

    final imageService = ref.watch(movieImageServiceProvider);

    return similarMovieList.when(
      data: (similarMovies) {
        if (similarMovies.isEmpty) {
          return Center(
            child: Text(context.locale.noSimilarMovies),
          );
        }

        return MovieList(
          length: similarMovies.length,
          padding: 10,
          imageBuilder: (index) => imageService.getMediaPosterUrl(
            size: PosterSizes.w154,
            path: similarMovies[index].posterPath,
          ),
          onCardTap: (movieId) => Navigator.pushNamed(
            context,
            AppRoute.movie,
            arguments: movieId,
          ),
          averageVoteBuilder: (int index) => similarMovies[index].voteAverage,
          isAdultBuilder: (int index) => similarMovies[index].adult,
          titleBuilder: (int index) => similarMovies[index].title,
        );
      },
      error: (error, stackTrace) {
        context.showErrorSnackBar(context.locale.getSimilarMoviesError);

        return Center(
          child: ErrorText(context.locale.unexpectedErrorMessage),
        );
      },
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
