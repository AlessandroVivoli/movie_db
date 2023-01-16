import 'package:flutter/material.dart';

import '../../../../../core/models/image/image_model.dart';
import '../shared/carousel_active_dot.dart';
import 'image_carousel_item.dart';

class ImageCarousel extends StatefulWidget {
  final List<ImageModel> images;
  final double? height;

  const ImageCarousel({super.key, required this.images, this.height});

  @override
  State<ImageCarousel> createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  late final PageController _controller;

  @override
  void initState() {
    _controller = PageController();

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      child: Stack(
        children: [
          PageView.builder(
            controller: _controller,
            itemCount: widget.images.length,
            pageSnapping: true,
            itemBuilder: (context, index) {
              return ImageCarouselItem(
                image: widget.images[index].filePath,
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
                widget.images.length,
                (index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: InkWell(
                    onTap: () => _controller.animateToPage(
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
            controller: _controller,
            length: widget.images.length,
            radius: 3,
            padding: 5,
          ),
        ],
      ),
    );
  }
}
