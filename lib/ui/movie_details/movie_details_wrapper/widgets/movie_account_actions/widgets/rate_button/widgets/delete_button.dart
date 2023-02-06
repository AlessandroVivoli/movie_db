import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../../../../../features/auth/domain/user.dart';
import '../../../../../../../../core/extensions/build_context_extensions.dart';
import '../../../../../../../../features/movies/provider/rating/delete_rating_provider.dart';

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
    final isLoading = ref.watch(deleteRatingProvider).maybeWhen(
          loading: () => true,
          orElse: () => false,
        );

    final localization = AppLocalizations.of(context)!;

    ref.listen(deleteRatingProvider, (previous, next) {
      next.whenOrNull(
        success: () {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Navigator.pop(context);
          });
        },
        error: (error, stackTrace) {
          context.showErrorSnackBar(localization.deleteRatingError);

          WidgetsBinding.instance.addPostFrameCallback((_) {
            Navigator.pop(context);
          });
        },
      );
    });

    return _DeleteButton(
      movieId: movieId,
      originalRating: originalRating,
      user: user,
      isLoading: isLoading,
    );
  }
}

class _DeleteButton extends ConsumerWidget {
  const _DeleteButton({
    required this.originalRating,
    required this.user,
    required this.movieId,
    required this.isLoading,
  });

  final double originalRating;
  final User user;
  final int movieId;
  final bool isLoading;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localization = AppLocalizations.of(context)!;

    if (isLoading) {
      return const Center(
        child: CircularProgressIndicator(color: Colors.red),
      );
    }

    return OutlinedButton(
      onPressed: (originalRating > 0)
          ? () => ref
              .read(deleteRatingProvider.notifier)
              .deleteRating(movieId, user.sessionId)
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
