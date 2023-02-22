import 'package:flutter/material.dart';

import '../../../../features/movies/domain/movie.dart';
import '../../custom_image/custom_network_image.dart';
import '../../rating/rating.dart';
import '../../stroke_text/stroke_text.dart';

class MovieCardWrapper extends StatelessWidget {
  const MovieCardWrapper({
    super.key,
    required this.movie,
    required this.imageUrl,
    required this.ratingSize,
    required this.ratingSpacing,
    required this.ratingAlignment,
    required this.ratingDigitSpacing,
    required this.showRatingNum,
  });

  final Movie movie;
  final String? imageUrl;
  final double ratingSize;
  final double ratingSpacing;
  final MainAxisAlignment ratingAlignment;
  final double ratingDigitSpacing;
  final bool showRatingNum;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        AspectRatio(
          aspectRatio: 2 / 3,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                  ),
                  child: Center(
                    child: CustomNetworkImage(
                      url: imageUrl,
                      placeholder: const Icon(
                        Icons.movie,
                        size: 50,
                      ),
                    ),
                  ),
                ),
                if (movie.adult)
                  const Positioned(
                    top: 8,
                    right: 8,
                    child: StrokeText('18+'),
                  ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 5),
                child: Text(
                  '${movie.title}',
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Rating(
                rating: movie.voteAverage,
                size: ratingSize,
                padding: ratingSpacing,
                alignment: ratingAlignment,
                digitSpacing: ratingDigitSpacing,
                showNum: showRatingNum,
              )
            ],
          ),
        ),
      ],
    );
  }
}
