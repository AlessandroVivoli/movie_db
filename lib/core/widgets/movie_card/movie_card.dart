import 'package:flutter/material.dart';

import 'widgets/movie_card_wrapper.dart';

class MovieCard extends StatelessWidget {
  final String? imageUrl;
  final double ratingSize;
  final double ratingSpacing;
  final double ratingDigitSpacing;
  final MainAxisAlignment ratingAlignment;
  final bool showRatingNum;

  final void Function()? onTap;

  final bool adult;
  final String title;
  final double voteAverage;

  const MovieCard({
    super.key,
    required this.imageUrl,
    this.onTap,
    this.ratingSpacing = 1,
    this.ratingSize = 12,
    this.ratingDigitSpacing = 30,
    this.ratingAlignment = MainAxisAlignment.start,
    this.showRatingNum = true,
    required this.adult,
    required this.title,
    required this.voteAverage,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: MovieCardWrapper(
        imageUrl: imageUrl,
        ratingSpacing: ratingSpacing,
        ratingSize: ratingSize,
        ratingAlignment: ratingAlignment,
        ratingDigitSpacing: ratingDigitSpacing,
        showRatingNum: showRatingNum,
        adult: adult,
        title: title,
        voteAverage: voteAverage,
      ),
    );
  }
}
