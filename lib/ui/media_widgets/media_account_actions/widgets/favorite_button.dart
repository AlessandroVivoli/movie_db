import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../../../features/auth/provider/auth_provider.dart';
import '../../../../../../core/extensions/build_context_extensions.dart';
import '../../../../core/widgets/error_text/error_text.dart';
import '../../../../features/account/provider/favorites/add_to_favorites_provider.dart';

class FavoriteButton extends ConsumerWidget {
  const FavoriteButton({
    super.key,
    required this.favorite,
    this.onFavoritePressed,
  });

  final bool favorite;
  final Function(bool favorite)? onFavoritePressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authProvider);

    final loading = ref.watch(favoritesProvider).maybeWhen(
          loading: () => true,
          orElse: () => false,
        );

    ref.listen(
      favoritesProvider,
      (previous, next) {
        next.whenOrNull(
          error: (error, stackTrace) {
            context.showErrorSnackBar(
              !favorite
                  ? context.locale.addFavoriteError
                  : context.locale.removeFavoriteError,
            );
          },
        );
      },
    );

    return user.maybeWhen(
      loggedIn: (user) => IconButton(
        onPressed: (loading || (onFavoritePressed == null))
            ? null
            : () => onFavoritePressed!(!favorite),
        icon: FaIcon(
          (favorite) ? FontAwesomeIcons.solidHeart : FontAwesomeIcons.heart,
          color:
              (favorite) ? Colors.pink : Theme.of(context).colorScheme.primary,
        ),
      ),
      orElse: () => ErrorText(context.locale.notLoggedInErrorMessage),
    );
  }
}
