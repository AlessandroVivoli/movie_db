import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/extensions/build_context_extensions.dart';
import '../../../../core/widgets/error_text/error_text.dart';
import '../../../../core/widgets/tv_list/tv_list.dart';
import '../../../../features/movies/domain/poster_sizes_enum.dart';
import '../../../../features/tv_shows/provider/get_similar_tv_shows_provider.dart';
import '../../../../features/tv_shows/provider/tv_image_service_provider.dart';
import '../../../../routing/routes.dart';

class SimilarTVShowList extends StatelessWidget {
  const SimilarTVShowList({super.key, required this.tvId});

  final int tvId;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            context.locale.similarTVShowsLabel.toUpperCase(),
            style: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        SizedBox(
          height: 300,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: _SimilarTVShowsBuilder(tvId: tvId),
          ),
        )
      ],
    );
  }
}

class _SimilarTVShowsBuilder extends ConsumerWidget {
  final int tvId;

  const _SimilarTVShowsBuilder({required this.tvId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final similarTVShowsList = ref.watch(getSimilarTVShowsProvider(tvId));
    final imageService = ref.watch(tvImageServiceProvider);

    return similarTVShowsList.when(
      data: (similarTVShows) {
        if (similarTVShows.isEmpty) {
          return Center(
            child: Text(context.locale.noSimilarTVShows),
          );
        }

        return TVList(
          padding: 10,
          imageBuilder: (index) => imageService.getMediaPosterUrl(
            size: PosterSizes.w154,
            path: similarTVShows[index].posterPath,
          ),
          onCardTap: (index) => Navigator.pushNamed(
            context,
            AppRoute.tv,
            arguments: similarTVShows[index].id,
          ),
          length: similarTVShows.length,
          averageVoteBuilder: (index) => similarTVShows[index].voteAverage,
          isAdultBuilder: (index) => similarTVShows[index].adult,
          nameBuilder: (index) => similarTVShows[index].name,
        );
      },
      error: (error, stackTrace) {
        context.showErrorSnackBar(context.locale.similarTVShowsError);

        return Center(
          child: ErrorText(context.locale.unexpectedErrorMessage),
        );
      },
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
