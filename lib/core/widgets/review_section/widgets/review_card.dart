// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:url_launcher/url_launcher.dart';

import '../../../../features/reviews/domain/review.dart';
import '../../../extensions/build_context_extensions.dart';
import '../../custom_image/custom_network_image.dart';
import '../../rating/rating.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard({
    super.key,
    required this.review,
    required this.reviewAuthorAvatarUrl,
  });

  final Review review;
  final String? reviewAuthorAvatarUrl;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width - 20;

    return Container(
      constraints: BoxConstraints(maxWidth: width),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            spreadRadius: 0,
            blurRadius: 4,
            offset: const Offset(3, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _ReviewAuthorAvatar(
                review: review,
                reviewAuthorAvatarUrl: reviewAuthorAvatarUrl,
              ),
              const SizedBox(
                width: 10,
              ),
              _ReviewAuthoUsername(review: review),
            ],
          ),
          const SizedBox(height: 10),
          Markdown(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            physics: const NeverScrollableScrollPhysics(),
            data: review.content,
            shrinkWrap: true,
            selectable: true,
            extensionSet: md.ExtensionSet(
              md.ExtensionSet.gitHubFlavored.blockSyntaxes,
              md.ExtensionSet.gitHubFlavored.inlineSyntaxes,
            ),
            onTapLink: (text, href, title) async {
              if (href != null) {
                final url = Uri.tryParse(href);
                if (url != null && await canLaunchUrl(url)) {
                  launchUrl(url);
                }
              }
            },
          ),
        ],
      ),
    );
  }
}

class _ReviewAuthoUsername extends StatelessWidget {
  const _ReviewAuthoUsername({required this.review});

  final Review review;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(review.author),
              const SizedBox(width: 5),
              Text(
                context.locale.releaseDateValue(review.createdAt!),
                style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                  fontSize: 10,
                ),
              ),
              const SizedBox(width: 2),
              if (review.updatedAt != null)
                Text(
                  '(edited)',
                  style: TextStyle(
                    fontSize: 10,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
            ],
          ),
          if (review.authorDetails.rating != null)
            Rating(
              showNum: false,
              rating: review.authorDetails.rating!,
              alignment: MainAxisAlignment.start,
              padding: 1,
              size: 16,
            ),
        ],
      ),
    );
  }
}

class _ReviewAuthorAvatar extends StatelessWidget {
  const _ReviewAuthorAvatar({
    required this.review,
    required this.reviewAuthorAvatarUrl,
  });

  final Review review;
  final String? reviewAuthorAvatarUrl;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      height: 50,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: Container(
          color: Theme.of(context).colorScheme.background,
          child: CustomNetworkImage(
            placeholder: const Icon(Icons.person),
            url: reviewAuthorAvatarUrl,
          ),
        ),
      ),
    );
  }
}
