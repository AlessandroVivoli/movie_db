import 'package:flutter/material.dart';

import '../../trending_persons_section.dart';
import 'widgets/top_rated_movies_section.dart';

class MoviesHomeWrapper extends StatelessWidget {
  const MoviesHomeWrapper({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          TrendingPersonsSection(),
          TopRatedMoviesSection(),
        ],
      ),
    );
  }
}
