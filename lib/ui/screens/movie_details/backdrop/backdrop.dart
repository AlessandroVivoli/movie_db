import 'package:flutter/material.dart';

import '../../../../core/models/movie/details/movie_details.dart';
import '../../../shared/widgets/backdrop_image/backdrop_image.dart';

class MovieDetailsBackdrop extends StatelessWidget {
  final MovieDetails details;

  const MovieDetailsBackdrop({super.key, required this.details});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      expandedHeight: 250,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          details.originalTitle ?? '',
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
        centerTitle: true,
        background: BackdropImage(
          imgUrl: details.backdropPath,
        ),
      ),
    );
  }
}
