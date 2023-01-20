import 'package:flutter/material.dart';

import '../../../../../../../../core/providers/session_provider.dart';
import '../../../../../../../../core/services/account_service.dart';
import '../../../../../../../shared/widgets/errors/error_snack_bar_content.dart';

class WatchlistButton extends StatefulWidget {
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
  State<WatchlistButton> createState() => _WatchlistButtonState();
}

class _WatchlistButtonState extends State<WatchlistButton> {
  late bool _watchlist;

  @override
  void initState() {
    _watchlist = widget.watchlist;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        (_watchlist) ? Icons.bookmark_added : Icons.bookmark_add_outlined,
        size: 30,
        color:
            (_watchlist) ? Theme.of(context).colorScheme.primary : Colors.white,
      ),
      onPressed: onMarkWatchlist,
    );
  }

  void onMarkWatchlist() async {
    final code = await AccountService.addMovieToWatchList(
      accountId: widget.accountId,
      movieId: widget.movieId,
      sessionId: SessionProvider.sessionId!,
      watchlist: !_watchlist,
    ).catchError((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: ErrorSnackBarContent(
            message: (_watchlist)
                ? 'Could not remove movie from watchlist.'
                : 'Could not add movie to watchlist',
          ),
        ),
      );

      return -1;
    });

    if (code != -1) {
      setState(() {
        _watchlist = !_watchlist;
      });
    }
  }
}
