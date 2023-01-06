import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/models/movie/movie.dart';
import '../../../../core/services/image_service.dart';
import '../../../../utils/enums.dart';
import '../rating/rating.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;

  const MovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 120),
      child: GestureDetector(
        onTap: () {
          // TODO: Add redirect to movie details page
        },
        child: Column(
          mainAxisAlignment: (movie.posterPath != null)
              ? MainAxisAlignment.spaceBetween
              : MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (movie.posterPath != null)
              Expanded(
                child: Image(
                  image: ImageService.getImage(
                    size: PosterSizes.w500.name,
                    path: movie.posterPath!,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 10, bottom: 5),
                    child: Text(
                      movie.title,
                      overflow: (movie.posterPath != null)
                          ? TextOverflow.ellipsis
                          : TextOverflow.visible,
                    ),
                  ),
                  Rating(
                    rating: movie.voteAverage,
                    size: 12,
                    padding: 1,
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
