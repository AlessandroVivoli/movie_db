import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/models/movie/account_state/movie_account_state.dart';
import '../../../core/models/movie/details/movie_details.dart';
import '../../../core/providers/service_providers.dart';
import '../../../core/providers/session_provider.dart';
import '../../../core/services/movie_service.dart';
import '../../../utils/routes.dart';
import '../../shared/widgets/errors/error_snack_bar_content.dart';
import '../../shared/widgets/errors/error_text.dart';
import 'backdrop/backdrop.dart';
import 'movie_details_wrapper/movie_details_wrapper.dart';
import 'play_button/play_button.dart';

class MovieDetailsScreen extends HookWidget {
  final int movieId;

  const MovieDetailsScreen({
    super.key,
    required this.movieId,
  });

  @override
  Widget build(BuildContext context) {
    final scrollController = useScrollController();

    return SafeArea(
      top: false,
      child: Scaffold(
        body: _MovieDetailsBuilder(
          movieId: movieId,
          scrollController: scrollController,
        ),
      ),
    );
  }
}

class _MovieDetailsBuilder extends ConsumerWidget {
  const _MovieDetailsBuilder({
    Key? key,
    required this.movieId,
    required this.scrollController,
  }) : super(key: key);

  final int movieId;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movieService = ref.watch(movieServiceProvider);
    final videoService = ref.watch(videoServiceProvider);

    return FutureBuilder(
      future: getMovieDetails(movieId, movieService),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final data = snapshot.data!;

          return Stack(
            children: [
              CustomScrollView(
                controller: scrollController,
                slivers: [
                  MovieDetailsBackdrop(details: data),
                  SliverToBoxAdapter(
                    child: MovieDetailsWrapper(
                      details: data,
                    ),
                  )
                ],
              ),
              PlayButton(
                controller: scrollController,
                onPressed: () => Navigator.pushNamed(
                  context,
                  AppRoute.play,
                  arguments: videoService.getVideos(movieId: data.id),
                ),
              )
            ],
          );
        } else if (snapshot.hasError) {
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
        }

        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  Future<MovieDetails> getMovieDetails(
    int id,
    MovieService movieService,
  ) async {
    final sessionId = SessionProvider.sessionId;

    MovieAccountState? state;

    if (sessionId != null) {
      state = await movieService.getAccountMovieState(
        id: id,
        sessionId: sessionId,
      );
    }

    return movieService.getMovieDetails(id: id).then(
          (details) => details.copyWith(state: state),
        );
  }
}
