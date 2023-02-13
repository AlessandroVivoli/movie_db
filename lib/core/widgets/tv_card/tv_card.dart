import 'package:flutter/material.dart';

import '../../../features/tv_shows/domain/tv_show.dart';
import '../../../routing/routes.dart';
import 'widgets/tv_card_wrapper.dart';

class TVCard extends StatelessWidget {
  final TVShow tvShow;

  const TVCard({super.key, required this.tvShow});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 120),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(
            context,
            AppRoute.tv,
            arguments: tvShow.id,
          );
        },
        child: TVCardWrapper(tvShow: tvShow),
      ),
    );
  }
}
