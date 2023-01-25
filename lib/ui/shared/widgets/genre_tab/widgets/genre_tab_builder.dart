import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../core/providers/service_providers.dart';
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
    final movieService = ref.watch(movieServiceProvider);

    return FutureBuilder(
      future: movieService.getMovies(
        withGenres: [genreId],
        sortBy: SortBy.popularityDesc,
        includeAdult: includeAdult,
      ),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data!.isEmpty) {
            return const Center(
              child: Text('Nothing found.'),
            );
          }

          return MovieList(
            movieList: snapshot.data!,
            padding: 10,
          );
        } else if (snapshot.hasError) {
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
        }

        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
