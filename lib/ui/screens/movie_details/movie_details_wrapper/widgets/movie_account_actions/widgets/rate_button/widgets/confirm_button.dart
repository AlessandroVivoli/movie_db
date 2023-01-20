import 'package:flutter/material.dart';

import '../../../../../../../../../core/models/movie/account_state/rate/movie_rate.dart';
import '../../../../../../../../../core/providers/session_provider.dart';
import '../../../../../../../../../core/services/movie_service.dart';
import '../../../../../../../../shared/widgets/errors/error_snack_bar_content.dart';

class ConfirmButton extends StatefulWidget {
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
  State<ConfirmButton> createState() => _ConfirmButtonState();
}

class _ConfirmButtonState extends State<ConfirmButton> {
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
        onPressed: (widget.rating > 0 && widget.originalRating != widget.rating)
            ? onConfirm
            : null,
        style: OutlinedButton.styleFrom(
          side: BorderSide(
            color:
                (widget.rating == 0 || widget.originalRating == widget.rating)
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

  void onConfirm() async {
    setState(() {
      loading = true;
    });

    final code = await MovieService.rateMovie(
      id: widget.movieId,
      sessionId: SessionProvider.sessionId!,
      rating: widget.rating,
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

    if (code == -1 && mounted) {
      Navigator.pop(context, false);
    } else if (mounted) {
      Navigator.pop(context, MovieRate(value: widget.rating));
    }
  }
}
