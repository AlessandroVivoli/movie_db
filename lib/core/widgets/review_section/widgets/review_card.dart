// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:url_launcher/url_launcher.dart';

import '../../../../features/image/provider/image_service_provider.dart';
import '../../../../features/reviews/domain/review.dart';
import '../../../extensions/build_context_extensions.dart';
import '../../custom_image/custom_network_image.dart';
import '../../rating/rating.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard({
    super.key,
    required this.review,
  });

  final Review review;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width - 20;

    final formattedContent = review.content.replaceAll(
      RegExp('<em>|</em>'),
      '*',
    );

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
              _ReviewAuthorAvatar(review: review),
              const SizedBox(
                width: 10,
              ),
              _ReviewAuthoUsername(
                review: review,
                localization: context.locale,
              ),
            ],
          ),
          const SizedBox(height: 10),
          Markdown(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            physics: const NeverScrollableScrollPhysics(),
            data: formattedContent,
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
  const _ReviewAuthoUsername({
    required this.review,
    required this.localization,
  });

  final Review review;
  final AppLocalizations localization;

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
                localization.releaseDateValue(review.createdAt!),
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

class _ReviewAuthorAvatar extends ConsumerWidget {
  const _ReviewAuthorAvatar({
    required this.review,
  });

  final Review review;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: 50,
      height: 50,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: Container(
          color: Theme.of(context).colorScheme.background,
          child: CustomNetworkImage(
            placeholder: const Icon(Icons.person),
            url: ref.read(imageServiceProvider).getImageUrl(
                  path: review.authorDetails.avatarPath,
                ),
          ),
        ),
      ),
    );
  }
}
