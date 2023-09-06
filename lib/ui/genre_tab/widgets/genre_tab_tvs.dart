import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/extensions/build_context_extensions.dart';
import '../../../core/widgets/error_text/error_text.dart';
import '../../../core/widgets/tv_list/tv_list.dart';
import '../../../features/media/domain/media_arguments.dart';
import '../../../features/movies/domain/poster_sizes_enum.dart';
import '../../../features/tv_shows/provider/get_tv_shows_provider.dart';
import '../../../features/tv_shows/provider/tv_image_service_provider.dart';
import '../../../routing/routes.dart';

class GenreTabTvs extends ConsumerWidget {
  const GenreTabTvs({
    super.key,
    this.includeAdult = false,
    required this.genreId,
  });

  final bool includeAdult;
  final int genreId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tvList = ref.watch(
      getTVShowsProvider(
        MediaArguments(
          withGenres: [genreId],
          includeAdult: includeAdult,
        ),
      ),
    );

    final imageService = ref.watch(tvImageServiceProvider);

    return tvList.when(
      data: (tvs) {
        if (tvs.isEmpty) {
          return Center(
            child: Text(context.locale.noPopularTVShows),
          );
        }

        return TVList(
          padding: 10,
          imageBuilder: (index) => imageService.getMediaPosterUrl(
            size: PosterSizes.w154,
            path: tvs[index].posterPath,
          ),
          onCardTap: (index) => Navigator.pushNamed(
            context,
            AppRoute.tv,
            arguments: tvs[index].id,
          ),
          averageVoteBuilder: (index) => tvs[index].voteAverage,
          isAdultBuilder: (index) => tvs[index].adult,
          nameBuilder: (index) => tvs[index].name,
          length: tvs.length,
        );
      },
      error: (error, stackTrace) {
        context.showErrorSnackBar(context.locale.popularTVShowsError);

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
