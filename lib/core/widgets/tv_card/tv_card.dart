import 'package:flutter/material.dart';

import '../../../features/tv_shows/domain/tv_show.dart';
import 'widgets/tv_card_wrapper.dart';

class TVCard extends StatelessWidget {
  final TVShow tvShow;
  final String? imageUrl;
  final double ratingSize;
  final double ratingSpacing;
  final double ratingDigitSpacing;
  final MainAxisAlignment ratingAlignment;
  final bool showRatingNum;

  final void Function()? onTap;

  const TVCard({
    super.key,
    required this.tvShow,
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
      child: TVCardWrapper(
        tvShow: tvShow,
        imageUrl: imageUrl,
        ratingAlignment: ratingAlignment,
        ratingDigitSpacing: ratingDigitSpacing,
        ratingSize: ratingSize,
        ratingSpacing: ratingSpacing,
        showRatingNum: showRatingNum,
      ),
    );
  }
}
