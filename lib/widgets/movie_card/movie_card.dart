import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_db/core/models/movie/movie.dart';
import 'package:movie_db/widgets/rating.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;
  final void Function()? onTap;

  const MovieCard({super.key, required this.movie, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AspectRatio(
        aspectRatio: 2 / 3,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              flex: 2,
              child: Image(
                image: NetworkImage(
                  "https://image.tmdb.org/t/p/original${movie.posterPath}",
                ),
                fit: BoxFit.cover,
              ),
            ),
            Flexible(
              flex: 1,
              child: Column(
                children: [
                  Text(movie.title),
                  Rating(
                    rating: movie.voteAverage,
                    size: 12,
                    alignment: MainAxisAlignment.center,
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
