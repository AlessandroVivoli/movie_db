import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../features/auth/domain/user.dart';
import '../../../../core/extensions/build_context_extensions.dart';
import '../../../../core/widgets/error_text/error_text.dart';
import '../../../../core/widgets/paged_movie_list/paged_movie_list.dart';
import '../../../../features/account/provider/watchlist/get_movie_watchlist_provider.dart';
import '../../../../features/movies/domain/poster_sizes_enum.dart';
import '../../../../features/movies/provider/images/movie_image_service_provider.dart';
import '../../../../routing/routes.dart';

class WatchlistSection extends StatelessWidget {
  const WatchlistSection({
    super.key,
    required this.user,
  });

  final User user;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.locale.watchlistSectionTitle,
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 5),
          SizedBox(
            height: 290,
            child: _WatchlistHookWidget(
              user: user,
            ),
          ),
        ],
      ),
    );
  }
}

class _WatchlistHookWidget extends HookConsumerWidget {
  const _WatchlistHookWidget({
    required this.user,
  });

  final User user;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final page = useState(1);

    final movieWatchlist = ref.watch(
      getMovieWatchlistProvider(page: page.value),
    );

    final imageService = ref.watch(movieImageServiceProvider);

    return movieWatchlist.when(
      data: (movies) {
        if (movies.totalResults == 0) {
          return Center(
            child: Text(context.locale.noWatchlist),
          );
        }

        return PagedMovieList(
          movieList: movies,
          onPageChanged: (index) {
            page.value = index;
          },
          imageBuilder: (imagePath) => imageService.getMediaPosterUrl(
            size: PosterSizes.w154,
            path: imagePath,
          ),
          onCardTap: (movieId) => Navigator.pushNamed(
            context,
            AppRoute.movie,
            arguments: movieId,
          ),
        );
      },
      error: (error, stackTrace) {
        context.showErrorSnackBar(context.locale.getWatchlistError);

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
