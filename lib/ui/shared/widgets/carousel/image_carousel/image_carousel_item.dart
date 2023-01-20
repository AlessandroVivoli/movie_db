import 'package:flutter/material.dart';

import '../../../../../core/services/image_service.dart';
import '../../../../../utils/enums.dart';
import '../../backdrop_image/backdrop_image.dart';
import '../../custom_image/custom_network_image.dart';

class ImageCarouselItem extends StatelessWidget {
  final String image;

  const ImageCarouselItem({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
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
                      placeholderIcon: const Icon(Icons.person),
                      url: ImageService.getImageUrl(
                        size: ProfileSizes.original.name,
                        path: image,
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
      child: BackdropImage(
        imgUrl: ImageService.getImageUrl(
          size: BackdropSizes.original.name,
          path: image,
        ),
        placeholderIcon: const Icon(Icons.person),
      ),
    );
  }
}
