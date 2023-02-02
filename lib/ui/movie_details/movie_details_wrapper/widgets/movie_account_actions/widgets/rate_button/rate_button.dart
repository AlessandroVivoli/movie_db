import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../../../../features/movies/domain/account_state/rate/movie_rate.dart';
import 'widgets/rating_dialog.dart';

class RateButton extends HookWidget {
  const RateButton({
    super.key,
    required this.rate,
    required this.movieId,
  });

  final MovieRate rate;
  final int movieId;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: OutlinedButton.icon(
        icon: Icon(
          (rate.value == 0) ? Icons.star_border : Icons.star,
        ),
        label: const Text('Rate'),
        onPressed: () async {
          await showDialog(
            context: context,
            builder: (context) {
              return RatingDialog(
                rating: rate.value,
                movieId: movieId,
              );
            },
          );
        },
      ),
    );
  }
}
