import 'package:flutter/material.dart';

import '../../../../../../../../core/models/movie/account_state/rate/movie_rate.dart';
import 'widgets/rating_dialog.dart';

class RateButton extends StatefulWidget {
  const RateButton({
    super.key,
    required this.rated,
    required this.movieId,
  });

  final dynamic rated;
  final int movieId;

  @override
  State<RateButton> createState() => _RateButtonState();
}

class _RateButtonState extends State<RateButton> {
  late MovieRate _rate;

  @override
  void initState() {
    try {
      _rate = MovieRate.fromJson(widget.rated);
    } catch (e) {
      _rate = const MovieRate(value: 0);
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: OutlinedButton.icon(
        icon: Icon(
          (_rate.value == 0) ? Icons.star_border : Icons.star,
        ),
        label: const Text('Rate'),
        onPressed: () async {
          final data = await showDialog(
            context: context,
            builder: (context) {
              return RatingDialog(
                rating: _rate.value,
                movieId: widget.movieId,
              );
            },
          );

          if (data != null) {
            if (data is bool) {
              if (data) {
                setState(() {
                  _rate = const MovieRate(value: 0);
                });
              }
            } else if (data is MovieRate) {
              setState(() {
                _rate = data;
              });
            }
          }
        },
      ),
    );
  }
}
