import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../features/media/domain/media_arguments.dart';
import '../../../../features/media/domain/sort_by.dart';
import '../../../../features/movies/domain/poster_sizes_enum.dart';
import '../../../../features/movies/provider/get_movies_provider.dart';
import '../../../../features/movies/provider/images/movie_image_service_provider.dart';
import '../../../extensions/build_context_extensions.dart';
import '../../error_text/error_text.dart';
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

    final imageService = ref.watch(movieImageServiceProvider);

    return movieList.when(
      data: (movies) {
        if (movies.isEmpty) {
          return Center(
            child: Text(context.locale.noPopularMovies),
          );
        }

        return MovieList(
          movieList: movies,
          padding: 10,
          imageBuilder: (imagePath) => imageService.getMediaPosterUrl(
            size: PosterSizes.w154,
            path: imagePath,
          ),
        );
      },
      error: (error, stackTrace) {
        context.showErrorSnackBar(context.locale.getPopularMoviesError);

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
