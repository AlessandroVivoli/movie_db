import 'package:flutter/material.dart';

import '../../../../core/models/movie/details/movie_details.dart';
import '../../../../core/services/video_service.dart';
import '../../../utils/routes.dart';
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
      child: Scaffold(
        body: FutureBuilder(
          future: widget.movieDetails,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            if (snapshot.hasError) {
              WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Could not get movie details')),
                );
              });

              return Column(
                children: [
                  AppBar(),
                  const Expanded(
                    child: Center(child: Text('Nothing found')),
                  ),
                ],
              );
            }

            if (!snapshot.hasData) {
              return Column(
                children: [
                  AppBar(),
                  const Expanded(
                    child: Center(child: Text('Nothing found')),
                  ),
                ],
              );
            }

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
          },
        ),
      ),
    );
  }
}
