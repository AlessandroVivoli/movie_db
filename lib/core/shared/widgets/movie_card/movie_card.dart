import 'package:flutter/material.dart';

import '../../../../features/movies/domain/movie.dart';
import '../../../../routing/routes.dart';
import 'widgets/movie_card_wrapper.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;

  const MovieCard({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 120),
      child: GestureDetector(
        onTap: () async {
          await Navigator.pushNamed(
            context,
            AppRoute.movie,
            arguments: movie.id,
          );
        },
        child: MovieCardWrapper(movie: movie),
      ),
    );
  }
}
