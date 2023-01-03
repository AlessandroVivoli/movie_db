import 'package:flutter/material.dart';
import 'package:movie_db/widgets/backdrop_image.dart';

class CarouselItem extends StatelessWidget {
  final String image;
  final String title;
  final Function()? onTap;

  const CarouselItem(
      {super.key, required this.image, this.onTap, required this.title});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 2),
      child: Stack(
        children: [
          GestureDetector(onTap: onTap),
          BackdropImage(imgUrl: image),
          _Title(title: title),
          const _PlayIcon(),
        ],
      ),
    );
  }
}

class _PlayIcon extends StatelessWidget {
  const _PlayIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
    );
  }
}

class _Title extends StatelessWidget {
  const _Title({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30, left: 10, right: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 190,
            child: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
              textAlign: TextAlign.left,
            ),
          )
        ],
      ),
    );
  }
}
