import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../core/hooks/play_button_hook.dart';

class PlayButton extends HookWidget {
  final ScrollController controller;

  final void Function()? onPressed;

  const PlayButton({super.key, required this.controller, this.onPressed});

  @override
  Widget build(BuildContext context) {
    final offset = useState(controller.offset);
    final playButtonScale = usePlayButtonScale(controller, offset.value).value;

    useEffect(() {
      controller.addListener(() => controllerListener(offset));
      return () {
        controller.removeListener(() => controllerListener(offset));
      };
    }, []);

    return Positioned(
      top: playButtonScale.top,
      right: 16,
      child: Transform(
        transform: Matrix4.identity()..scale(playButtonScale.scale),
        alignment: Alignment.center,
        child: FloatingActionButton(
          onPressed: onPressed,
          backgroundColor: Theme.of(context).colorScheme.primary,
          foregroundColor: Colors.white,
          child: const Icon(Icons.play_arrow),
        ),
      ),
    );
  }

  void controllerListener(ValueNotifier<double> offset) {
    offset.value = controller.offset;
  }
}
