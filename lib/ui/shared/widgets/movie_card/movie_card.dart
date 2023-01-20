import 'package:flutter/material.dart';

import '../../../../core/models/movie/movie.dart';
import '../../../../core/services/image_service.dart';
import '../../../../utils/enums.dart';
import '../../../../utils/routes.dart';
import '../custom_image/custom_network_image.dart';
import '../rating/rating.dart';
import '../stroke_text/stroke_text.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;

  final void Function()? onReturn;
  final bool refreshOnReturn;

  const MovieCard({
    super.key,
    required this.movie,
    this.onReturn,
    this.refreshOnReturn = false,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 120),
      child: GestureDetector(
        onTap: () async {
          await Navigator.pushNamed(
            context,
            AppRoute.movie,
            arguments: movie.id,
          );

          if (onReturn != null) {
            onReturn!();
          }
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surface,
                      ),
                      child: Center(
                        child: CustomNetworkImage(
                          url: ImageService.getImageUrl(
                            size: PosterSizes.w500.name,
                            path: movie.posterPath,
                          ),
                          placeholderIcon: const Icon(
                            Icons.movie,
                            size: 50,
                          ),
                        ),
                      ),
                    ),
                    if (movie.adult)
                      const Positioned(
                        top: 8,
                        right: 8,
                        child: StrokeText('18+'),
                      ),
                  ],
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
                      overflow: TextOverflow.ellipsis,
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
