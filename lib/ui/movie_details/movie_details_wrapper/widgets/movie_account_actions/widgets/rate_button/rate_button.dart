import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../../../../features/rated/domain/rated.dart';
import 'widgets/rating_dialog.dart';

class RateButton extends HookWidget {
  const RateButton({
    super.key,
    required this.rate,
    required this.movieId,
  });

  final Rated rate;
  final int movieId;

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;

    return ConstrainedBox(
      constraints: const BoxConstraints(minWidth: 100),
      child: OutlinedButton.icon(
        icon: Icon(
          (rate.value == 0) ? Icons.star_border : Icons.star,
        ),
        label: Text(localization.rateButtonLabel),
        onPressed: () async {
          await showDialog(
            context: context,
            builder: (context) {
              return RatingDialog(
                rating: rate.value,
                movieId: movieId,
              );
            },
          );
        },
      ),
    );
  }
}
