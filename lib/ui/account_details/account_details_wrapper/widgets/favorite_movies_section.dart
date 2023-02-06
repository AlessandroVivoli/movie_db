import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../features/auth/domain/user.dart';
import '../../../../core/extensions/build_context_extensions.dart';
import '../../../../core/widgets/errors/error_text.dart';
import '../../../../core/widgets/paged_movie_list/paged_movie_list.dart';
import '../../../../features/movies/provider/favorite_movies/get_favorite_movies_provider.dart';

class FavoriteMoviesSection extends StatelessWidget {
  const FavoriteMoviesSection({
    super.key,
    required this.user,
  });

  final User user;

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            localization.favoriteMoviesSectionTitle,
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
          getFavoriteMoviesProvider(user: user, page: page.value),
        );

        final localization = AppLocalizations.of(context)!;

        return favoriteMovies.when(
          data: (movies) {
            if (movies.totalResults == 0) {
              return Center(
                child: Text(localization.noFavorites),
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
            context.showErrorSnackBar(localization.getFavoritesError);

            return Center(
              child: ErrorText(localization.unexpectedErrorMessage),
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
