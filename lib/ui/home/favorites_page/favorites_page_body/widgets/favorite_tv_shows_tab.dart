import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../core/extensions/build_context_extensions.dart';
import '../../../../../core/widgets/error_text/error_text.dart';
import '../../../../../core/widgets/tv_card/tv_card.dart';
import '../../../../../features/account/provider/favorites/get_favorite_tv_shows_provider.dart';
import '../../../../../features/movies/domain/poster_sizes_enum.dart';
import '../../../../../features/tv_shows/provider/tv_image_service_provider.dart';
import '../../../../../routing/routes.dart';

class FavoriteTVShowsTab extends HookConsumerWidget {
  const FavoriteTVShowsTab({
    super.key,
    required this.page,
    required this.maxPage,
  });

  final ValueNotifier<int> page;
  final ValueNotifier<int> maxPage;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentPage = useValueListenable(page);

    final tvList = ref.watch(getFavoriteTVShowsProvider(page: currentPage));
    final imageService = ref.watch(tvImageServiceProvider);

    ref.listen(
      getFavoriteTVShowsProvider(page: currentPage),
      (previous, next) {
        next.whenData((value) => maxPage.value = value.totalPages);
      },
    );

    return tvList.when(
      data: (data) {
        if (data.totalResults == 0) {
          return Center(
            child: Text(context.locale.noFavoriteTVShows),
          );
        }

        return Wrap(
          alignment: WrapAlignment.start,
          spacing: 10,
          runSpacing: 10,
          children: [
            ...data.results.map(
              (tvShow) => ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 80),
                child: TVCard(
                  ratingSize: 12,
                  ratingDigitSpacing: 15,
                  ratingSpacing: .5,
                  ratingAlignment: MainAxisAlignment.start,
                  imageUrl: imageService.getMediaPosterUrl(
                    size: PosterSizes.w154,
                    path: tvShow.posterPath,
                  ),
                  showRatingNum: false,
                  adult: tvShow.adult,
                  name: tvShow.name,
                  voteAverage: tvShow.voteAverage,
                  onTap: () => Navigator.pushNamed(
                    context,
                    AppRoute.tv,
                    arguments: tvShow.id,
                  ),
                ),
              ),
            ),
          ],
        );
      },
      error: (error, stackTrace) {
        maxPage.value = 0;

        context.showErrorSnackBar(context.locale.getFavoriteTVShowError);

        return Center(
          child: ErrorText(context.locale.unexpectedErrorMessage),
        );
      },
      loading: () {
        maxPage.value = 0;

        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
