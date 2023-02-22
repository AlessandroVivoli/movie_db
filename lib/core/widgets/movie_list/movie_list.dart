import 'package:flutter/material.dart';

import '../../../features/movies/domain/movie.dart';
import '../movie_card/movie_card.dart';

class MovieList extends StatelessWidget {
  final List<Movie> movieList;
  final double padding;
  final ScrollController? controller;
  final double seperatorSize;
  final String? Function(String? imagePath) imageBuilder;
  final void Function(int movieId)? onCardTap;

  const MovieList({
    super.key,
    required this.movieList,
    this.padding = 0,
    this.seperatorSize = 10,
    this.controller,
    required this.imageBuilder,
    this.onCardTap,
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
        return LimitedBox(
          maxWidth: 117,
          child: MovieCard(
            movie: movieList[index],
            imageUrl: imageBuilder(movieList[index].posterPath),
            onTap: () =>
                onCardTap != null ? onCardTap!(movieList[index].id) : null,
          ),
        );
      },
    );
  }
}
