import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../../../../../features/auth/domain/user.dart';
import '../../../../../../../../core/extensions/build_context_extensions.dart';
import '../../../../../../../../features/movies/provider/rating/delete_movie_rating_provider.dart';

class DeleteButton extends ConsumerWidget {
  const DeleteButton({
    super.key,
    required this.movieId,
    required this.originalRating,
    required this.user,
  });

  final double originalRating;
  final int movieId;
  final User user;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(deleteMovieRatingProvider);

    final localization = AppLocalizations.of(context)!;

    ref.listen(deleteMovieRatingProvider, (previous, next) {
      next.whenOrNull(
        success: () => Navigator.pop(context),
        error: (error, stackTrace) {
          context.showErrorSnackBar(localization.deleteRatingError);

          Navigator.pop(context);
        },
      );
    });

    return provider.maybeWhen(
      loading: () => const Center(
        child: CircularProgressIndicator(
          color: Colors.red,
        ),
      ),
      orElse: () => _DeleteButton(
        movieId: movieId,
        originalRating: originalRating,
        user: user,
      ),
    );
  }
}

class _DeleteButton extends ConsumerWidget {
  const _DeleteButton({
    required this.originalRating,
    required this.user,
    required this.movieId,
  });

  final double originalRating;
  final User user;
  final int movieId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localization = AppLocalizations.of(context)!;

    return OutlinedButton(
      onPressed: (originalRating > 0)
          ? () =>
              ref.read(deleteMovieRatingProvider.notifier).deleteRating(movieId)
          : null,
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.red,
        side: BorderSide(
          color: (originalRating > 0) ? Colors.red : Colors.grey,
          width: 2,
        ),
      ),
      child: Text(localization.rateDeleteButtonLabel),
    );
  }
}
