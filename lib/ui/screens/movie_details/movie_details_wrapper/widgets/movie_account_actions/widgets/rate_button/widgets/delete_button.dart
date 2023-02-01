import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../../../../../core/models/user/user.dart';
import '../../../../../../../../../core/providers/movie/rated_movies/delete_rating_provider.dart';
import '../../../../../../../../../utils/extensions.dart';

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
    final deleteRating = ref.watch(deleteRatingProvider);

    return deleteRating.when(
      init: () => _DeleteButton(
        movieId: movieId,
        originalRating: originalRating,
        user: user,
      ),
      completed: () {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Navigator.pop(context);
        });

        return _DeleteButton(
          movieId: movieId,
          user: user,
          originalRating: originalRating,
        );
      },
      loading: () => const Center(
        child: CircularProgressIndicator(
          color: Colors.red,
        ),
      ),
      error: (error, stackTrace) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Navigator.pop(context);
        });

        context.showErrorSnackBar('Could not delete rating');

        return _DeleteButton(
          originalRating: originalRating,
          user: user,
          movieId: movieId,
        );
      },
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
      child: const Text('Delete'),
    );
  }
}
