import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../core/extensions/build_context_extensions.dart';
import '../../../../../core/widgets/errors/error_text.dart';
import '../../../../../core/widgets/movie_list/movie_list.dart';
import '../../../../../features/movies/provider/get_top_rated_movies_provider.dart';

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
    final localization = AppLocalizations.of(context)!;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Text(
            localization.topRatedMoviesSectionTitle.toUpperCase(),
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

    final localization = AppLocalizations.of(context)!;

    return LimitedBox(
      maxHeight: 250,
      child: topRatedMovies.when(
        data: (movies) {
          if (movies.isEmpty) {
            return Center(
              child: Text(localization.noTopRatedMovies),
            );
          }

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: MovieList(movieList: movies),
          );
        },
        error: (error, stackTrace) {
          context.showErrorSnackBar(localization.getTopRatedMoviesError);

          return Center(
            child: ErrorText(localization.unexpectedErrorMessage),
          );
        },
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
