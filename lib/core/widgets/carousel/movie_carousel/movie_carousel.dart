import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../features/movies/domain/movie.dart';
import '../shared/carousel_active_dot.dart';
import 'movie_carousel_item.dart';

class MovieCarousel extends HookWidget {
  final List<Movie> movies;
  final double? height;

  const MovieCarousel({super.key, this.height, required this.movies});

  @override
  Widget build(BuildContext context) {
    final controller = usePageController();

    return SizedBox(
      height: height,
      child: Stack(
        children: [
          PageView.builder(
            controller: controller,
            itemCount: movies.length,
            pageSnapping: true,
            itemBuilder: (context, index) {
              return MovieCarouselItem(
                image: movies[index].backdropPath,
                title: movies[index].title!,
                id: movies[index].id,
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
                movies.length,
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
            length: movies.length,
            radius: 3,
            padding: 5,
          ),
        ],
      ),
    );
  }
}
