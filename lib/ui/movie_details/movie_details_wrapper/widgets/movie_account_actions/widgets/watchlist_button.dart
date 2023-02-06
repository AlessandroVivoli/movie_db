import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../../../features/auth/provider/auth_provider.dart';
import '../../../../../../core/extensions/build_context_extensions.dart';
import '../../../../../../core/widgets/errors/error_text.dart';
import '../../../../../../features/movies/provider/movie_watchlist/add_movie_to_watchlist_provider.dart';

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

    final localization = AppLocalizations.of(context)!;

    return user.maybeWhen(
        loggedIn: (user) => IconButton(
              icon: Icon(
                (watchlist)
                    ? Icons.bookmark_added
                    : Icons.bookmark_add_outlined,
                size: 30,
                color: (watchlist)
                    ? Theme.of(context).colorScheme.primary
                    : Colors.white,
              ),
              onPressed: () {
                ref
                    .read(
                      addMovieToWatchlistProvider(
                        user: user,
                        movieId: movieId,
                        watchlist: !watchlist,
                      ),
                    )
                    .whenOrNull(
                      error: (error, stackTrace) => context.showErrorSnackBar(
                        (watchlist)
                            ? localization.removeWatchlistError
                            : localization.addWatchlistError,
                      ),
                    );
              },
            ),
        orElse: () => ErrorText(localization.notLoggedInErrorMessage));
  }
}
