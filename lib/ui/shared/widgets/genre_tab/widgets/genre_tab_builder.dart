import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loggy/loggy.dart';

import '../../../../../core/models/movie/movie_arguments.dart';
import '../../../../../core/providers/movie_provider.dart';
import '../../../../../utils/constants.dart';
import '../../errors/error_snack_bar_content.dart';
import '../../errors/error_text.dart';
import '../../movie_list/movie_list.dart';

class GenreTabBuilder extends ConsumerWidget {
  const GenreTabBuilder({
    Key? key,
    required this.genreId,
    this.includeAdult,
  }) : super(key: key);

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
        logError('Could not get movies.');

        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Theme.of(context).colorScheme.surface,
              content: const ErrorSnackBarContent(
                message: 'Could not get movies.',
              ),
            ),
          );
        });

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
