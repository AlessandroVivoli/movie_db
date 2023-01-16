import 'package:flutter/material.dart';

import '../../../../core/models/movie/details/movie_details.dart';
import '../../../../core/services/video_service.dart';
import '../../../utils/routes.dart';
import '../../shared/widgets/errors/error_snack_bar_content.dart';
import '../../shared/widgets/errors/error_text.dart';
import 'backdrop/backdrop.dart';
import 'movie_details_wrapper/movie_details_wrapper.dart';
import 'play_button/play_button.dart';

class MovieDetailsScreen extends StatefulWidget {
  final Future<MovieDetails> movieDetails;

  const MovieDetailsScreen({super.key, required this.movieDetails});

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
            widget: widget, scrollController: _scrollController),
      ),
    );
  }
}

class _MovieDetailsBuilder extends StatelessWidget {
  const _MovieDetailsBuilder({
    Key? key,
    required this.widget,
    required ScrollController scrollController,
  })  : _scrollController = scrollController,
        super(key: key);

  final MovieDetailsScreen widget;
  final ScrollController _scrollController;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: widget.movieDetails,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final data = snapshot.data!;

          return Stack(
            children: [
              CustomScrollView(
                controller: _scrollController,
                slivers: [
                  MovieDetailsBackdrop(details: data),
                  SliverToBoxAdapter(
                    child: MovieDetailsWrapper(details: data),
                  )
                ],
              ),
              PlayButton(
                controller: _scrollController,
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
}
