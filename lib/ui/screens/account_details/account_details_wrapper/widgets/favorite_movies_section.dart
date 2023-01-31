import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../core/models/movie/user_movie_arguments.dart';
import '../../../../../core/models/user/user.dart';
import '../../../../../core/providers/movie_provider.dart';
import '../../../../../utils/extensions.dart';
import '../../../../shared/widgets/errors/error_text.dart';
import '../../../../shared/widgets/paged_movie_list/paged_movie_list.dart';

class FavoriteMoviesSection extends StatelessWidget {
  const FavoriteMoviesSection({
    super.key,
    required this.user,
    this.onReturn,
  });

  final User user;
  final void Function()? onReturn;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Favorite Movies',
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 290,
            child: _FavoriteMoviesHookBuilder(
              user: user,
              onReturn: onReturn,
            ),
          ),
        ],
      ),
    );
  }
}

class _FavoriteMoviesHookBuilder extends HookConsumerWidget {
  const _FavoriteMoviesHookBuilder({
    required this.user,
    required this.onReturn,
  });

  final User user;
  final void Function()? onReturn;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final page = useState(1);

    return Consumer(
      builder: (context, ref, child) {
        final favoriteMovies = ref.watch(
          getFavoriteMoviesProvider(
            UserMovieArguments(
              user: user,
              page: page.value,
            ),
          ),
        );

        return favoriteMovies.when(
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
              refreshOnReturn: true,
              onReturn: onReturn,
            );
          },
          error: (error, stackTrace) {
            context.showErrorSnackBar('Could not get favorite movies.');

            return const Center(
              child: ErrorText('Something went wrong.'),
            );
          },
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
