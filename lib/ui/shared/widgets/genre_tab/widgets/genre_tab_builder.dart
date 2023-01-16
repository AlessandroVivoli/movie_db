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
                    message: 'Could not get movies.',
                  ),
                ),
              );
            });

            widget = const Center(
              child: ErrorText('Something went wrong.'),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            widget = const Center(
              child: Text('Nothing found.'),
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
