import 'package:flutter/material.dart';

import '../custom_image/custom_network_image.dart';

class BackdropImage extends StatelessWidget {
  final String? imgUrl;
  final Icon placeholderIcon;

  const BackdropImage({
    super.key,
    required this.imgUrl,
    required this.placeholderIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: CustomNetworkImage(
            url: imgUrl,
            placeholderIcon: placeholderIcon,
          ),
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Theme.of(context).colorScheme.background,
                Colors.transparent
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              stops: const [0, .5],
            ),
          ),
        ),
      ],
    );
  }
}
