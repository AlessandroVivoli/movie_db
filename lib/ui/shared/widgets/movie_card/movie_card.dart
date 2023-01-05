import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/models/movie/movie.dart';
import '../rating/rating.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;

  const MovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 9 / 16,
      child: GestureDetector(
        onTap: () =>
            debugPrint('${movie.id}'), // Add redirect to movie details page
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Center(
                child: Image(
                  image: NetworkImage(
                    'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 10, bottom: 5),
                    child: Text(movie.title),
                  ),
                  Rating(
                    rating: movie.voteAverage,
                    size: 12,
                    alignment: MainAxisAlignment.start,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
