import 'package:flutter/material.dart';

class CarouselActiveDot extends StatefulWidget {
  final PageController controller;
  final int length;

  final int? radius;
  final int? padding;

  const CarouselActiveDot({
    Key? key,
    required this.controller,
    required this.length,
    int? radius,
    int? padding,
  })  : radius = radius ?? 3,
        padding = padding ?? 5,
        super(key: key);

  @override
  State<CarouselActiveDot> createState() => _CarouselActiveDotState();
}

class _CarouselActiveDotState extends State<CarouselActiveDot> {
  late double _activePage;

  @override
  void initState() {
    _activePage = 0;

    widget.controller.addListener(() {
      setState(() {
        _activePage = widget.controller.page ?? 0;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double dotComposite = (widget.padding! * 2 + widget.radius! * 2.0);
    double screenWidth = MediaQuery.of(context).size.width;
    double calculatedWidth = (screenWidth - dotComposite * widget.length);
    double startPosition = calculatedWidth / 2;
    double left = startPosition + (dotComposite * _activePage);

    return Positioned(
      bottom: (20 - widget.radius! * 2) / 2,
      left: left,
      width: dotComposite,
      child: CircleAvatar(
        radius: widget.radius! * 1,
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
    );
  }
}
