import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loggy/loggy.dart';

import '../../../core/providers/video_provider.dart';
import '../../shared/widgets/errors/error_snack_bar_content.dart';
import '../../shared/widgets/errors/error_text.dart';
import 'player/player.dart';

class VideoScreen extends ConsumerWidget {
  final int movieId;

  const VideoScreen({super.key, required this.movieId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final videos = ref.watch(getVideosProvider(movieId));

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        toolbarHeight: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.black,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pop(context),
        backgroundColor: Colors.white.withOpacity(.75),
        foregroundColor: Colors.black,
        child: const Icon(Icons.close),
      ),
      body: videos.when(
        data: (videoList) {
          final videos = videoList.where(
            (video) => video.isOfficial && video.isTrailer && video.isYouTube,
          );

          if (videos.isEmpty) {
            return const Center(
              child: Text('No video found.'),
            );
          }

          return Player(video: videos.first);
        },
        error: (error, stackTrace) {
          logError('Cannot play movie trailer.', error, stackTrace);

          WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Theme.of(context).colorScheme.surface,
                content: const ErrorSnackBarContent(
                  message: 'Cannot play movie trailer.',
                ),
              ),
            );
          });

          return const Center(
            child: ErrorText('Something went wrong.'),
          );
        },
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
