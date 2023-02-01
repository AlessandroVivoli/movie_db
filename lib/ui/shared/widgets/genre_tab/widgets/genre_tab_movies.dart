import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../core/models/movie/movie_arguments.dart';
import '../../../../../core/providers/movie/get_movies_provider.dart';
import '../../../../../utils/constants.dart';
import '../../../../../utils/extensions.dart';
import '../../errors/error_text.dart';
import '../../movie_list/movie_list.dart';

class GenreTabMovies extends ConsumerWidget {
  const GenreTabMovies({
    super.key,
    required this.genreId,
    this.includeAdult,
  });

  final bool? includeAdult;
  final int genreId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movieList = ref.watch(
      getMoviesProvider(
        MovieArguments(
          withGenres: [genreId],
          includeAdult: includeAdult,
          sortBy: Sorts.popularityDesc,
        ),
      ),
    );

    return movieList.when(
      data: (movies) {
        if (movies.isEmpty) {
          return const Center(
            child: Text('Nothing found.'),
          );
        }

        return MovieList(
          movieList: movies,
          padding: 10,
        );
      },
      error: (error, stackTrace) {
        context.showErrorSnackBar('Could not get movies.');

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
