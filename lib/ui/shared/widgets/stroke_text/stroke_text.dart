import 'package:flutter/material.dart';

class StrokeText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final Color? strokeColor;
  final double? strokeWidth;

  const StrokeText(
    this.text, {
    super.key,
    this.fontSize,
    this.fontWeight,
    this.color,
    this.strokeColor,
    this.strokeWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: fontWeight,
            foreground: Paint()
              ..strokeWidth = strokeWidth ?? 1
              ..color = strokeColor ?? Colors.black
              ..style = PaintingStyle.stroke,
          ),
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: fontWeight,
            foreground: Paint()
              ..color = color ?? Theme.of(context).colorScheme.primary,
          ),
        ),
      ],
    );
  }
}
