import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
    final localization = AppLocalizations.of(context)!;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            localization.seasonsLabel.toUpperCase(),
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
