import 'package:flutter/material.dart';
import 'package:movie_db/ui/pages/home/carousel/carousel_item.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Carousel extends StatefulWidget {
  final List<String> images;
  final double? height;

  const Carousel({super.key, required this.images, this.height});

  @override
  State<StatefulWidget> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
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
    return Stack(
      children: [
        SizedBox(
          height: widget.height ?? 250,
          child: PageView.builder(
            controller: _controller,
            itemCount: widget.images.length,
            pageSnapping: true,
            itemBuilder: (context, pagePosition) {
              return CarouselItem(image: widget.images[pagePosition]);
            },
          ),
        ),
        SizedBox(
          height: widget.height ?? 250,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                child: Center(
                  child: SmoothPageIndicator(
                    controller: _controller,
                    count: widget.images.length,
                    onDotClicked: (index) => _controller.animateToPage(
                      index,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeOutCubic,
                    ),
                    effect: WormEffect(
                      dotColor: Theme.of(context).colorScheme.secondary,
                      activeDotColor: Theme.of(context).colorScheme.primary,
                      dotHeight: 6,
                      dotWidth: 6,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
