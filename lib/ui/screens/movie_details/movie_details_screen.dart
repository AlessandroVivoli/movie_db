import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loggy/loggy.dart';

import '../../../core/models/movie/details/movie_details.dart';
import '../../../core/providers/movie_provider.dart';
import '../../../utils/routes.dart';
import '../../shared/widgets/errors/error_snack_bar_content.dart';
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
        body: _MovieDetailsBuilder(
          movieId: movieId,
        ),
      ),
    );
  }
}

class _MovieDetailsBuilder extends ConsumerWidget {
  const _MovieDetailsBuilder({
    Key? key,
    required this.movieId,
  }) : super(key: key);

  final int movieId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movieDetails = ref.watch(getMovieDetailsProvider(movieId));

    return movieDetails.when(
      data: (details) => _MovieDetailsHookBuilder(details: details),
      error: (error, stackTrace) {
        logError('Could not get movie details.', error, stackTrace);

        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Theme.of(context).colorScheme.surface,
              content: const ErrorSnackBarContent(
                message: 'Could not get movie details.',
              ),
            ),
          );
        });

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

class _MovieDetailsHookBuilder extends StatelessWidget {
  const _MovieDetailsHookBuilder({
    Key? key,
    required this.details,
  }) : super(key: key);

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
