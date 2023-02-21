import 'package:flutter/material.dart';

import '../../../features/tv_shows/domain/seasons/tv_season.dart';
import '../../extensions/build_context_extensions.dart';
import '../custom_image/custom_network_image.dart';

class TVSeasonCard extends StatelessWidget {
  const TVSeasonCard({
    super.key,
    required this.season,
    required this.showName,
    required this.imageUrl,
    this.onTap,
  });

  final TVSeason season;
  final String showName;
  final String? imageUrl;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final matches = RegExp(r'\w+').allMatches(showName).map((e) => e[0]?[0]);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: GestureDetector(
        onTap: onTap,
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
                    url: imageUrl,
                    placeholder: Text(matches.join('').toUpperCase()),
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
                      '${context.locale.seasonLabel(1)} ${season.seasonNumber}',
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
