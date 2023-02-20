import 'package:flutter/material.dart';

import '../../../../core/extensions/build_context_extensions.dart';
import '../../../../core/widgets/tv_season_card/tv_season_card.dart';
import '../../../../features/tv_shows/domain/seasons/tv_season.dart';

class TVSeasonList extends StatelessWidget {
  const TVSeasonList({
    super.key,
    required this.seasons,
    required this.showName,
  });

  final List<TVSeason> seasons;
  final String showName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            context.locale.seasonsLabel.toUpperCase(),
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
