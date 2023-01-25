import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../../../core/providers/account_provider.dart';
import '../../../../../../../core/providers/general_providers.dart';
import '../../../../../../../core/providers/session_provider.dart';
import '../../../../../../shared/widgets/errors/error_snack_bar_content.dart';

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
    final accountId = ref.watch(accountDetailsStateProvider)!.id;
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

    return IconButton(
      onPressed: () async {
        final code = await accountService
            .markMovieAsFavorite(
          accountId: accountId,
          favorite: !favorited.value,
          movieId: movieId,
          sessionId: SessionProvider.sessionId!,
        )
            .catchError((_) {
          ScaffoldMessenger.of(context)
            ..removeCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: ErrorSnackBarContent(
                  message: (favorite)
                      ? 'Could not remove movie from favorites.'
                      : 'Could not add movie to favorites.',
                ),
              ),
            );

          return -1;
        });

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
    );
  }

  IconData? buildIcon(bool favorite) {
    return (favorite) ? FontAwesomeIcons.solidHeart : FontAwesomeIcons.heart;
  }

  Color? buildColor(bool favorite, BuildContext context) {
    return (favorite) ? Colors.pink : Theme.of(context).colorScheme.primary;
  }
}
