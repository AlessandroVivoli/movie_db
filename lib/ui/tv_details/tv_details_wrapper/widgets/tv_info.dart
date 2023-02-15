import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TVInfo extends StatelessWidget {
  const TVInfo({
    super.key,
    required this.released,
    required this.lastReleaseDate,
    required this.seasonCount,
  });

  final DateTime? released;
  final DateTime? lastReleaseDate;
  final int seasonCount;

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (released != null)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Released on:',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const TextSpan(text: ' '),
                  TextSpan(
                    text: localization.releaseDateValue(released!),
                  ),
                ],
              ),
            ),
          ),
        if (lastReleaseDate != null)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Last release date:',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const TextSpan(text: ' '),
                  TextSpan(
                    text: localization.releaseDateValue(lastReleaseDate!),
                  ),
                ],
              ),
            ),
          ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 2),
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Number of seasons:',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                const TextSpan(text: ' '),
                TextSpan(text: '$seasonCount')
              ],
            ),
          ),
        ),
      ],
    );
  }
}
