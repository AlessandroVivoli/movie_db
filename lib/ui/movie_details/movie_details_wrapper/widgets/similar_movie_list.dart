import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/extensions/build_context_extensions.dart';
import '../../../../core/widgets/errors/error_text.dart';
import '../../../../core/widgets/movie_list/movie_list.dart';
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
    final localization = AppLocalizations.of(context)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            localization.similarMoviesSectionTitle.toUpperCase(),
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

    final localization = AppLocalizations.of(context)!;

    return similarMovieList.when(
      data: (similarMovies) {
        if (similarMovies.isEmpty) {
          return Center(
            child: Text(localization.noSimilarMovies),
          );
        }

        return MovieList(
          movieList: similarMovies,
          padding: 10,
        );
      },
      error: (error, stackTrace) {
        context.showErrorSnackBar(localization.getSimilarMoviesError);

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
