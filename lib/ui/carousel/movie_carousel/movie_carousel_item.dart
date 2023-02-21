import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/widgets/backdrop_image/backdrop_image.dart';
import '../../../features/movies/domain/backdrop_sizes_enum.dart';
import '../../../features/movies/provider/images/movie_image_service_provider.dart';
import '../../../routing/routes.dart';
import '../shared/carousel_play_icon.dart';
import '../shared/carousel_title_text.dart';

class MovieCarouselItem extends ConsumerWidget {
  final String? image;
  final String title;
  final int id;

  const MovieCarouselItem({
    super.key,
    required this.image,
    required this.title,
    required this.id,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imageService = ref.watch(movieImageServiceProvider);

    return Stack(
      children: [
        BackdropImage(
          imgUrl: imageService.getMediaBackdropUrl(
            size: BackdropSizes.original,
            path: image,
          ),
          placeholderIcon: const Icon(Icons.movie),
        ),
        CarouselTitleText(title: title),
        const PlayIcon(),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(
              context,
              AppRoute.movie,
              arguments: id,
            );
          },
        ),
      ],
    );
  }
}
