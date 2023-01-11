import 'package:flutter/material.dart';

import '../../../../core/models/movie/details/movie_details.dart';
import '../../../../core/services/video_service.dart';
import 'backdrop/backdrop.dart';
import 'play_button/play_button.dart';
import 'wrapper/movie_details_wrapper.dart';

class MovieDetailsScreen extends StatefulWidget {
  const MovieDetailsScreen({super.key});

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
    final args = ModalRoute.of(context)?.settings.arguments;

    final movieDetails = args as Future<MovieDetails>?;

    return SafeArea(
      child: FutureBuilder(
        future: movieDetails,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Scaffold(
              appBar: AppBar(),
              body: const Center(
                child: CircularProgressIndicator(),
              ),
            );
          }

          if (snapshot.hasError) {
            WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Could not get movie details')),
              );
            });

            return Scaffold(
              appBar: AppBar(),
              body: const Center(
                child: Text('Nothing found'),
              ),
            );
          }

          if (!snapshot.hasData) {
            return Scaffold(
              appBar: AppBar(),
              body: const Center(
                child: Text('Nothing found'),
              ),
            );
          }

          final data = snapshot.data!;

          return Scaffold(
            body: Stack(
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
                FloatingButton(
                  controller: _scrollController,
                  onPressed: () => Navigator.pushNamed(
                    context,
                    '/play',
                    arguments: VideoService.getVideos(movieId: data.id!),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
