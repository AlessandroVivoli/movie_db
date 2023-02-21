import 'package:flutter/material.dart';

import '../../../features/tv_shows/domain/tv_show.dart';
import 'widgets/tv_card_wrapper.dart';

class TVCard extends StatelessWidget {
  final TVShow tvShow;
  final String? imageUrl;
  final void Function()? onTap;

  const TVCard(
      {super.key, required this.tvShow, this.onTap, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 120),
      child: GestureDetector(
        onTap: onTap,
        child: TVCardWrapper(tvShow: tvShow, imageUrl: imageUrl),
      ),
    );
  }
}
