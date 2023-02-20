import 'package:flutter/material.dart';

import '../../core/extensions/build_context_extensions.dart';
import '../../core/widgets/genre_list/genre_list.dart';
import '../../features/genre/domain/genre.dart';

class MediaGenres extends StatelessWidget {
  const MediaGenres({
    super.key,
    required this.genres,
  });

  final List<Genre> genres;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Text(
            context.locale.genresSectionTitle.toUpperCase(),
            style: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 20),
          child: GenreList(genres: genres),
        ),
      ],
    );
  }
}
