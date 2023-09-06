import 'package:flutter/material.dart';

class PlayIcon extends StatelessWidget {
  const PlayIcon({super.key});

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
