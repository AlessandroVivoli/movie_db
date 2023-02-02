import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../core/shared/widgets/errors/error_text.dart';
import '../../../../../core/shared/widgets/paged_movie_list/paged_movie_list.dart';
import '../../../../../core/utils/extensions.dart';
import '../../../../../features/auth/domain/user.dart';
import '../../../../features/movies/domain/user_movie_arguments.dart';
import '../../../../features/movies/provider/rated_movies/get_rated_movies_provider.dart';

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
            'Rated Movies',
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
      getRatedMoviesProvider(
        UserMovieArguments(
          user: user,
          page: page.value,
        ),
      ),
    );

    return ratedMovies.when(
      data: (movies) {
        if (movies.totalResults == 0) {
          return const Center(
            child: Text('Nothing found.'),
          );
        }

        return PagedMovieList(
          movieList: movies,
          onPageChanged: (index) {
            page.value = index;
          },
        );
      },
      error: (error, stackTrace) {
        context.showErrorSnackBar('Could not get rated movies.');

        return const Center(
          child: ErrorText('Something went wrong.'),
        );
      },
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
