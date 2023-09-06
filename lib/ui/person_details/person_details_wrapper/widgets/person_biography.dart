import 'package:flutter/material.dart';

import '../../../../core/extensions/build_context_extensions.dart';

class PersonBiography extends StatelessWidget {
  const PersonBiography({
    super.key,
    required this.biography,
  });

  final String biography;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.locale.personBiographyLabel.toUpperCase(),
          style: TextStyle(
            color: Theme.of(context).colorScheme.secondary,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          (biography.characters.isEmpty)
              ? context.locale.noBiography
              : biography,
          textAlign: TextAlign.justify,
        ),
      ],
    );
  }
}
