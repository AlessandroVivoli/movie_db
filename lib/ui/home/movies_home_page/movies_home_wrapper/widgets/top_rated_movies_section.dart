import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../core/extensions/build_context_extensions.dart';
import '../../../../../core/widgets/error_text/error_text.dart';
import '../../../../../core/widgets/movie_list/movie_list.dart';
import '../../../../../features/movies/domain/poster_sizes_enum.dart';
import '../../../../../features/movies/provider/get_top_rated_movies_provider.dart';
import '../../../../../features/movies/provider/images/movie_image_service_provider.dart';
import '../../../../../routing/routes.dart';

class TopRatedMoviesSection extends StatelessWidget {
  const TopRatedMoviesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: const [
        _TopRatedMoviesText(),
        _TopRatedMoviesList(),
      ],
    );
  }
}

class _TopRatedMoviesText extends StatelessWidget {
  const _TopRatedMoviesText();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Text(
            context.locale.topRatedMoviesSectionTitle.toUpperCase(),
            style: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class _TopRatedMoviesList extends ConsumerWidget {
  const _TopRatedMoviesList();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final topRatedMovies = ref.watch(getTopRatedMoviesProvider);

    final imageService = ref.watch(movieImageServiceProvider);

    return SizedBox(
      height: 240,
      child: topRatedMovies.when(
        data: (movies) {
          if (movies.isEmpty) {
            return Center(
              child: Text(context.locale.noTopRatedMovies),
            );
          }

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: MovieList(
              imageBuilder: (index) => imageService.getMediaPosterUrl(
                size: PosterSizes.w154,
                path: movies[index].posterPath,
              ),
              onCardTap: (index) => Navigator.pushNamed(
                context,
                AppRoute.movie,
                arguments: movies[index].id,
              ),
              averageVoteBuilder: (index) => movies[index].voteAverage,
              isAdultBuilder: (index) => movies[index].adult,
              titleBuilder: (index) => movies[index].title,
              length: movies.length,
            ),
          );
        },
        error: (error, stackTrace) {
          context.showErrorSnackBar(context.locale.getTopRatedMoviesError);

          return Center(
            child: ErrorText(context.locale.unexpectedErrorMessage),
          );
        },
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
