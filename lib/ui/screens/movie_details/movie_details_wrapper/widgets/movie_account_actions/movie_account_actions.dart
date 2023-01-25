import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../../core/models/movie/details/movie_details.dart';
import '../../../../../../core/providers/general_providers.dart';
import 'widgets/favorite_button.dart';
import 'widgets/rate_button/rate_button.dart';
import 'widgets/watchlist_button/watchlist_button.dart';

class MovieAccountActions extends ConsumerWidget {
  const MovieAccountActions({
    super.key,
    required this.movieDetails,
    this.onFavoritePressed,
  });

  final MovieDetails movieDetails;
  final void Function(bool favorite)? onFavoritePressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final accountDetails = ref.watch(accountDetailsStateProvider)!;

    return Padding(
      padding: const EdgeInsets.only(bottom: 10, top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          RateButton(
            rated: movieDetails.state!.rated,
            movieId: movieDetails.id,
          ),
          Row(
            children: [
              FavoriteButton(
                accountId: accountDetails.id,
                movieId: movieDetails.id,
                favorite: movieDetails.state!.favorite,
              ),
              WatchlistButton(
                accountId: accountDetails.id,
                movieId: movieDetails.id,
                watchlist: movieDetails.state!.watchlist,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
