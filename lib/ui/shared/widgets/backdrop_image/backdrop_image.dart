import 'package:flutter/material.dart';

import '../../../../core/services/image_service.dart';
import '../../../../utils/enums.dart';

class BackdropImage extends StatelessWidget {
  final String imgUrl;

  const BackdropImage({super.key, required this.imgUrl});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 1),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                ImageService.getImageUrl(
                  size: BackdropSizes.original.name,
                  path: imgUrl,
                ),
              ),
              fit: BoxFit.cover,
              alignment: Alignment.center,
            ),
          ),
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
