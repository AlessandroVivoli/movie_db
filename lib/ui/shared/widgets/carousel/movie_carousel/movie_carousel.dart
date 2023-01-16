import 'package:flutter/material.dart';

import '../../../../../core/models/movie/movie.dart';
import '../carousel_active_dot/carousel_active_dot.dart';
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
      height: widget.height,
      child: Stack(
        children: [
          PageView.builder(
            controller: _controller,
            itemCount: widget.movies.length,
            pageSnapping: true,
            itemBuilder: (context, index) {
              return MovieCarouselItem(
                image: widget.movies[index].backdropPath,
                title: widget.movies[index].title!,
                id: widget.movies[index].id,
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
          CarouselActiveDot(
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
