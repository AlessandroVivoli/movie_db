import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loggy/loggy.dart';

import '../../../../../core/providers/movie_provider.dart';
import '../../../../shared/widgets/errors/error_snack_bar_content.dart';
import '../../../../shared/widgets/errors/error_text.dart';
import '../../../../shared/widgets/movie_list/movie_list.dart';

class TopRatedMoviesSection extends StatelessWidget {
  const TopRatedMoviesSection({
    Key? key,
  }) : super(key: key);

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
  const _TopRatedMoviesText({
    Key? key,
  }) : super(key: key);

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
  const _TopRatedMoviesList({
    Key? key,
  }) : super(key: key);

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
          logError('Could not get top rated movies.', error, stackTrace);

          WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Theme.of(context).colorScheme.surface,
                content: const ErrorSnackBarContent(
                  message: 'Could not get top rated movies.',
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
      ),
    );
  }
}
