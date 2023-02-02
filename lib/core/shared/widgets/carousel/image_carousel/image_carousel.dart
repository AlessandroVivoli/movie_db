import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../../features/image/domain/image_model.dart';
import '../shared/carousel_active_dot.dart';
import 'image_carousel_item.dart';

class ImageCarousel extends HookWidget {
  final List<ImageModel> images;
  final double? height;

  const ImageCarousel({super.key, required this.images, this.height});

  @override
  Widget build(BuildContext context) {
    final controller = usePageController();

    return SizedBox(
      height: height,
      child: Stack(
        children: [
          PageView.builder(
            controller: controller,
            itemCount: images.length,
            pageSnapping: true,
            itemBuilder: (context, index) {
              return ImageCarouselItem(
                image: images[index].filePath,
              );
            },
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: List<Widget>.generate(
                images.length,
                (index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: InkWell(
                    onTap: () => controller.animateToPage(
                      index,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeOutCubic,
                    ),
                    child: CircleAvatar(
                      radius: 3,
                      backgroundColor: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                ),
              ),
            ),
          ),
          CarouselActiveDot(
            controller: controller,
            length: images.length,
            radius: 3,
            padding: 5,
          ),
        ],
      ),
    );
  }
}
