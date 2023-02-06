import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../../../features/auth/provider/auth_provider.dart';
import '../../../../../../core/extensions/build_context_extensions.dart';
import '../../../../../../core/widgets/errors/error_text.dart';
import '../../../../../../features/account/provider/favorite_movies/add_movie_to_favorites_provider.dart';

class FavoriteButton extends ConsumerWidget {
  const FavoriteButton({
    super.key,
    required this.favorite,
    required this.movieId,
  });

  final bool favorite;
  final int movieId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authProvider);

    final loading = ref
        .watch(favoritesProvider)
        .maybeWhen(loading: () => true, orElse: () => false);

    final localization = AppLocalizations.of(context)!;

    ref.listen(
      favoritesProvider,
      (previous, next) {
        next.whenOrNull(
          error: (error, stackTrace) {
            context.showErrorSnackBar(
              !favorite
                  ? localization.addFavoriteError
                  : localization.removeFavoriteError,
            );
          },
        );
      },
    );

    return user.maybeWhen(
      loggedIn: (user) => IconButton(
        onPressed: loading
            ? null
            : () async {
                ref
                    .read(favoritesProvider.notifier)
                    .addMovieToFavorites(movieId: movieId, favorite: !favorite);
              },
        icon: FaIcon(
          (favorite) ? FontAwesomeIcons.solidHeart : FontAwesomeIcons.heart,
          color:
              (favorite) ? Colors.pink : Theme.of(context).colorScheme.primary,
        ),
      ),
      orElse: () => ErrorText(localization.notLoggedInErrorMessage),
    );
  }
}
