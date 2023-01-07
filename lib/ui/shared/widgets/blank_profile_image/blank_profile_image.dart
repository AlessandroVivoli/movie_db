import 'package:flutter/material.dart';

class BlankProfileImage extends StatelessWidget {
  const BlankProfileImage({
    Key? key,
    required this.imgRadius,
  }) : super(key: key);

  final double imgRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: imgRadius * 2,
      width: imgRadius * 2,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Theme.of(context).colorScheme.primary,
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
