import 'package:flutter/material.dart';

class BlankProfileImage extends StatelessWidget {
  const BlankProfileImage({
    Key? key,
    required this.imgRadius,
    required this.imgBorderWidth,
  }) : super(key: key);

  final double imgRadius;
  final double imgBorderWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: imgRadius * 2 - imgBorderWidth * 2,
      width: imgRadius * 2 - imgBorderWidth * 2,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.transparent,
        border: Border.fromBorderSide(BorderSide(
          width: 2,
          color: Theme.of(context).colorScheme.primary,
        )),
      ),
      alignment: Alignment.center,
      child: Icon(
        Icons.person,
        size: imgRadius,
        color: Colors.white,
      ),
    );
  }
}
