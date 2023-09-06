import 'package:flutter/material.dart';

import '../../../../../features/rated/domain/rated.dart';
import '../../../features/account/domain/account_media_status/account_media_status.dart';
import 'widgets/favorite_button.dart';
import 'widgets/rate_button/rate_button.dart';
import 'widgets/watchlist_button.dart';

class MediaAccountActions extends StatelessWidget {
  const MediaAccountActions({
    super.key,
    required this.mediaId,
    required this.accountStates,
    this.onFavoritePressed,
    this.onWatchlistPressed,
    this.onRate,
  });

  final int mediaId;
  final AccountMediaStatus accountStates;
  final void Function(bool favorite)? onFavoritePressed;
  final void Function(bool watchlist)? onWatchlistPressed;
  final void Function(double? rating)? onRate;

  @override
  Widget build(BuildContext context) {
    final rated = accountStates.rated;

    return Padding(
      padding: const EdgeInsets.only(bottom: 10, top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          RateButton(
            rate: (accountStates.rated is bool)
                ? const Rated(value: 0)
                : Rated.fromJson(rated),
            onRate: onRate,
          ),
          Row(
            children: [
              FavoriteButton(
                favorite: accountStates.favorite,
                onFavoritePressed: onFavoritePressed,
              ),
              WatchlistButton(
                watchlist: accountStates.watchlist,
                onWatchlistPressed: onWatchlistPressed,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
