import 'package:flutter/material.dart';

import '../../../../../../core/models/movie/details/movie_details.dart';
import '../../../../../../core/providers/session_provider.dart';
import '../../../../../../core/services/account_service.dart';
import 'widgets/favorite_button.dart';
import 'widgets/rate_button/rate_button.dart';
import 'widgets/watchlist_button/watchlist_button.dart';

class MovieAccountActions extends StatefulWidget {
  const MovieAccountActions({
    super.key,
    required this.movieDetails,
    this.onFavoritePressed,
  });

  final MovieDetails movieDetails;
  final void Function(bool favorite)? onFavoritePressed;

  @override
  State<MovieAccountActions> createState() => _MovieAccountActionsState();
}

class _MovieAccountActionsState extends State<MovieAccountActions> {
  late int _accountId;

  @override
  void initState() {
    _accountId = 0;

    AccountService.getAccountDetails(
      sessionId: SessionProvider.sessionId!,
    ).then(
      (value) {
        setState(() {
          _accountId = value.id;
        });
      },
      onError: (error) {
        return null;
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          RateButton(
            rated: widget.movieDetails.state!.rated,
            movieId: widget.movieDetails.id!,
          ),
          Row(
            children: [
              FavoriteButton(
                accountId: _accountId,
                movieId: widget.movieDetails.id!,
                favorite: widget.movieDetails.state!.favorite,
              ),
              WatchlistButton(
                accountId: _accountId,
                movieId: widget.movieDetails.id!,
                watchlist: widget.movieDetails.state!.watchlist,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
