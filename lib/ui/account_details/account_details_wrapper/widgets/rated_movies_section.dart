import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../features/auth/domain/user.dart';
import '../../../../core/extensions/build_context_extensions.dart';
import '../../../../core/widgets/error_text/error_text.dart';
import '../../../../core/widgets/paged_movie_list/paged_movie_list.dart';
import '../../../../features/account/provider/get_rated_movies_provider.dart';
import '../../../../features/movies/domain/poster_sizes_enum.dart';
import '../../../../features/movies/provider/images/movie_image_service_provider.dart';
import '../../../../routing/routes.dart';

class RatedMoviesSection extends StatelessWidget {
  const RatedMoviesSection({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.locale.ratedMoviesSectionTitle,
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 5),
          SizedBox(
            height: 290,
            child: _RatedMoviesHookWidget(
              user: user,
            ),
          ),
        ],
      ),
    );
  }
}

class _RatedMoviesHookWidget extends HookConsumerWidget {
  const _RatedMoviesHookWidget({
    required this.user,
  });

  final User user;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final page = useState(1);

    final ratedMovies = ref.watch(
      getRatedMoviesProvider(page: page.value),
    );

    final imageService = ref.watch(movieImageServiceProvider);

    return ratedMovies.when(
      data: (movies) {
        final results = movies.results;

        if (movies.totalResults == 0) {
          return Center(
            child: Text(context.locale.noRated),
          );
        }

        return PagedMovieList(
          onPageChanged: (index) {
            page.value = index;
          },
          imageBuilder: (index) => imageService.getMediaPosterUrl(
            size: PosterSizes.w154,
            path: results[index].posterPath,
          ),
          onCardTap: (index) => Navigator.pushNamed(
            context,
            AppRoute.movie,
            arguments: results[index].id,
          ),
          length: results.length,
          averageVoteBuilder: (index) => results[index].voteAverage,
          isAdultBuilder: (index) => results[index].adult,
          titleBuilder: (index) => results[index].title,
          page: movies.page,
          totalPages: movies.totalPages,
        );
      },
      error: (error, stackTrace) {
        context.showErrorSnackBar(context.locale.getRatedError);

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
