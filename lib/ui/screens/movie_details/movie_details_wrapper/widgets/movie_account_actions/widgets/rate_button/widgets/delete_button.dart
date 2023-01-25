import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../../../../../../core/providers/session_provider.dart';
import '../../../../../../../../../core/services/movie_service.dart';
import '../../../../../../../../shared/widgets/errors/error_snack_bar_content.dart';

class DeleteButton extends HookWidget {
  const DeleteButton({
    super.key,
    required this.rating,
    required this.movieId,
    required this.originalRating,
  });

  final double rating;
  final double originalRating;
  final int movieId;

  @override
  Widget build(BuildContext context) {
    final loading = useState(false);

    if (!loading.value) {
      return OutlinedButton(
        onPressed:
            (originalRating > 0) ? () => onDelete(loading, context) : null,
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

  void onDelete(ValueNotifier<bool> loading, BuildContext context) async {
    loading.value = true;

    final code = await MovieService.deleteRating(
      id: movieId,
      sessionId: SessionProvider.sessionId!,
    ).catchError((_) {
      ScaffoldMessenger.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(
          const SnackBar(
            content: ErrorSnackBarContent(message: 'Could not delete rating.'),
          ),
        );

      return -1;
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (code == -1) {
        return Navigator.pop(context, false);
      }

      return Navigator.pop(context, true);
    });
  }
}
