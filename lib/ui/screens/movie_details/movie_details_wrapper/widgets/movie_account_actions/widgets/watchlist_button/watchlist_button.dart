import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../../../../../core/providers/session_provider.dart';
import '../../../../../../../../core/services/account_service.dart';
import '../../../../../../../shared/widgets/errors/error_snack_bar_content.dart';

class WatchlistButton extends HookWidget {
  const WatchlistButton({
    super.key,
    required this.accountId,
    required this.movieId,
    required this.watchlist,
  });

  final int accountId;
  final int movieId;
  final bool watchlist;

  @override
  Widget build(BuildContext context) {
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
        final code = await AccountService.addMovieToWatchList(
          accountId: accountId,
          movieId: movieId,
          sessionId: SessionProvider.sessionId!,
          watchlist: !isWatchlist.value,
        ).catchError((_) {
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
