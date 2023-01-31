import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../../../../core/models/movie/movie_user_action_arguments.dart';
import '../../../../../../../../core/providers/auth_provider.dart';
import '../../../../../../../../core/providers/movie_provider.dart';
import '../../../../../../../../utils/extensions.dart';
import '../../../../../../../shared/widgets/errors/error_text.dart';

class WatchlistButton extends ConsumerWidget {
  const WatchlistButton({
    super.key,
    required this.movieId,
    required this.watchlist,
  });

  final int movieId;
  final bool watchlist;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authProvider);

    return user.maybeWhen(
      loggedIn: (user) => IconButton(
        icon: Icon(
          (watchlist) ? Icons.bookmark_added : Icons.bookmark_add_outlined,
          size: 30,
          color: (watchlist)
              ? Theme.of(context).colorScheme.primary
              : Colors.white,
        ),
        onPressed: () {
          ref
              .read(
                addMovieToWatchlistProvider(
                  MovieUserActionArguments(
                    user: user,
                    movieId: movieId,
                    action: !watchlist,
                  ),
                ),
              )
              .whenOrNull(
                error: (error, stackTrace) => context.showErrorSnackBar(
                  (watchlist)
                      ? 'Could not remove movie from watchlist.'
                      : 'Could not add movie to watchlist',
                ),
              );
        },
      ),
      orElse: () => const ErrorText('You\'re not logged in.'),
    );
  }
}
