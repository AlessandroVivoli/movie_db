import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../../../features/auth/provider/auth_provider.dart';
import '../../../../../../core/extensions/build_context_extensions.dart';
import '../../../../core/widgets/error_text/error_text.dart';
import '../../../../features/account/provider/watchlist/add_to_watchlist_provider.dart';

class WatchlistButton extends ConsumerWidget {
  const WatchlistButton({
    super.key,
    required this.watchlist,
    this.onWatchlistPressed,
  });

  final bool watchlist;
  final Function(bool watchlist)? onWatchlistPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authProvider);

    final loading = ref
        .watch(watchlistProvider)
        .maybeWhen(loading: () => true, orElse: () => false);

    ref.listen(
      watchlistProvider,
      (previous, next) {
        next.whenOrNull(
          error: (error, stackTrace) {
            context.showErrorSnackBar(
              !watchlist
                  ? context.locale.addWatchlistError
                  : context.locale.removeWatchlistError,
            );
          },
        );
      },
    );

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
              onPressed: (loading || (onWatchlistPressed == null))
                  ? null
                  : () => onWatchlistPressed!(!watchlist),
            ),
        orElse: () => ErrorText(context.locale.notLoggedInErrorMessage));
  }
}
