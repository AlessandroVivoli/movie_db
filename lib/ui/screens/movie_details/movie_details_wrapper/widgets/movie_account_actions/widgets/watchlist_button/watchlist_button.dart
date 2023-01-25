import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../../../../core/providers/account_provider.dart';
import '../../../../../../../../core/providers/general_providers.dart';
import '../../../../../../../../core/providers/session_provider.dart';
import '../../../../../../../shared/widgets/errors/error_snack_bar_content.dart';

class WatchlistButton extends HookConsumerWidget {
  const WatchlistButton({
    super.key,
    required this.movieId,
    required this.watchlist,
  });

  final int movieId;
  final bool watchlist;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final accountId = ref.watch(accountDetailsStateProvider)!.id;
    final accountService = ref.watch(accountServiceProvider);

    final isWatchlist = useState(watchlist);

    return IconButton(
      icon: Icon(
        (isWatchlist.value)
            ? Icons.bookmark_added
            : Icons.bookmark_add_outlined,
        size: 30,
        color: (isWatchlist.value)
            ? Theme.of(context).colorScheme.primary
            : Colors.white,
      ),
      onPressed: () async {
        final code = await accountService
            .addMovieToWatchList(
          accountId: accountId,
          movieId: movieId,
          sessionId: SessionProvider.sessionId!,
          watchlist: !isWatchlist.value,
        )
            .catchError((_) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: ErrorSnackBarContent(
                message: (isWatchlist.value)
                    ? 'Could not remove movie from watchlist.'
                    : 'Could not add movie to watchlist',
              ),
            ),
          );

          return -1;
        });

        if (code != -1) {
          isWatchlist.value = !isWatchlist.value;
        }
      },
    );
  }
}
