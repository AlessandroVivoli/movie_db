import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/widgets/backdrop_image/backdrop_image.dart';
import '../../../features/movies/domain/backdrop_sizes_enum.dart';
import '../../../features/tv_shows/domain/tv_show_details.dart';
import '../../../features/tv_shows/provider/tv_image_service_provider.dart';

class TVDetailsBackdrop extends ConsumerWidget {
  const TVDetailsBackdrop({super.key, required this.details});

  final TVShowDetails details;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imageService = ref.watch(tvImageServiceProvider);

    return SliverAppBar(
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
      pinned: true,
      expandedHeight: 250,
      flexibleSpace: FlexibleSpaceBar(
        title: OrientationBuilder(builder: (context, orientation) {
          final width = orientation == Orientation.portrait ? 200.0 : 400.0;

          return SizedBox(
            height: 20,
            width: width,
            child: Center(
              child: Text(
                details.name,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          );
        }),
        centerTitle: true,
        background: BackdropImage(
          imgUrl: imageService.getTVBackdropUrl(
            size: BackdropSizes.original,
            path: details.backdropPath,
          ),
          placeholderIcon: const Icon(
            Icons.tv,
            size: 100,
          ),
        ),
      ),
    );
  }
}
