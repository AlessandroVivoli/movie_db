import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../core/models/video/video.dart';
import 'player/player.dart';

class PlayerScreen extends StatelessWidget {
  const PlayerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments;

    final videoList = args as Future<List<Video>>?;

    final actionButton = FloatingActionButton(
      onPressed: () => Navigator.pop(context),
      backgroundColor: Colors.white.withOpacity(.75),
      foregroundColor: Colors.transparent,
      child: const Icon(Icons.close),
    );

    const actionButtonLocation = FloatingActionButtonLocation.endTop;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        toolbarHeight: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.black,
        ),
      ),
      floatingActionButtonLocation: actionButtonLocation,
      floatingActionButton: actionButton,
      body: FutureBuilder(
        future: videoList,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Cannot play movie trailer')),
              );
            });

            return const Center(
              child: Text('No video found'),
            );
          }

          if (!snapshot.hasData) {
            return const Center(
              child: Text('No video found'),
            );
          }

          final data = snapshot.data;

          final videos = data?.where(
            (video) =>
                video.official &&
                video.type == 'Trailer' &&
                video.site == 'YouTube',
          );

          if (videos == null || videos.isEmpty) {
            return const Center(
              child: Text('No video found'),
            );
          }

          final video = videos.first;

          return Player(video: video);
        },
      ),
    );
  }
}
