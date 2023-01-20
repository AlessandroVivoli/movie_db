import 'package:flutter/material.dart';

import '../../../../../../../../shared/widgets/rating/rating.dart';
import 'confirm_button.dart';
import 'delete_button.dart';

class RatingDialog extends StatefulWidget {
  const RatingDialog({super.key, required this.rating, required this.movieId});

  final double rating;
  final int movieId;

  @override
  State<RatingDialog> createState() => _RatingDialogState();
}

class _RatingDialogState extends State<RatingDialog> {
  late double _rating;

  @override
  void initState() {
    _rating = widget.rating;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                rating: _rating,
                onRate: (index) {
                  setState(() {
                    _rating = (index + 1) * 2;
                  });
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 80,
                    height: 36,
                    child: DeleteButton(
                      rating: _rating,
                      movieId: widget.movieId,
                      originalRating: widget.rating,
                    ),
                  ),
                  SizedBox(
                    width: 90,
                    height: 36,
                    child: ConfirmButton(
                      rating: _rating,
                      movieId: widget.movieId,
                      originalRating: widget.rating,
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
