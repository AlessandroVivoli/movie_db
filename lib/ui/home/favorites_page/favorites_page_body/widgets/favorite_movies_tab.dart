import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../core/extensions/build_context_extensions.dart';
import '../../../../../core/widgets/error_text/error_text.dart';
import '../../../../../core/widgets/movie_card/movie_card.dart';
import '../../../../../features/account/provider/favorites/get_favorite_movies_provider.dart';
import '../../../../../features/movies/domain/poster_sizes_enum.dart';
import '../../../../../features/movies/provider/images/movie_image_service_provider.dart';
import '../../../../../routing/routes.dart';
import '../../../paginator/paginator.dart';

class FavoriteMoviesTab extends HookConsumerWidget {
  const FavoriteMoviesTab({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final page = useState(1);
    final maxPage = useValueNotifier(1);

    final movieProvider = getFavoriteMoviesProvider(page: page.value);

    ref.listen(movieProvider, (previous, next) {
      next.maybeWhen(
        data: (value) => maxPage.value = value.totalPages,
        orElse: () => maxPage.value = 1,
      );
    });

    final movieList = ref.watch(movieProvider);
    final imageService = ref.watch(movieImageServiceProvider);

    return Column(
      children: [
        Expanded(
          child: movieList.when(
            data: (data) {
              if (data.totalResults == 0) {
                return Center(
                  child: Text(context.locale.noFavoriteMovies),
                );
              }

              return SingleChildScrollView(
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
              );
            },
            error: (error, stackTrace) {
              context.showErrorSnackBar(context.locale.getFavoriteMoviesError);

              return Center(
                child: ErrorText(context.locale.unexpectedErrorMessage),
              );
            },
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
          ),
        ),
        Paginator(page: page, maxPage: maxPage)
      ],
    );
  }
}
