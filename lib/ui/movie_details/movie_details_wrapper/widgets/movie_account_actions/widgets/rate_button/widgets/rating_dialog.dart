import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../../../../../features/auth/provider/auth_provider.dart';
import '../../../../../../../../core/widgets/errors/error_text.dart';
import '../../../../../../../../core/widgets/rating/rating.dart';
import 'confirm_button.dart';
import 'delete_button.dart';

class RatingDialog extends HookConsumerWidget {
  const RatingDialog({super.key, required this.rating, required this.movieId});

  final double rating;
  final int movieId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final rating = useState(this.rating);
    final user = ref.watch(authProvider);

    final localization = AppLocalizations.of(context)!;

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
                        movieId: movieId,
                        originalRating: this.rating,
                        user: user,
                      ),
                    ),
                    SizedBox(
                      width: 90,
                      height: 36,
                      child: ConfirmButton(
                        rating: rating.value,
                        movieId: movieId,
                        originalRating: this.rating,
                        user: user,
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
        child: ErrorText(localization.notLoggedInErrorMessage),
      ),
    );
  }
}
