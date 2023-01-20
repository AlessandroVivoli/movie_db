import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../../../core/providers/session_provider.dart';
import '../../../../../../../core/services/account_service.dart';
import '../../../../../../shared/widgets/errors/error_snack_bar_content.dart';

class FavoriteButton extends StatefulWidget {
  const FavoriteButton({
    super.key,
    required this.favorite,
    required this.movieId,
    required this.accountId,
  });

  final bool favorite;
  final int movieId;
  final int accountId;

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton>
    with TickerProviderStateMixin {
  late bool _favorite;

  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    _favorite = widget.favorite;

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
      lowerBound: .15,
      upperBound: .6,
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.elasticOut,
    );

    if (_favorite) {
      _controller.reverse();
    } else {
      _controller.forward();
    }

    _controller.stop();

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onFavorite,
      icon: ScaleTransition(
        scale: _animation,
        child: FaIcon(
          buildIcon(),
          color: buildColor(),
        ),
      ),
    );
  }

  void onFavorite() async {
    final code = await AccountService.markMovieAsFavorite(
      accountId: widget.accountId,
      favorite: !_favorite,
      movieId: widget.movieId,
      sessionId: SessionProvider.sessionId!,
    ).catchError((_) {
      ScaffoldMessenger.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(
          SnackBar(
            content: ErrorSnackBarContent(
              message: (_favorite)
                  ? 'Could not remove movie from favorites.'
                  : 'Could not add movie to favorites.',
            ),
          ),
        );

      return -1;
    });

    if (code != -1) {
      setState(() {
        _favorite = !_favorite;

        if (!_favorite) {
          _controller.forward();
        } else {
          _controller.reverse();
        }
      });
    }
  }

  IconData? buildIcon() {
    return (_favorite) ? FontAwesomeIcons.solidHeart : FontAwesomeIcons.heart;
  }

  Color? buildColor() {
    return (_favorite) ? Colors.pink : Theme.of(context).colorScheme.primary;
  }
}
