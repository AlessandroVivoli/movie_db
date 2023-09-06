import 'package:flutter/cupertino.dart';

import '../domain/play_button_scale.dart';

ValueNotifier<PlayButtonScale> usePlayButtonScale(
    ScrollController controller, double offset) {
  const double defaultTopMargin = 260;

  const double scaleStart = (defaultTopMargin - 16) / 2;
  const double scaleEnd = scaleStart / 2;

  double top = defaultTopMargin;
  double scale = 1;

  if (controller.hasClients) {
    top -= offset;

    if (offset < defaultTopMargin - scaleStart) {
      scale = 1;
    } else if (offset < defaultTopMargin - scaleEnd) {
      scale = (defaultTopMargin - scaleEnd - offset) / scaleEnd;
    } else {
      scale = 0;
    }
  }

  return ValueNotifier(
    PlayButtonScale(
      top: top,
      offset: offset,
      scale: scale,
    ),
  );
}
