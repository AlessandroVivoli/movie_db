import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../../core/extensions.dart';
import '../../../../../../../features/auth/provider/auth_provider.dart';
import '../../../../../../core/widgets/errors/error_text.dart';
import '../../../../../../features/movies/domain/movie_user_action_arguments.dart';
import '../../../../../../features/movies/provider/favorite_movies/add_movie_to_favorites_provider.dart';

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

    return user.maybeWhen(
      loggedIn: (user) => IconButton(
        onPressed: () async {
          ref
              .read(
                addMovieToFavoritesProvider(
                  MovieUserActionArguments(
                    user: user,
                    movieId: movieId,
                    action: !favorite,
                  ),
                ),
              )
              .whenOrNull(
                error: (_, __) => context.showErrorSnackBar(
                  (favorite)
                      ? 'Could not remove movie from favorites.'
                      : 'Could not add movie to favorites.',
                ),
              );
        },
        icon: FaIcon(
          (favorite) ? FontAwesomeIcons.solidHeart : FontAwesomeIcons.heart,
          color:
              (favorite) ? Colors.pink : Theme.of(context).colorScheme.primary,
        ),
      ),
      orElse: () => const ErrorText('You\'re not logged in.'),
    );
  }
}
