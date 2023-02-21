import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/widgets/backdrop_image/backdrop_image.dart';
import '../../../core/widgets/custom_image/custom_network_image.dart';
import '../../../features/image/provider/image_service_provider.dart';

class ImageCarouselItem extends ConsumerWidget {
  final String image;

  const ImageCarouselItem({super.key, required this.image});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imageService = ref.watch(imageServiceProvider);

    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return Dialog(
              backgroundColor: Colors.transparent,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: AspectRatio(
                  aspectRatio: 2 / 3,
                  child: InteractiveViewer(
                    maxScale: 4,
                    child: CustomNetworkImage(
                      placeholder: const Icon(Icons.person),
                      url: imageService.getImageUrl(path: image),
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
      child: BackdropImage(
        imgUrl: imageService.getImageUrl(path: image),
        placeholderIcon: const Icon(Icons.person),
      ),
    );
  }
}
