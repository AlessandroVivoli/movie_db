import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../core/extensions/build_context_extensions.dart';
import '../../../../../core/widgets/error_text/error_text.dart';
import '../../../../../core/widgets/movie_card/movie_card.dart';
import '../../../../../features/account/provider/watchlist/get_movie_watchlist_provider.dart';
import '../../../../../features/movies/domain/poster_sizes_enum.dart';
import '../../../../../features/movies/provider/images/movie_image_service_provider.dart';
import '../../../../../routing/routes.dart';

class MovieWatchlistTab extends HookConsumerWidget {
  const MovieWatchlistTab({
    super.key,
    required this.page,
    required this.maxPage,
  });

  final ValueNotifier<int> page;
  final ValueNotifier<int> maxPage;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentPage = useValueListenable(page);

    final movieList = ref.watch(getMovieWatchlistProvider(page: currentPage));
    final imageService = ref.watch(movieImageServiceProvider);

    ref.listen(
      getMovieWatchlistProvider(page: currentPage),
      (previous, next) {
        next.whenData((value) => maxPage.value = value.totalPages);
      },
    );

    return movieList.when(
      data: (data) {
        if (data.totalResults == 0) {
          return Center(
            child: Text(context.locale.noMovieWatchlist),
          );
        }

        return Align(
          alignment: Alignment.topCenter,
          child: SingleChildScrollView(
            child: Wrap(
                verticalDirection: VerticalDirection.down,
                alignment: WrapAlignment.start,
                spacing: 10,
                runSpacing: 10,
                children: [
                  ...data.results.map(
                    (movie) => ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 80),
                      child: MovieCard(
                        ratingSize: 12,
                        ratingDigitSpacing: 15,
                        ratingSpacing: .5,
                        ratingAlignment: MainAxisAlignment.start,
                        imageUrl: imageService.getMediaPosterUrl(
                          size: PosterSizes.w154,
                          path: movie.posterPath,
                        ),
                        showRatingNum: false,
                        onTap: () => Navigator.pushNamed(
                          context,
                          AppRoute.movie,
                          arguments: movie.id,
                        ),
                        adult: movie.adult,
                        title: movie.title,
                        voteAverage: movie.voteAverage,
                      ),
                    ),
                  ),
                ]),
          ),
        );
      },
      error: (error, stackTrace) {
        context.showErrorSnackBar(context.locale.getMovieWatchlistError);

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
