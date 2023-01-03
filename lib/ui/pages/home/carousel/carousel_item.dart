import 'package:flutter/material.dart';
import 'package:movie_db/widgets/backdrop_image.dart';

class CarouselItem extends StatelessWidget {
  final String image;
  final Function()? onTap;

  const CarouselItem({super.key, required this.image, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackdropImage(imgUrl: image),
        Container(
          margin: const EdgeInsets.only(bottom: 40, left: 10, right: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              SizedBox(
                width: 190,
                child: Text(
                  "Doctor Strange in the Multiverse of Madness",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.left,
                ),
              )
            ],
          ),
        ),
        SizedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.play_circle_outline,
                    color: Theme.of(context).colorScheme.primary,
                    size: 70,
                  ),
                ],
              )
            ],
          ),
        ),
        GestureDetector(onTap: onTap)
      ],
    );
  }
}
