import 'package:flutter/material.dart';

import '../../../../../core/services/movie_service.dart';
import '../../errors/error_snack_bar_content.dart';
import '../../errors/error_text.dart';
import '../../movie_list/movie_list.dart';

class GenreTabBuilder extends StatelessWidget {
  const GenreTabBuilder({
    Key? key,
    required this.genreId,
  }) : super(key: key);

  final int genreId;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: MovieService.getMovies(
        withGenres: [genreId],
        sortBy: 'popularity.desc',
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
