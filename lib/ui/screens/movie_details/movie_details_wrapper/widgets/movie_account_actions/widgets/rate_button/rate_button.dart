import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../../../../../core/models/movie/account_state/rate/movie_rate.dart';
import 'widgets/rating_dialog.dart';

class RateButton extends HookWidget {
  const RateButton({
    super.key,
    required this.rated,
    required this.movieId,
  });

  final dynamic rated;
  final int movieId;

  @override
  Widget build(BuildContext context) {
    final rate = useState(const MovieRate(value: 0));

    useEffect(() {
      try {
        rate.value = MovieRate.fromJson(rated);
      } catch (e) {
        return null;
      }

      return null;
    }, []);

    return SizedBox(
      width: 100,
      child: OutlinedButton.icon(
        icon: Icon(
          (rate.value.value == 0) ? Icons.star_border : Icons.star,
        ),
        label: const Text('Rate'),
        onPressed: () async {
          final data = await showDialog(
            context: context,
            builder: (context) {
              return RatingDialog(
                rating: rate.value.value,
                movieId: movieId,
              );
            },
          );

          if (data != null) {
            if (data is bool) {
              if (data) {
                rate.value = const MovieRate(value: 0);
              }
            } else if (data is MovieRate) {
              rate.value = data;
            }
          }
        },
      ),
    );
  }
}
