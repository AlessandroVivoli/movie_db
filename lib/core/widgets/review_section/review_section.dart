import 'package:flutter/material.dart';

import '../../../features/reviews/domain/review.dart';
import '../../extensions/build_context_extensions.dart';
import 'widgets/review_card.dart';

class ReviewsSection extends StatelessWidget {
  const ReviewsSection({super.key, required this.reviews});

  final List<Review> reviews;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
          child: Text(
            'Reviews'.toUpperCase(),
            style: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        _ReviewList(reviews: reviews)
      ],
    );
  }
}

class _ReviewList extends StatelessWidget {
  const _ReviewList({
    required this.reviews,
  });

  final List<Review> reviews;

  @override
  Widget build(BuildContext context) {
    if (reviews.isEmpty) return Text(context.locale.noReviews);

    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      itemBuilder: (context, index) {
        return ReviewCard(
          review: reviews[index],
        );
      },
      separatorBuilder: (context, index) => const SizedBox(height: 10),
      itemCount: reviews.length,
    );
  }
}
