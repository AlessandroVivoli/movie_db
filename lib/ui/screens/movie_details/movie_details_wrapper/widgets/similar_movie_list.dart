import 'package:flutter/material.dart';

import '../../../../../core/models/movie/details/movie_details.dart';
import '../../../../../core/services/movie_service.dart';
import '../../../../shared/widgets/errors/error_snack_bar_content.dart';
import '../../../../shared/widgets/errors/error_text.dart';
import '../../../../shared/widgets/movie_list/movie_list.dart';

class SimilarMovieList extends StatelessWidget {
  const SimilarMovieList({
    Key? key,
    required this.details,
  }) : super(key: key);

  final MovieDetails details;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            'Similar movies'.toUpperCase(),
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

class _SimilarMoviesBuilder extends StatelessWidget {
  const _SimilarMoviesBuilder({
    Key? key,
    required this.details,
  }) : super(key: key);

  final MovieDetails details;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: MovieService.getSimilarMovies(id: details.id!),
      builder: (context, snapshot) {
        late Widget widget;

        if (snapshot.connectionState == ConnectionState.waiting) {
          widget = const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          if (snapshot.hasError) {
            WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Theme.of(context).colorScheme.surface,
                  content: const ErrorSnackBarContent(
                    message: 'Could not get similar movies.',
                  ),
                ),
              );
            });

            widget = const Center(
              child: ErrorText('Something went wrong.'),
            );
          } else if (!snapshot.hasData) {
            widget = const Center(
              child: Text('Nothing found'),
            );
          } else {
            widget = MovieList(
              movieList: snapshot.data!,
              padding: 10,
            );
          }
        }

        return widget;
      },
    );
  }
}
