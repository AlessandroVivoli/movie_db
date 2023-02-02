import 'package:flutter/cupertino.dart';

import '../domain/active_dot_scale.dart';

ValueNotifier<ActiveDotScale> useActiveDot({
  required double screenWidth,
  required double activePage,
  required double padding,
  required double radius,
  required int length,
}) {
  double dotComposite = (padding + radius) * 2;
  double calculatedWidth = (screenWidth - dotComposite * length);
  double startPosition = calculatedWidth / 2;
  double left = startPosition + (dotComposite * activePage);

  return ValueNotifier(
    ActiveDotScale(
      dotComposite: dotComposite,
      left: left,
    ),
  );
}
