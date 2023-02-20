import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../../../../core/extensions/build_context_extensions.dart';
import '../../../../../../features/media/provider/rate_media_provider.dart';

class ConfirmButton extends ConsumerWidget {
  final double rating;
  final double originalRating;
  final Function(double rating)? onRate;

  const ConfirmButton({
    super.key,
    required this.rating,
    required this.originalRating,
    this.onRate,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(rateMediaProvider);

    ref.listen(rateMediaProvider, (previous, next) {
      next.whenOrNull(
        error: (error, stackTrace) {
          context.showErrorSnackBar(context.locale.rateError);

          Navigator.pop(context, false);
        },
        success: () {
          Navigator.pop(context, true);
        },
      );
    });

    return provider.maybeWhen(
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
      orElse: () => _ConfirmButton(
        onRate,
        rating: rating,
        originalRating: originalRating,
      ),
    );
  }
}

class _ConfirmButton extends StatelessWidget {
  const _ConfirmButton(
    this.onRate, {
    required this.rating,
    required this.originalRating,
  });

  final double rating;
  final double originalRating;
  final Function(double rating)? onRate;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: (rating > 0 && originalRating != rating && (onRate != null))
          ? () => onRate!(rating)
          : null,
      style: OutlinedButton.styleFrom(
        side: BorderSide(
          color: (rating == 0 || originalRating == rating)
              ? Colors.grey
              : Theme.of(context).colorScheme.primary,
          width: 2,
        ),
      ),
      child: Text(context.locale.rateConfirmButtonLabel),
    );
  }
}
