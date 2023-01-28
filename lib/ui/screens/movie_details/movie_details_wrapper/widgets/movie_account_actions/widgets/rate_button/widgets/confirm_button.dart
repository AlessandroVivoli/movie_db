import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loggy/loggy.dart';

import '../../../../../../../../../core/interfaces/i_movie_service.dart';
import '../../../../../../../../../core/models/movie/account_state/rate/movie_rate.dart';
import '../../../../../../../../../core/providers/movie_provider.dart';
import '../../../../../../../../../core/providers/user_provider.dart';
import '../../../../../../../../../utils/extensions.dart';

class ConfirmButton extends HookConsumerWidget {
  final double rating;
  final double originalRating;
  final int movieId;

  const ConfirmButton({
    super.key,
    required this.rating,
    required this.movieId,
    required this.originalRating,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movieService = ref.watch(movieServiceProvider);

    final loading = useState(false);

    if (!loading.value) {
      return OutlinedButton(
        onPressed: (rating > 0 && originalRating != rating)
            ? () => onConfirm(loading, context, movieService, ref)
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

    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  void onConfirm(
    ValueNotifier<bool> loading,
    BuildContext context,
    IMovieService movieService,
    WidgetRef ref,
  ) async {
    loading.value = true;

    final code = await movieService
        .rateMovie(
          id: movieId,
          sessionId: ref.watch(userProvider)!.sessionId,
          rating: rating,
        )
        .catchError((error) => showError(context, error));

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (code == -1) {
        return Navigator.pop(context, false);
      }

      return Navigator.pop(context, MovieRate(value: rating));
    });
  }

  int showError(BuildContext context, DioError error) {
    logError('Could not submit rating.', error.error, error.stackTrace);

    context.showErrorSnackBar('Could not submit rating.');

    return -1;
  }
}
