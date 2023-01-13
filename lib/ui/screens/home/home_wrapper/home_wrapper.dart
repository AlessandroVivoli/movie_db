import 'package:flutter/material.dart';

import 'widgets/top_rated_movies_section.dart';
import 'widgets/trending_persons_section.dart';

class HomeWrapper extends StatelessWidget {
  const HomeWrapper({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
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
