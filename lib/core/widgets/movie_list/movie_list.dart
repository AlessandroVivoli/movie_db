import 'package:flutter/material.dart';

import '../../../features/movies/domain/movie.dart';
import '../movie_card/movie_card.dart';

class MovieList extends StatelessWidget {
  final List<Movie> movieList;
  final double padding;
  final ScrollController? controller;
  final double seperatorSize;

  const MovieList({
    super.key,
    required this.movieList,
    this.padding = 0,
    this.seperatorSize = 10,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      controller: controller,
      scrollDirection: Axis.horizontal,
      itemCount: movieList.length,
      padding: EdgeInsets.symmetric(horizontal: padding),
      separatorBuilder: (context, index) {
        return SizedBox(width: seperatorSize);
      },
      itemBuilder: (context, index) {
        return MovieCard(
          movie: movieList[index],
        );
      },
    );
  }
}
