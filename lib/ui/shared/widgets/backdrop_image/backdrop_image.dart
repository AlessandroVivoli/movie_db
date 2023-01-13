import 'package:flutter/material.dart';

import '../../../../core/services/image_service.dart';
import '../../../../utils/enums.dart';
import '../custom_image/custom_network_image.dart';

class BackdropImage extends StatelessWidget {
  final String? imgUrl;

  const BackdropImage({super.key, required this.imgUrl});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomNetworkImage(
          url: ImageService.getImageUrl(
            size: BackdropSizes.w1280.name,
            path: imgUrl,
          ),
          placeholderIcon: const Icon(Icons.movie),
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Theme.of(context).colorScheme.background,
                Colors.transparent
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              stops: const [0, .5],
            ),
          ),
        ),
      ],
    );
  }
}
