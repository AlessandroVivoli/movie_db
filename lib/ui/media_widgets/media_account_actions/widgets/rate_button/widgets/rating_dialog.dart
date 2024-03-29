import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../../../../../features/auth/provider/auth_provider.dart';
import '../../../../../../core/widgets/error_text/error_text.dart';
import '../../../../../../../../core/widgets/rating/rating.dart';
import '../../../../../../core/extensions/build_context_extensions.dart';
import 'confirm_button.dart';
import 'delete_button.dart';

class RatingDialog extends HookConsumerWidget {
  const RatingDialog({
    super.key,
    required this.rating,
    this.onRate,
  });

  final double rating;
  final Function(double? rating)? onRate;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final rating = useState(this.rating);
    final user = ref.watch(authProvider);

    return user.maybeWhen(
      loggedIn: (user) => Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            color: Theme.of(context).colorScheme.background,
            alignment: Alignment.center,
            width: 200,
            height: 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Rating(
                  size: 20,
                  rating: rating.value,
                  onRate: (index) {
                    rating.value = (index + 1) * 2;
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 80,
                      height: 36,
                      child: DeleteButton(
                        onDelete: (onRate != null) ? () => onRate!(null) : null,
                        originalRating: this.rating,
                      ),
                    ),
                    SizedBox(
                      width: 90,
                      height: 36,
                      child: ConfirmButton(
                        onRate: onRate,
                        rating: rating.value,
                        originalRating: this.rating,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      orElse: () => Center(
        child: ErrorText(context.locale.notLoggedInErrorMessage),
      ),
    );
  }
}
