import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../features/auth/domain/user.dart';
import '../../../../core/extensions/build_context_extensions.dart';
import '../../../../core/widgets/error_text/error_text.dart';
import '../../../../core/widgets/paged_movie_list/paged_movie_list.dart';
import '../../../../features/account/provider/favorites/get_favorite_movies_provider.dart';

class FavoriteMoviesSection extends StatelessWidget {
  const FavoriteMoviesSection({
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
            context.locale.favoriteMoviesSectionTitle,
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
  });

  final User user;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final page = useState(1);

    return Consumer(
      builder: (context, ref, child) {
        final favoriteMovies = ref.watch(
          getFavoriteMoviesProvider(page: page.value),
        );

        return favoriteMovies.when(
          data: (movies) {
            if (movies.totalResults == 0) {
              return Center(
                child: Text(context.locale.noFavorites),
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
            context.showErrorSnackBar(context.locale.getFavoritesError);

            return Center(
              child: ErrorText(context.locale.unexpectedErrorMessage),
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
