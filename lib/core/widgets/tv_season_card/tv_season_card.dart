import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../features/movies/domain/poster_sizes_enum.dart';
import '../../../features/tv_shows/domain/seasons/tv_season.dart';
import '../../../features/tv_shows/provider/tv_image_service_provider.dart';
import '../../../routing/routes.dart';
import '../custom_image/custom_network_image.dart';

class TVSeasonCard extends ConsumerWidget {
  const TVSeasonCard({
    super.key,
    required this.season,
    required this.showName,
  });

  final TVSeason season;
  final String showName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imageService = ref.watch(tvImageServiceProvider);

    final matches = RegExp(r'\w+').allMatches(showName).map((e) => e[0]?[0]);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: GestureDetector(
        onTap: () => Navigator.pushNamed(
          context,
          AppRoute.season,
          arguments: season.id,
        ),
        child: SizedBox(
          width: 120,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: CustomNetworkImage(
                    url: imageService.getTVPosterUrl(
                      size: PosterSizes.w185,
                      path: season.posterPath,
                    ),
                    placeholderIcon: Text(matches.join('').toUpperCase()),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      showName,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      'Season ${season.seasonNumber}',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
