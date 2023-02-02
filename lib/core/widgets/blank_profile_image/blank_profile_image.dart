import 'package:flutter/material.dart';

class BlankProfileImage extends StatelessWidget {
  const BlankProfileImage({
    super.key,
    required this.imgRadius,
  });

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
