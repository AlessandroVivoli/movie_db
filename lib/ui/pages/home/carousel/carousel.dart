import 'package:flutter/material.dart';

import '../../../../core/models/movie/movie.dart';
import '../../../../core/services/movie_service.dart';
import 'carousel_item.dart';

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
    return SizedBox(
      height: 200,
      child: Stack(
        children: [
          FutureBuilder(
            future: MovieService.getPopularMovies(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return PageView.builder(
                  controller: _controller,
                  itemCount: widget.movies.length,
                  pageSnapping: true,
                  itemBuilder: (context, pagePosition) {
                    return CarouselItem(
                      image: widget.movies[pagePosition].backdropPath ?? '',
                      title: widget.movies[pagePosition].title,
                      id: widget.movies[pagePosition].id,
                      onTap: onTap,
                    );
                  },
                );
              }

              return const Center(
                child: CircularProgressIndicator(),
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

  void onTap(id) async {
    final data = await MovieService.getMovieDetails(id: id);
    debugPrint('$data');
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
