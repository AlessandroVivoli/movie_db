import 'package:flutter/material.dart';

import '../../../../core/services/video_service.dart';
import '../../../core/models/movie/account_state/movie_account_state.dart';
import '../../../core/models/movie/details/movie_details.dart';
import '../../../core/providers/session_provider.dart';
import '../../../core/services/movie_service.dart';
import '../../../utils/routes.dart';
import '../../shared/widgets/errors/error_snack_bar_content.dart';
import '../../shared/widgets/errors/error_text.dart';
import 'backdrop/backdrop.dart';
import 'movie_details_wrapper/movie_details_wrapper.dart';
import 'play_button/play_button.dart';

class MovieDetailsScreen extends StatefulWidget {
  final int movieId;

  const MovieDetailsScreen({
    super.key,
    required this.movieId,
  });

  @override
  State<StatefulWidget> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        body: _MovieDetailsBuilder(
          widget: widget,
          scrollController: _scrollController,
        ),
      ),
    );
  }
}

class _MovieDetailsBuilder extends StatelessWidget {
  const _MovieDetailsBuilder({
    Key? key,
    required this.widget,
    required this.scrollController,
  }) : super(key: key);

  final MovieDetailsScreen widget;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getMovieDetails(widget.movieId),
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
                  arguments: VideoService.getVideos(movieId: data.id!),
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

  Future<MovieDetails> getMovieDetails(int id) async {
    final sessionId = SessionProvider.sessionId;

    MovieAccountState? state;

    if (sessionId != null) {
      state = await MovieService.getAccountMovieState(
        id: id,
        sessionId: sessionId,
      );
    }

    return MovieService.getMovieDetails(id: id).then(
      (details) => details.copyWith(state: state),
    );
  }
}
