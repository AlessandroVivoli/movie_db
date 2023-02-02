import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../features/image/domain/sizes.dart';
import '../../../../features/image/provider/image_service_provider.dart';
import '../../../../features/movies/domain/movie.dart';
import '../../custom_image/custom_network_image.dart';
import '../../rating/rating.dart';
import '../../stroke_text/stroke_text.dart';

class MovieCardWrapper extends ConsumerWidget {
  const MovieCardWrapper({
    super.key,
    required this.movie,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imageService = ref.watch(imageServiceProvider);

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
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
                      url: imageService.getImageUrl(
                        size: PosterSizes.w500.name,
                        path: movie.posterPath,
                      ),
                      placeholderIcon: const Icon(
                        Icons.movie,
                        size: 50,
                      ),
                    ),
                  ),
                ),
                if (movie.adult)
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
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 5),
                child: Text(
                  '${movie.title}',
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Rating(
                rating: movie.voteAverage,
                size: 12,
                padding: 1,
                alignment: MainAxisAlignment.start,
              )
            ],
          ),
        ),
      ],
    );
  }
}