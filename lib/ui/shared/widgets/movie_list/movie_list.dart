import 'package:flutter/material.dart';

import '../../../../core/models/movie/movie.dart';
import '../movie_card/movie_card.dart';

class MovieList extends StatelessWidget {
  final List<Movie> movieList;
  final double padding;

  const MovieList({super.key, required this.movieList, this.padding = 0});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: movieList.length,
      padding: EdgeInsets.symmetric(horizontal: padding),
      separatorBuilder: (context, index) {
        return const SizedBox(
          width: 10,
        );
      },
      itemBuilder: (context, index) {
        return MovieCard(
          movie: movieList[index],
        );
      },
    );
  }
}
