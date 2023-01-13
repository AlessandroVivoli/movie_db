import 'package:flutter/material.dart';

class PlayButton extends StatefulWidget {
  final ScrollController controller;

  final void Function()? onPressed;

  const PlayButton({super.key, required this.controller, this.onPressed});

  @override
  State<StatefulWidget> createState() => _PlayButtonState();
}

class _PlayButtonState extends State<PlayButton> {
  @override
  void initState() {
    widget.controller.addListener(() => setState(() {}));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const double defaultTopMargin = 250 - 15;

    const double scaleStart = 96;
    const double scaleEnd = scaleStart / 2;

    double top = defaultTopMargin;
    double scale = 1;
    if (widget.controller.hasClients) {
      double offset = widget.controller.offset;
      top -= offset;

      if (offset < defaultTopMargin - scaleStart) {
        scale = 1;
      } else if (offset < defaultTopMargin - scaleEnd) {
        scale = (defaultTopMargin - scaleEnd - offset) / scaleEnd;
      } else {
        scale = 0;
      }
    }

    return Positioned(
      top: top,
      right: 16,
      child: Transform(
        transform: Matrix4.identity()..scale(scale),
        alignment: Alignment.center,
        child: FloatingActionButton(
          onPressed: widget.onPressed,
          backgroundColor: Theme.of(context).colorScheme.primary,
          foregroundColor: Colors.white,
          child: const Icon(Icons.play_arrow),
        ),
      ),
    );
  }
}
