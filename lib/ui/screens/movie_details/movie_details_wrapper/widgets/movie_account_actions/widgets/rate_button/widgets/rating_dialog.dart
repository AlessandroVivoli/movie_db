import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../../../../../shared/widgets/rating/rating.dart';
import 'confirm_button.dart';
import 'delete_button.dart';

class RatingDialog extends HookWidget {
  const RatingDialog({super.key, required this.rating, required this.movieId});

  final double rating;
  final int movieId;

  @override
  Widget build(BuildContext context) {
    final rating = useState(this.rating);

    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          color: Theme.of(context).colorScheme.background,
          alignment: Alignment.center,
          width: 200,
          height: 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Rating(
                size: 20,
                rating: rating.value,
                onRate: (index) {
                  rating.value = (index + 1) * 2;
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 80,
                    height: 36,
                    child: DeleteButton(
                      rating: rating.value,
                      movieId: movieId,
                      originalRating: this.rating,
                    ),
                  ),
                  SizedBox(
                    width: 90,
                    height: 36,
                    child: ConfirmButton(
                      rating: rating.value,
                      movieId: movieId,
                      originalRating: this.rating,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
