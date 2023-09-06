import 'package:flutter/material.dart';

import 'widgets/tv_card_wrapper.dart';

class TVCard extends StatelessWidget {
  final String? imageUrl;
  final double ratingSize;
  final double ratingSpacing;
  final double ratingDigitSpacing;
  final MainAxisAlignment ratingAlignment;
  final bool showRatingNum;

  final bool adult;
  final String name;
  final double voteAverage;

  final void Function()? onTap;

  const TVCard({
    super.key,
    required this.imageUrl,
    this.onTap,
    this.ratingSpacing = 1,
    this.ratingSize = 12,
    this.ratingDigitSpacing = 30,
    this.ratingAlignment = MainAxisAlignment.start,
    this.showRatingNum = true,
    required this.adult,
    required this.name,
    required this.voteAverage,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: TVCardWrapper(
        imageUrl: imageUrl,
        ratingAlignment: ratingAlignment,
        ratingDigitSpacing: ratingDigitSpacing,
        ratingSize: ratingSize,
        ratingSpacing: ratingSpacing,
        showRatingNum: showRatingNum,
        adult: adult,
        name: name,
        voteAverage: voteAverage,
      ),
    );
  }
}
