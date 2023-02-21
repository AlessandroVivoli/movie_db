import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/widgets/backdrop_image/backdrop_image.dart';
import '../../../features/movies/domain/backdrop_sizes_enum.dart';
import '../../../features/tv_shows/provider/tv_image_service_provider.dart';
import '../../../routing/routes.dart';
import '../shared/carousel_play_icon.dart';
import '../shared/carousel_title_text.dart';

class TVCraouselItem extends ConsumerWidget {
  const TVCraouselItem({
    super.key,
    required this.image,
    required this.title,
    required this.id,
  });

  final String? image;
  final String title;
  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imageService = ref.watch(tvImageServiceProvider);

    return Stack(
      children: [
        BackdropImage(
          imgUrl: imageService.getMediaBackdropUrl(
            size: BackdropSizes.original,
            path: image,
          ),
          placeholderIcon: const Icon(Icons.tv),
        ),
        CarouselTitleText(title: title),
        const PlayIcon(),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(
              context,
              AppRoute.tv,
              arguments: id,
            );
          },
        )
      ],
    );
  }
}
