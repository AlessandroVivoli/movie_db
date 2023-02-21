import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/extensions/build_context_extensions.dart';
import '../../../../core/widgets/tv_season_card/tv_season_card.dart';
import '../../../../features/movies/domain/poster_sizes_enum.dart';
import '../../../../features/tv_shows/domain/seasons/tv_season.dart';
import '../../../../features/tv_shows/provider/tv_image_service_provider.dart';

class TVSeasonList extends ConsumerWidget {
  const TVSeasonList({
    super.key,
    required this.seasons,
    required this.showName,
  });

  final List<TVSeason> seasons;
  final String showName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imageService = ref.watch(tvImageServiceProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            context.locale.seasonLabel(2).toUpperCase(),
            style: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: 250,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: seasons.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: TVSeasonCard(
                    season: seasons[index],
                    showName: showName,
                    imageUrl: imageService.getMediaPosterUrl(
                      size: PosterSizes.w154,
                      path: seasons[index].posterPath,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
