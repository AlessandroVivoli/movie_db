import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../features/media/domain/media_arguments.dart';
import '../../../../features/media/domain/sort_by.dart';
import '../../../../features/movies/provider/get_movies_provider.dart';
import '../../../extensions/build_context_extensions.dart';
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
        MediaArguments(
          withGenres: [genreId],
          includeAdult: includeAdult,
          sortBy: SortBy.popularityDesc,
        ),
      ),
    );

    final localization = AppLocalizations.of(context)!;

    return movieList.when(
      data: (movies) {
        if (movies.isEmpty) {
          return Center(
            child: Text(localization.noPopularMovies),
          );
        }

        return MovieList(
          movieList: movies,
          padding: 10,
        );
      },
      error: (error, stackTrace) {
        context.showErrorSnackBar(localization.getPopularMoviesError);

        return Center(
          child: ErrorText(localization.unexpectedErrorMessage),
        );
      },
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
