import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../routing/routes.dart';
import '../../core/extensions/build_context_extensions.dart';
import '../../core/widgets/error_text/error_text.dart';
import '../../features/movies/domain/movie_details.dart';
import '../../features/movies/provider/get_movie_details_provider.dart';
import '../../features/movies/provider/get_similar_movies_provider.dart';
import '../../features/person/provider/get_cast_provider.dart';
import '../play_button/play_button.dart';
import 'backdrop/backdrop.dart';
import 'movie_details_wrapper/movie_details_wrapper.dart';

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
      data: (details) => RefreshIndicator(
          onRefresh: () => Future(() {
                ref.invalidate(getMovieDetailsProvider(movieId));
                ref.invalidate(getCastProvider(movieId, 'movie'));
                ref.invalidate(getSimilarMoviesProvider(movieId));
              }),
          child: _MovieDetailsBody(details: details)),
      error: (error, stackTrace) {
        context.showErrorSnackBar(context.locale.getMovieDetailsError);

        return Column(
          children: [
            AppBar(),
            Expanded(
              child: Center(
                child: ErrorText(context.locale.unexpectedErrorMessage),
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

class _MovieDetailsBody extends HookWidget {
  const _MovieDetailsBody({required this.details});

  final MovieDetails details;

  @override
  Widget build(BuildContext context) {
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
            arguments: [details.id, 'movie'],
          ),
        )
      ],
    );
  }
}
