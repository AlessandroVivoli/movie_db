import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../core/models/movie/details/movie_details.dart';
import '../../../shared/widgets/backdrop_image/backdrop_image.dart';

class MovieDetailsBackdrop extends StatelessWidget {
  final MovieDetails details;

  const MovieDetailsBackdrop({super.key, required this.details});

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;

    return SliverAppBar(
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
      pinned: true,
      expandedHeight: 250,
      flexibleSpace: FlexibleSpaceBar(
        title: SizedBox(
          height: 20,
          width: (orientation == Orientation.portrait) ? 200 : 400,
          child: Center(
            child: Text(
              details.originalTitle ?? '',
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ),
        ),
        centerTitle: true,
        background: BackdropImage(
          imgUrl: details.backdropPath,
          placeholderIcon: const Icon(
            Icons.movie,
            size: 100,
          ),
        ),
      ),
    );
  }
}
