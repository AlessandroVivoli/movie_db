import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/models/movie/details/movie_details.dart';
import '../../../core/providers/movie_provider.dart';
import '../../../utils/extensions.dart';
import '../../../utils/routes.dart';
import '../../shared/widgets/errors/error_text.dart';
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

    return movieDetails.when(
      data: (details) => _MovieDetailsBody(details: details),
      error: (error, stackTrace) {
        context.showErrorSnackBar('Could not get movie details.');

        return Column(
          children: [
            AppBar(),
            const Expanded(
              child: Center(
                child: ErrorText('Something went wrong.'),
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
