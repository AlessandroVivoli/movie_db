import 'package:flutter/material.dart';

class Rating extends StatelessWidget {
  final double rating;
  final double padding;
  final double size;
  final MainAxisAlignment? alignment;
  final int digits;
  final bool showNum;

  final void Function(int index)? onRate;

  const Rating({
    super.key,
    required this.rating,
    this.padding = 3,
    this.size = 10,
    this.alignment = MainAxisAlignment.center,
    this.digits = 1,
    this.showNum = true,
    this.onRate,
  });

  @override
  Widget build(BuildContext context) {
    final starRating = rating / 2;

    final goldenStars = List<Widget>.generate(
      starRating.floor(),
      (index) => Padding(
        padding: EdgeInsets.symmetric(horizontal: padding),
        child: Icon(
          Icons.star,
          size: size,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
    );

    if (starRating - starRating.floor() > 0) {
      goldenStars.add(
        Padding(
          padding: EdgeInsets.symmetric(horizontal: padding),
          child: ClipRect(
            clipBehavior: Clip.hardEdge,
            child: Align(
              alignment: Alignment.centerLeft,
              heightFactor: 1,
              widthFactor: starRating - starRating.floor(),
              child: Icon(
                Icons.star,
                size: size,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
        ),
      );
    }

    return SizedBox(
      height: 20,
      child: Row(
        mainAxisAlignment: alignment!,
        children: [
          if (showNum)
            SizedBox(
              width: 30 + (digits - 1) * 5,
              child: Text(
                rating
                    .toStringAsFixed(digits)
                    .replaceFirst(RegExp(r'(?<=)\.0+'), ''),
              ),
            ),
          Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: List<Widget>.generate(
                  5,
                  (index) => Padding(
                    padding: EdgeInsets.symmetric(horizontal: padding),
                    child: Icon(
                      Icons.star,
                      size: size,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: goldenStars,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: List<Widget>.generate(
                  5,
                  (index) => GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      onTap(index);
                    },
                    child: SizedBox(
                      height: size,
                      width: size + padding * 2,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  onTap(int index) {
    if (onRate != null) onRate!(index);
  }
}
