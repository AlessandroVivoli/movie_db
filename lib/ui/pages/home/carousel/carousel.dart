import 'package:flutter/material.dart';
import 'package:movie_db/ui/pages/home/carousel/carousel_item.dart';

class Carousel extends StatefulWidget {
  final List<String> images;
  final double? height;

  const Carousel({super.key, required this.images, this.height});

  @override
  State<StatefulWidget> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  late final PageController _controller;
  late double _activePage;

  @override
  void initState() {
    _controller = PageController();
    _activePage = 0;

    _controller.addListener(() {
      setState(() {
        _activePage = _controller.page ?? 0;
      });
    });

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
        AspectRatio(
          aspectRatio: 16 / 9,
          child: PageView.builder(
            controller: _controller,
            itemCount: widget.images.length,
            pageSnapping: true,
            itemBuilder: (context, pagePosition) {
              return CarouselItem(
                image: widget.images[pagePosition],
                title: "Doctor Strange in the Multiverse of Madness",
              );
            },
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          height: 20,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
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
        Positioned(
          bottom: 7,
          left: ((MediaQuery.of(context).size.width / 2) -
                  ((5 * 2 + 3 * 2.0) * widget.images.length)) +
              (8 + (5 * 2 + 3 * 2) * _activePage),
          width: (5 * 2 + 3 * 2.0) * widget.images.length,
          child: CircleAvatar(
            radius: 3,
            backgroundColor: Theme.of(context).colorScheme.primary,
          ),
        ),
      ],
    );
  }
}
