import 'package:flutter/material.dart';

import '../../../features/movies/domain/movie.dart';
import 'widgets/movie_card_wrapper.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;
  final String? imageUrl;
  final double ratingSize;
  final double ratingSpacing;
  final double ratingDigitSpacing;
  final MainAxisAlignment ratingAlignment;
  final bool showRatingNum;

  final void Function()? onTap;

  const MovieCard({
    super.key,
    required this.movie,
    required this.imageUrl,
    this.onTap,
    this.ratingSpacing = 1,
    this.ratingSize = 12,
    this.ratingDigitSpacing = 30,
    this.ratingAlignment = MainAxisAlignment.start,
    this.showRatingNum = true,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: MovieCardWrapper(
        movie: movie,
        imageUrl: imageUrl,
        ratingSpacing: ratingSpacing,
        ratingSize: ratingSize,
        ratingAlignment: ratingAlignment,
        ratingDigitSpacing: ratingDigitSpacing,
        showRatingNum: showRatingNum,
      ),
    );
  }
}
