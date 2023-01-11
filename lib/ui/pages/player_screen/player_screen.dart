import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../core/models/video/video.dart';
import 'player/player.dart';

class PlayerScreen extends StatelessWidget {
  final Future<List<Video>> videoList;

  const PlayerScreen({super.key, required this.videoList});

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
