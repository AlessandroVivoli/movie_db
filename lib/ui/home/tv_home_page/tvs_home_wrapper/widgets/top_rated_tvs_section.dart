import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../core/extensions/build_context_extensions.dart';
import '../../../../../core/widgets/error_text/error_text.dart';
import '../../../../../core/widgets/tv_list/tv_list.dart';
import '../../../../../features/movies/domain/poster_sizes_enum.dart';
import '../../../../../features/tv_shows/provider/get_top_rated_tv_shows_provider.dart';
import '../../../../../features/tv_shows/provider/tv_image_service_provider.dart';

class TopRatedTVsSection extends StatelessWidget {
  const TopRatedTVsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        _TopRatedTVsText(),
        _TopRatedTVsList(),
      ],
    );
  }
}

class _TopRatedTVsText extends StatelessWidget {
  const _TopRatedTVsText();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        context.locale.topRatedTvsSectionTitle.toUpperCase(),
        style: TextStyle(
          color: Theme.of(context).colorScheme.secondary,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class _TopRatedTVsList extends ConsumerWidget {
  const _TopRatedTVsList();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final topRatedTVs = ref.watch(getTopRatedTVShowsProvider);
    final imageService = ref.watch(tvImageServiceProvider);

    return LimitedBox(
      maxHeight: 250,
      child: topRatedTVs.when(
        data: (tvs) {
          if (tvs.isEmpty) {
            return Center(
              child: Text(context.locale.noTopRatedTVShows),
            );
          }

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: TVList(
              tvList: tvs,
              imageBuilder: (imagePath) => imageService.getMediaPosterUrl(
                size: PosterSizes.w154,
                path: imagePath,
              ),
            ),
          );
        },
        error: (error, stackTrace) {
          context.showErrorSnackBar(context.locale.topRatedTVShowsError);

          return Center(
            child: ErrorText(context.locale.unexpectedErrorMessage),
          );
        },
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
