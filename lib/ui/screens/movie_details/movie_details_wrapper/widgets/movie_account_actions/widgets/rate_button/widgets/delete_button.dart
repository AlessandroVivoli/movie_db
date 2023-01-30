import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loggy/loggy.dart';

import '../../../../../../../../../core/interfaces/i_movie_service.dart';
import '../../../../../../../../../core/providers/movie_provider.dart';
import '../../../../../../../../../utils/extensions.dart';

class DeleteButton extends HookConsumerWidget {
  const DeleteButton({
    super.key,
    required this.rating,
    required this.movieId,
    required this.originalRating,
    required this.sessionId,
  });

  final double rating;
  final double originalRating;
  final int movieId;
  final String sessionId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movieService = ref.watch(movieServiceProvider);

    final loading = useState(false);

    if (!loading.value) {
      return OutlinedButton(
        onPressed: (originalRating > 0)
            ? () => onDelete(loading, context, movieService, ref)
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

    return const Center(
      child: CircularProgressIndicator(
        color: Colors.red,
      ),
    );
  }

  void onDelete(
    ValueNotifier<bool> loading,
    BuildContext context,
    IMovieService movieService,
    WidgetRef ref,
  ) async {
    loading.value = true;

    final code = await movieService
        .deleteRating(id: movieId, sessionId: sessionId)
        .catchError((error) => showError(context, error));

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (code == -1) {
        return Navigator.pop(context, false);
      }

      return Navigator.pop(context, true);
    });
  }

  int showError(BuildContext context, DioError error) {
    logError('Could not delete rating.', error.error, error.stackTrace);

    context.showErrorSnackBar('Could not delete rating.');

    return -1;
  }
}
