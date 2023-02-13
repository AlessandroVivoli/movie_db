import 'package:flutter/material.dart';

import '../../trending_persons_section.dart';
import 'widgets/top_rated_tvs_section.dart';

class TVsHomeWrapper extends StatelessWidget {
  const TVsHomeWrapper({super.key});

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
          TopRatedTVsSection(),
        ],
      ),
    );
  }
}
