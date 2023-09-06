import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../../../../features/rated/domain/rated.dart';
import '../../../../../core/extensions/build_context_extensions.dart';
import 'widgets/rating_dialog.dart';

class RateButton extends HookWidget {
  const RateButton({
    super.key,
    required this.rate,
    this.onRate,
  });

  final Rated rate;
  final Function(double? rating)? onRate;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(minWidth: 100),
      child: OutlinedButton.icon(
        icon: Icon(
          (rate.value == 0) ? Icons.star_border : Icons.star,
        ),
        label: Text(context.locale.rateButtonLabel),
        onPressed: () async {
          await showDialog(
            context: context,
            builder: (context) {
              return RatingDialog(
                onRate: onRate,
                rating: rate.value,
              );
            },
          );
        },
      ),
    );
  }
}
