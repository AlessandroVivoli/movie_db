import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TVDescription extends StatelessWidget {
  const TVDescription(this.description, {super.key});

  final String description;

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          localization.descriptionLabel.toUpperCase(),
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
