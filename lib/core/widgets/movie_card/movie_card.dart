import 'package:flutter/material.dart';

import '../../../features/movies/domain/movie.dart';
import 'widgets/movie_card_wrapper.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;
  final String? imageUrl;
  final void Function()? onTap;

  const MovieCard({
    super.key,
    required this.movie,
    required this.imageUrl,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 120, minHeight: 200),
      child: GestureDetector(
        onTap: onTap,
        child: MovieCardWrapper(
          movie: movie,
          imageUrl: imageUrl,
        ),
      ),
    );
  }
}
