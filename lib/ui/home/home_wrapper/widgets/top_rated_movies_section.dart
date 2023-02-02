import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../core/shared/widgets/errors/error_text.dart';
import '../../../../../core/shared/widgets/movie_list/movie_list.dart';
import '../../../../../core/utils/extensions.dart';
import '../../../../features/movies/provider/get_top_rated_movies_provider.dart';

class TopRatedMoviesSection extends StatelessWidget {
  const TopRatedMoviesSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
            'Top rated movies'.toUpperCase(),
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

    return LimitedBox(
      maxHeight: 250,
      child: topRatedMovies.when(
        data: (movies) {
          if (movies.isEmpty) {
            return const Center(
              child: Text('Nothing found.'),
            );
          }

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: MovieList(movieList: movies),
          );
        },
        error: (error, stackTrace) {
          context.showErrorSnackBar('Could not get top rated movies.');

          return const Center(
            child: ErrorText('Something went wrong.'),
          );
        },
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
