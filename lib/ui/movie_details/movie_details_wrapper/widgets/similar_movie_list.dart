import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/widgets/errors/error_text.dart';
import '../../../../core/widgets/movie_list/movie_list.dart';
import '../../../../core/extensions.dart';
import '../../../../features/movies/domain/movie_details.dart';
import '../../../../features/movies/provider/get_similar_movies_provider.dart';

class SimilarMovieList extends StatelessWidget {
  const SimilarMovieList({
    super.key,
    required this.details,
  });

  final MovieDetails details;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            'Similar movies'.toUpperCase(),
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
            child: _SimilarMoviesBuilder(details: details),
          ),
        ),
      ],
    );
  }
}

class _SimilarMoviesBuilder extends ConsumerWidget {
  const _SimilarMoviesBuilder({
    required this.details,
  });

  final MovieDetails details;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final similarMovieList = ref.watch(getSimilarMoviesProvider(details.id));

    return similarMovieList.when(
      data: (similarMovies) {
        if (similarMovies.isEmpty) {
          return const Center(
            child: Text('Nothing found'),
          );
        }

        return MovieList(
          movieList: similarMovies,
          padding: 10,
        );
      },
      error: (error, stackTrace) {
        context.showErrorSnackBar('Could not get similar movies.');

        return const Center(
          child: ErrorText('Something went wrong.'),
        );
      },
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
