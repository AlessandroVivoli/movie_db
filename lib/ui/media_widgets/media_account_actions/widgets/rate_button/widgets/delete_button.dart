import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../../../../core/extensions/build_context_extensions.dart';
import '../../../../../../features/media/provider/delete_rating_provider.dart';

class DeleteButton extends ConsumerWidget {
  const DeleteButton({
    super.key,
    required this.originalRating,
    this.onDelete,
  });

  final double originalRating;
  final Function()? onDelete;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(deleteRatingProvider);

    final localization = AppLocalizations.of(context)!;

    ref.listen(deleteRatingProvider, (previous, next) {
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
        onDelete,
        originalRating: originalRating,
      ),
    );
  }
}

class _DeleteButton extends StatelessWidget {
  const _DeleteButton(
    this.onDelete, {
    required this.originalRating,
  });

  final double originalRating;
  final Function()? onDelete;

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;

    return OutlinedButton(
      onPressed:
          (originalRating > 0 && (onDelete != null)) ? () => onDelete!() : null,
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
