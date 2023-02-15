import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PersonBiography extends StatelessWidget {
  const PersonBiography({
    super.key,
    required this.biography,
  });

  final String biography;

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          localization.personBiographyLabel.toUpperCase(),
          style: TextStyle(
            color: Theme.of(context).colorScheme.secondary,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          (biography.characters.isEmpty) ? localization.noBiography : biography,
          textAlign: TextAlign.justify,
        ),
      ],
    );
  }
}
