import 'package:flutter/material.dart';

import '../../../../../../../../../core/providers/session_provider.dart';
import '../../../../../../../../../core/services/movie_service.dart';
import '../../../../../../../../shared/widgets/errors/error_snack_bar_content.dart';

class DeleteButton extends StatefulWidget {
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
  State<DeleteButton> createState() => _DeleteButtonState();
}

class _DeleteButtonState extends State<DeleteButton> {
  late bool loading;

  @override
  void initState() {
    loading = false;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (!loading) {
      return OutlinedButton(
        onPressed: (widget.originalRating > 0) ? onDelete : null,
        style: OutlinedButton.styleFrom(
          foregroundColor: Colors.red,
          side: BorderSide(
            color: (widget.originalRating > 0) ? Colors.red : Colors.grey,
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

  void onDelete() async {
    setState(() {
      loading = true;
    });

    final code = await MovieService.deleteRating(
      id: widget.movieId,
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

    if (code == -1 && mounted) {
      Navigator.pop(context, false);
    } else if (mounted) {
      Navigator.pop(context, true);
    }
  }
}
