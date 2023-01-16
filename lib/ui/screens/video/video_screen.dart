import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../core/models/video/video.dart';
import '../../shared/widgets/errors/error_snack_bar_content.dart';
import '../../shared/widgets/errors/error_text.dart';
import 'player/player.dart';

class VideoScreen extends StatelessWidget {
  final Future<List<Video>> videoList;

  const VideoScreen({super.key, required this.videoList});

  @override
  Widget build(BuildContext context) {
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
      body: FutureBuilder(
        future: videoList,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.isEmpty) {
              return const Center(
                child: Text('No video found.'),
              );
            }

            final data = snapshot.data;

            final videos = data!.where(
              (video) => video.isOfficial && video.isTrailer && video.isYouTube,
            );

            if (videos.isEmpty) {
              return const Center(
                child: Text('No video found.'),
              );
            }

            final video = videos.first;

            return Player(video: video);
          } else if (snapshot.hasError) {
            WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Theme.of(context).colorScheme.surface,
                  content: const ErrorSnackBarContent(
                    message: 'Cannot play movie trailer',
                  ),
                ),
              );
            });

            return const Center(
              child: ErrorText('Something went wrong.'),
            );
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
