import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/models/movie/details/movie_details.dart';
import '../../../../core/providers/image_provider.dart';
import '../../../../utils/enums.dart';
import '../../../shared/widgets/backdrop_image/backdrop_image.dart';

class MovieDetailsBackdrop extends ConsumerWidget {
  final MovieDetails details;

  const MovieDetailsBackdrop({super.key, required this.details});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imageService = ref.watch(imageServiceProvider);

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
          imgUrl: imageService.getImageUrl(
            size: BackdropSizes.original.name,
            path: details.backdropPath,
          ),
          placeholderIcon: const Icon(
            Icons.movie,
            size: 100,
          ),
        ),
      ),
    );
  }
}
