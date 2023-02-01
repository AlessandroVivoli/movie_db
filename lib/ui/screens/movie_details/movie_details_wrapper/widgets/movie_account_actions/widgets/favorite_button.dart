import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../../../core/models/movie/movie_user_action_arguments.dart';
import '../../../../../../../core/providers/auth/auth_provider.dart';
import '../../../../../../../core/providers/movie/favorite_movies/add_movie_to_favorites_provider.dart';
import '../../../../../../../utils/extensions.dart';
import '../../../../../../shared/widgets/errors/error_text.dart';

class FavoriteButton extends HookConsumerWidget {
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

    final controller = useAnimationController(
      duration: const Duration(milliseconds: 250),
      lowerBound: .15,
      upperBound: .6,
    );

    controller.forward();
    controller.stop();

    final animation = useMemoized(
      () => CurvedAnimation(
        parent: controller,
        curve: Curves.elasticOut,
      ),
    );

    return user.maybeWhen(
      loggedIn: (user) => IconButton(
        onPressed: () {
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
        icon: ScaleTransition(
          scale: animation,
          child: FaIcon(
            buildIcon(favorite),
            color: buildColor(favorite, context),
          ),
        ),
      ),
      orElse: () => const ErrorText('You\'re not logged in.'),
    );
  }

  IconData? buildIcon(bool favorite) {
    return (favorite) ? FontAwesomeIcons.solidHeart : FontAwesomeIcons.heart;
  }

  Color? buildColor(bool favorite, BuildContext context) {
    return (favorite) ? Colors.pink : Theme.of(context).colorScheme.primary;
  }
}
