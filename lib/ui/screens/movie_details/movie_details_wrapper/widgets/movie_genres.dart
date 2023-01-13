import 'package:flutter/material.dart';

import '../../../../../core/models/movie/details/movie_details.dart';
import '../../../../shared/widgets/genre_list/genre_list.dart';

class MovieGenres extends StatelessWidget {
  const MovieGenres({
    Key? key,
    required this.details,
  }) : super(key: key);

  final MovieDetails details;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 10),
          child: Text(
            'Genres'.toUpperCase(),
            style: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 20),
          child: GenreList(genres: details.genres!),
        ),
      ],
    );
  }
}
