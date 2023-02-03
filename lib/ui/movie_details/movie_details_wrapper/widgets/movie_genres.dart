import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/widgets/genre_list/genre_list.dart';
import '../../../../features/movies/domain/movie_details.dart';

class MovieGenres extends StatelessWidget {
  const MovieGenres({
    super.key,
    required this.details,
  });

  final MovieDetails details;

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Text(
            localization.genresSectionTitle.toUpperCase(),
            style: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: GenreList(genres: details.genres),
        ),
      ],
    );
  }
}
