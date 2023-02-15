import 'package:flutter/material.dart';

import '../../../../core/widgets/rating/rating.dart';

class TVRating extends StatelessWidget {
  const TVRating(this.rating, {super.key});

  final double rating;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Rating(
        rating: rating,
        alignment: MainAxisAlignment.start,
        padding: 1.3,
        size: 14,
        digits: 2,
      ),
    );
  }
}
