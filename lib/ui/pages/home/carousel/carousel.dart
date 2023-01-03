import 'package:flutter/material.dart';
import 'package:movie_db/core/models/movie/movie.dart';
import 'package:movie_db/core/services/movie_service.dart';
import 'package:movie_db/ui/pages/home/carousel/carousel_item.dart';

class Carousel extends StatefulWidget {
  final List<Movie> movies;
  final double? height;

  const Carousel({super.key, this.height, required this.movies});

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
          child: FutureBuilder(
            future: MovieService.getPopularMovies(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return PageView.builder(
                    controller: _controller,
                    itemCount: widget.movies.length,
                    pageSnapping: true,
                    itemBuilder: (context, pagePosition) {
                      return CarouselItem(
                        image: widget.movies[pagePosition].backdropPath ?? "",
                        title: widget.movies[pagePosition].title,
                      );
                    });
              }

              return const Center(
                child: CircularProgressIndicator(),
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
        _ActiveDot(controller: _controller, length: widget.movies.length),
      ],
    );
  }
}

class _ActiveDot extends StatefulWidget {
  final PageController controller;
  final int length;

  const _ActiveDot({
    Key? key,
    required this.controller,
    required this.length,
  }) : super(key: key);

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
    return Positioned(
      bottom: 7,
      left: ((MediaQuery.of(context).size.width / 2) -
              ((5 * 2 + 3 * 2.0) * widget.length)) +
          (8 + (5 * 2 + 3 * 2) * _activePage),
      width: (5 * 2 + 3 * 2.0) * widget.length,
      child: CircleAvatar(
        radius: 3,
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
    );
  }
}
