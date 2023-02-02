import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../features/movies/domain/sort_by.dart';
import '../../../../features/movies/provider/get_movies_provider.dart';
import '../../../extensions.dart';
import '../../errors/error_text.dart';
import '../../movie_list/movie_list.dart';

class GenreTabMovies extends ConsumerWidget {
  const GenreTabMovies({
    super.key,
    required this.genreId,
    this.includeAdult = false,
  });

  final bool includeAdult;
  final int genreId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movieList = ref.watch(
      getMoviesProvider(
        withGenres: [genreId],
        includeAdult: includeAdult,
        sortBy: SortBy.popularityDesc,
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