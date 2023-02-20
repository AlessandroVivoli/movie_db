import 'package:flutter/material.dart';

import '../../../../core/extensions/build_context_extensions.dart';

class TVDescription extends StatelessWidget {
  const TVDescription(this.description, {super.key});

  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.locale.descriptionLabel.toUpperCase(),
          style: TextStyle(
            color: Theme.of(context).colorScheme.secondary,
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.justify,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Text(description),
        )
      ],
    );
  }
}
