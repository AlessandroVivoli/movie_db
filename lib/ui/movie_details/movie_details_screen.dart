import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../routing/routes.dart';
import '../../core/extensions.dart';
import '../../core/widgets/errors/error_text.dart';
import '../../features/movies/domain/movie_details.dart';
import '../../features/movies/provider/get_movie_details_provider.dart';
import 'backdrop/backdrop.dart';
import 'movie_details_wrapper/movie_details_wrapper.dart';
import 'play_button/play_button.dart';

class MovieDetailsScreen extends StatelessWidget {
  final int movieId;

  const MovieDetailsScreen({
    super.key,
    required this.movieId,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        body: _MovieDetailsWrapper(
          movieId: movieId,
        ),
      ),
    );
  }
}

class _MovieDetailsWrapper extends ConsumerWidget {
  const _MovieDetailsWrapper({
    required this.movieId,
  });

  final int movieId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movieDetails = ref.watch(getMovieDetailsProvider(movieId));

    final localization = AppLocalizations.of(context)!;

    return movieDetails.when(
      data: (details) => _MovieDetailsBody(details: details),
      error: (error, stackTrace) {
        context.showErrorSnackBar(localization.getMovieDetailsError);

        return Column(
          children: [
            AppBar(),
            Expanded(
              child: Center(
                child: ErrorText(localization.unexpectedErrorMessage),
              ),
            ),
          ],
        );
      },
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

class _MovieDetailsBody extends StatelessWidget {
  const _MovieDetailsBody({
    required this.details,
  });

  final MovieDetails details;

  @override
  Widget build(BuildContext context) {
    return HookBuilder(
      builder: (context) {
        final scrollController = useScrollController();

        return Stack(
          children: [
            CustomScrollView(
              controller: scrollController,
              slivers: [
                MovieDetailsBackdrop(details: details),
                SliverToBoxAdapter(
                  child: MovieDetailsWrapper(
                    details: details,
                  ),
                )
              ],
            ),
            PlayButton(
              controller: scrollController,
              onPressed: () => Navigator.pushNamed(
                context,
                AppRoute.play,
                arguments: details.id,
              ),
            )
          ],
        );
      },
    );
  }
}
