import 'package:flutter/cupertino.dart';

import '../../../../core/widgets/rating/rating.dart';

class MovieRating extends StatelessWidget {
  final double rating;

  const MovieRating(this.rating, {super.key});

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
