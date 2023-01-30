import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loggy/loggy.dart';

import '../../../../../../../core/providers/account_service_provider.dart';
import '../../../../../../../core/providers/auth_provider.dart';
import '../../../../../../../utils/extensions.dart';
import '../../../../../../shared/widgets/errors/error_text.dart';

class FavoriteButton extends HookConsumerWidget {
  const FavoriteButton({
    super.key,
    required this.favorite,
    required this.movieId,
  });

  final bool favorite;
  final int movieId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authProvider);
    final accountService = ref.watch(accountServiceProvider);

    final favorited = useState(favorite);

    final controller = useAnimationController(
      duration: const Duration(milliseconds: 250),
      lowerBound: .15,
      upperBound: .6,
    );

    controller.forward();
    controller.stop();

    final animation = useMemoized(
      () => CurvedAnimation(
        parent: controller,
        curve: Curves.elasticOut,
      ),
    );

    return user.maybeWhen(
      loggedIn: (user) => IconButton(
        onPressed: () async {
          final code = await accountService
              .markMovieAsFavorite(
                accountId: user.accountDetails.id,
                favorite: !favorited.value,
                movieId: movieId,
                sessionId: user.sessionId,
              )
              .catchError((error) => showError(context, error));

          if (code != -1) {
            favorited.value = !favorited.value;
          }
        },
        icon: ScaleTransition(
          scale: animation,
          child: FaIcon(
            buildIcon(favorited.value),
            color: buildColor(favorited.value, context),
          ),
        ),
      ),
      orElse: () => const ErrorText('You\'re not logged in.'),
    );
  }

  int showError(BuildContext context, DioError error) {
    final message = (favorite)
        ? 'Could not remove movie from favorites.'
        : 'Could not add movie to favorites.';

    logError(message, error.error, error.stackTrace);

    context.showErrorSnackBar(message);

    return -1;
  }

  IconData? buildIcon(bool favorite) {
    return (favorite) ? FontAwesomeIcons.solidHeart : FontAwesomeIcons.heart;
  }

  Color? buildColor(bool favorite, BuildContext context) {
    return (favorite) ? Colors.pink : Theme.of(context).colorScheme.primary;
  }
}
