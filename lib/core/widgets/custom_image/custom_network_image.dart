import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomNetworkImage extends StatelessWidget {
  const CustomNetworkImage({
    super.key,
    this.url,
    required this.placeholder,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;

  final String? url;
  final Widget placeholder;

  @override
  Widget build(BuildContext context) {
    if (url != null) {
      return SizedBox.expand(
        child: CachedNetworkImage(
          width: width,
          height: height,
          fit: BoxFit.cover,
          imageUrl: url!,
          placeholder: (context, url) => placeholder,
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      );
    }

    if (placeholder is Icon) {
      final icon = placeholder as Icon;

      return Icon(
        icon.icon,
        color: icon.color ?? Colors.white,
        size: icon.size,
      );
    }

    return Container(
      color: Theme.of(context).colorScheme.surface,
      child: Center(child: placeholder),
    );
  }
}
