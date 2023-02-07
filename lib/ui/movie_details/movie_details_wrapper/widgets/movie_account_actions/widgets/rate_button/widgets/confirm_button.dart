import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../../../../../features/auth/domain/user.dart';
import '../../../../../../../../core/extensions/build_context_extensions.dart';
import '../../../../../../../../features/movies/provider/rating/rate_movies_provider.dart';

class ConfirmButton extends ConsumerWidget {
  final double rating;
  final double originalRating;
  final int movieId;
  final User user;

  const ConfirmButton({
    super.key,
    required this.rating,
    required this.movieId,
    required this.originalRating,
    required this.user,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(rateMoviesProvider);

    final localization = AppLocalizations.of(context)!;

    ref.listen(rateMoviesProvider, (previous, next) {
      next.whenOrNull(
        error: (error, stackTrace) {
          context.showErrorSnackBar(localization.rateError);

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
        rating: rating,
        originalRating: originalRating,
        movieId: movieId,
        user: user,
      ),
    );
  }
}

class _ConfirmButton extends ConsumerWidget {
  const _ConfirmButton({
    required this.rating,
    required this.originalRating,
    required this.movieId,
    required this.user,
  });

  final double rating;
  final double originalRating;
  final int movieId;
  final User user;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localization = AppLocalizations.of(context)!;

    return OutlinedButton(
      onPressed: (rating > 0 && originalRating != rating)
          ? () {
              ref.read(rateMoviesProvider.notifier).rateMovie(movieId, rating);
            }
          : null,
      style: OutlinedButton.styleFrom(
        side: BorderSide(
          color: (rating == 0 || originalRating == rating)
              ? Colors.grey
              : Theme.of(context).colorScheme.primary,
          width: 2,
        ),
      ),
      child: Text(localization.rateConfirmButtonLabel),
    );
  }
}
