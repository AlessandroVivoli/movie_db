import 'package:flutter/material.dart';

import '../../extensions/build_context_extensions.dart';
import 'widgets/review_card.dart';

class ReviewsSection extends StatelessWidget {
  const ReviewsSection({
    super.key,
    required this.avatarBuilder,
    required this.authorNameBuilder,
    required this.contentBuilder,
    required this.dateCreatedBuilder,
    required this.dateUpdatedBuilder,
    required this.ratingBuilder,
    required this.length,
  });

  final String? Function(int index) avatarBuilder;
  final String Function(int index) authorNameBuilder;
  final String Function(int index) contentBuilder;
  final DateTime Function(int index) dateCreatedBuilder;
  final DateTime? Function(int index) dateUpdatedBuilder;
  final double? Function(int index) ratingBuilder;

  final int length;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
          child: Text(
            context.locale.reviewsLabel.toUpperCase(),
            style: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        _ReviewList(
          avatarBuilder: avatarBuilder,
          authorNameBuilder: authorNameBuilder,
          contentBuilder: contentBuilder,
          dateCreatedBuilder: dateCreatedBuilder,
          dateUpdatedBuilder: dateUpdatedBuilder,
          length: length,
          ratingBuilder: ratingBuilder,
        )
      ],
    );
  }
}

class _ReviewList extends StatelessWidget {
  const _ReviewList({
    required this.avatarBuilder,
    required this.authorNameBuilder,
    required this.contentBuilder,
    required this.dateCreatedBuilder,
    required this.dateUpdatedBuilder,
    required this.ratingBuilder,
    required this.length,
  });

  final String? Function(int index) avatarBuilder;
  final String Function(int index) authorNameBuilder;
  final String Function(int index) contentBuilder;
  final DateTime Function(int index) dateCreatedBuilder;
  final DateTime? Function(int index) dateUpdatedBuilder;
  final double? Function(int index) ratingBuilder;

  final int length;

  @override
  Widget build(BuildContext context) {
    if (length == 0) return Text(context.locale.noReviews);

    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      itemBuilder: (context, index) {
        return ReviewCard(
          reviewAuthorAvatarUrl: avatarBuilder(index),
          author: authorNameBuilder(index),
          content: contentBuilder(index),
          createdAt: dateCreatedBuilder(index),
          updatedAt: dateUpdatedBuilder(index),
          rating: ratingBuilder(index),
        );
      },
      separatorBuilder: (context, index) => const SizedBox(height: 10),
      itemCount: length,
    );
  }
}
