import 'package:flutter/material.dart';

import '../../custom_image/custom_network_image.dart';
import '../../rating/rating.dart';
import '../../stroke_text/stroke_text.dart';

class TVCardWrapper extends StatelessWidget {
  const TVCardWrapper({
    super.key,
    required this.imageUrl,
    required this.ratingSize,
    required this.ratingSpacing,
    required this.ratingAlignment,
    required this.ratingDigitSpacing,
    required this.showRatingNum,
    required this.adult,
    required this.name,
    required this.voteAverage,
  });

  final String? imageUrl;
  final double ratingSize;
  final double ratingSpacing;
  final MainAxisAlignment ratingAlignment;
  final double ratingDigitSpacing;
  final bool showRatingNum;

  final bool adult;
  final String name;
  final double voteAverage;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
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
                        Icons.tv,
                        size: 50,
                      ),
                    ),
                  ),
                ),
                if (adult)
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
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 5),
                child: Text(
                  name,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Rating(
                rating: voteAverage,
                size: ratingSize,
                padding: ratingSpacing,
                alignment: ratingAlignment,
                digitSpacing: ratingDigitSpacing,
                showNum: showRatingNum,
              )
            ],
          ),
        )
      ],
    );
  }
}
