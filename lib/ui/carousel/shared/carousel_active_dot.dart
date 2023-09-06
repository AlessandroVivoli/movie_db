import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../features/active_dot/hooks/active_dot_hook.dart';

class CarouselActiveDot extends HookWidget {
  final PageController controller;
  final int length;

  final double radius;
  final double padding;

  const CarouselActiveDot({
    super.key,
    required this.controller,
    required this.length,
    this.radius = 3,
    this.padding = 5,
  });

  @override
  Widget build(BuildContext context) {
    final activePage = useState<double>(0);

    final activeDot = useActiveDot(
      screenWidth: MediaQuery.of(context).size.width,
      activePage: activePage.value,
      padding: padding,
      radius: radius,
      length: length,
    );

    useEffect(() {
      controller.addListener(() => controllerListener(activePage));

      return () {
        controller.removeListener(() => controllerListener(activePage));
      };
    }, []);

    return Positioned(
      bottom: (20 - radius * 2) / 2,
      left: activeDot.value.left,
      width: activeDot.value.dotComposite,
      child: CircleAvatar(
        radius: radius * 1,
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
    );
  }

  void controllerListener(ValueNotifier<double> activePage) {
    activePage.value = controller.page ?? 0;
  }
}
