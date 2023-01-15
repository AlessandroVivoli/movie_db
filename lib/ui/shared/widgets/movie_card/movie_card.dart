import 'package:flutter/material.dart';

import '../../../../core/models/movie/movie.dart';
import '../../../../core/services/image_service.dart';
import '../../../../core/services/movie_service.dart';
import '../../../../utils/enums.dart';
import '../../../../utils/routes.dart';
import '../custom_image/custom_network_image.dart';
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
          Navigator.pushNamed(
            context,
            AppRoute.movie,
            arguments: MovieService.getMovieDetails(id: movie.id),
          );
        },
        child: Column(
          mainAxisAlignment: (movie.posterPath != null)
              ? MainAxisAlignment.spaceBetween
              : MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: CustomNetworkImage(
                    url: ImageService.getImageUrl(
                        size: PosterSizes.w500.name, path: movie.posterPath),
                    placeholderIcon: const Icon(Icons.movie),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 5),
                    child: Text(
                      '${movie.title}',
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
