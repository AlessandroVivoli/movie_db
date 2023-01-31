import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../../../../../core/models/user/user.dart';
import '../../../../../../../../../core/providers/movie_provider.dart';
import '../../../../../../../../../utils/extensions.dart';

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
    final rateProvider = ref.watch(rateMovieProvider);

    return rateProvider.when(
      init: () => _ConfirmButton(
        rating: rating,
        originalRating: originalRating,
        movieId: movieId,
        user: user,
      ),
      completed: () {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Navigator.pop(context, true);
        });

        return _ConfirmButton(
          rating: rating,
          originalRating: originalRating,
          movieId: movieId,
          user: user,
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) {
        context.showErrorSnackBar('Could not rate movie.');

        WidgetsBinding.instance.addPostFrameCallback((_) {
          Navigator.pop(context, false);
        });

        return _ConfirmButton(
          rating: rating,
          originalRating: originalRating,
          movieId: movieId,
          user: user,
        );
      },
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
    return OutlinedButton(
      onPressed: (rating > 0 && originalRating != rating)
          ? () {
              ref.read(rateMovieProvider.notifier).rateMovie(
                    movieId,
                    user.sessionId,
                    rating,
                  );
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
      child: const Text('Confirm'),
    );
  }
}
