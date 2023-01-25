import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../../../../../../core/models/movie/account_state/rate/movie_rate.dart';
import '../../../../../../../../../core/providers/session_provider.dart';
import '../../../../../../../../../core/services/movie_service.dart';
import '../../../../../../../../shared/widgets/errors/error_snack_bar_content.dart';

class ConfirmButton extends HookWidget {
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
  Widget build(BuildContext context) {
    final loading = useState(false);

    if (!loading.value) {
      return OutlinedButton(
        onPressed: (rating > 0 && originalRating != rating)
            ? () => onConfirm(loading, context)
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

  void onConfirm(ValueNotifier<bool> loading, BuildContext context) async {
    loading.value = true;

    final code = await MovieService.rateMovie(
      id: movieId,
      sessionId: SessionProvider.sessionId!,
      rating: rating,
    ).catchError((_) {
      ScaffoldMessenger.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(
          const SnackBar(
            content: ErrorSnackBarContent(message: 'Could not submit rating.'),
          ),
        );

      return -1;
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (code == -1) {
        return Navigator.pop(context, false);
      }

      return Navigator.pop(context, MovieRate(value: rating));
    });
  }
}
