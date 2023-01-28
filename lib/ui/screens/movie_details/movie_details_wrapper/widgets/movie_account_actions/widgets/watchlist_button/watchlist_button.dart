import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loggy/loggy.dart';

import '../../../../../../../../core/providers/account_service_provider.dart';
import '../../../../../../../../core/providers/user_provider.dart';
import '../../../../../../../../utils/extensions.dart';

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
    final user = ref.watch(userProvider)!;
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
              accountId: user.accountDetails.id,
              movieId: movieId,
              sessionId: user.sessionId,
              watchlist: !isWatchlist.value,
            )
            .catchError(
                (error) => showError(context, isWatchlist.value, error));

        if (code != -1) {
          isWatchlist.value = !isWatchlist.value;
        }
      },
    );
  }

  int showError(BuildContext context, bool isWatchlist, DioError error) {
    final message = (isWatchlist)
        ? 'Could not remove movie from watchlist.'
        : 'Could not add movie to watchlist';

    logError(message, error.error, error.stackTrace);

    context.showErrorSnackBar(message);

    return -1;
  }
}
