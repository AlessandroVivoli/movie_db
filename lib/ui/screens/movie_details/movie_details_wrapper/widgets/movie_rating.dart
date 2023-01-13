import 'package:flutter/cupertino.dart';

import '../../../../shared/widgets/rating/rating.dart';

class MovieRating extends StatelessWidget {
  final double rating;

  const MovieRating(this.rating, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
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
