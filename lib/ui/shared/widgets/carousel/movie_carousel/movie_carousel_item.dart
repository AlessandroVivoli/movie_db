import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../core/providers/image_provider.dart';
import '../../../../../utils/enums.dart';
import '../../../../../utils/routes.dart';
import '../../backdrop_image/backdrop_image.dart';

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
    final imageService = ref.watch(imageServiceProvider);

    return Stack(
      children: [
        BackdropImage(
          imgUrl: imageService.getImageUrl(
            size: BackdropSizes.original.name,
            path: image,
          ),
          placeholderIcon: const Icon(Icons.movie),
        ),
        _TitleText(title: title),
        const _PlayIcon(),
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

class _PlayIcon extends StatelessWidget {
  const _PlayIcon();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.play_circle_outline,
                color: Theme.of(context).colorScheme.primary,
                size: 70,
              ),
            ],
          )
        ],
      ),
    );
  }
}

class _TitleText extends StatelessWidget {
  const _TitleText({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30, left: 10, right: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 190,
            child: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
              textAlign: TextAlign.left,
            ),
          )
        ],
      ),
    );
  }
}
