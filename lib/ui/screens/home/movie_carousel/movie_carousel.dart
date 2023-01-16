import 'package:flutter/material.dart';

import '../../../../core/models/movie/movie.dart';
import 'movie_carousel_item.dart';

class MovieCarousel extends StatefulWidget {
  final List<Movie> movies;
  final double? height;

  const MovieCarousel({super.key, this.height, required this.movies});

  @override
  State<StatefulWidget> createState() => _MovieCarouselState();
}

class _MovieCarouselState extends State<MovieCarousel> {
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
      height: 200,
      child: Stack(
        children: [
          PageView.builder(
            controller: _controller,
            itemCount: widget.movies.length,
            pageSnapping: true,
            itemBuilder: (context, pagePosition) {
              return MovieCarouselItem(
                image: widget.movies[pagePosition].backdropPath ?? '',
                title: widget.movies[pagePosition].title!,
                id: widget.movies[pagePosition].id,
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
                widget.movies.length,
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
          _ActiveDot(
            controller: _controller,
            length: widget.movies.length,
            radius: 3,
            padding: 5,
          ),
        ],
      ),
    );
  }
}

class _ActiveDot extends StatefulWidget {
  final PageController controller;
  final int length;

  final int? radius;
  final int? padding;

  const _ActiveDot({
    Key? key,
    required this.controller,
    required this.length,
    int? radius,
    int? padding,
  })  : radius = radius ?? 3,
        padding = padding ?? 5,
        super(key: key);

  @override
  State<_ActiveDot> createState() => _ActiveDotState();
}

class _ActiveDotState extends State<_ActiveDot> {
  late double _activePage;

  @override
  void initState() {
    _activePage = 0;

    widget.controller.addListener(() {
      setState(() {
        _activePage = widget.controller.page ?? 0;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double dotComposite = (widget.padding! * 2 + widget.radius! * 2.0);
    double screenWidth = MediaQuery.of(context).size.width;
    double calculatedWidth = (screenWidth - dotComposite * widget.length);
    double startPosition = calculatedWidth / 2;

    return Positioned(
      bottom: (20 - widget.radius! * 2) / 2,
      left: startPosition + (dotComposite * _activePage),
      width: dotComposite,
      child: CircleAvatar(
        radius: widget.radius! * 1,
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
    );
  }
}
