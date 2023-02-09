import 'package:flutter/material.dart';

import '../../../../../features/movies/domain/movie_details.dart';
import '../../../../../features/rated/domain/rated.dart';
import 'widgets/favorite_button.dart';
import 'widgets/rate_button/rate_button.dart';
import 'widgets/watchlist_button.dart';

class MovieAccountActions extends StatelessWidget {
  const MovieAccountActions({
    super.key,
    required this.movieDetails,
    this.onFavoritePressed,
  });

  final MovieDetails movieDetails;
  final void Function(bool favorite)? onFavoritePressed;

  @override
  Widget build(BuildContext context) {
    final rated = movieDetails.accountStates!.rated;

    return Padding(
      padding: const EdgeInsets.only(bottom: 10, top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          RateButton(
            rate: (movieDetails.accountStates!.rated is bool)
                ? const Rated(value: 0)
                : Rated.fromJson(rated),
            movieId: movieDetails.id,
          ),
          Row(
            children: [
              FavoriteButton(
                movieId: movieDetails.id,
                favorite: movieDetails.accountStates!.favorite,
              ),
              WatchlistButton(
                movieId: movieDetails.id,
                watchlist: movieDetails.accountStates!.watchlist,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
