import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';

import '../../../../core/models/video/video.dart';
import 'player/player.dart';

class PlayPage extends StatelessWidget {
  const PlayPage({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments;

    final videoList = args as Future<List<Video>>?;

    return FutureBuilder(
      future: videoList,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
            floatingActionButton: FloatingActionButton(
              onPressed: () => Navigator.pop(context),
              backgroundColor: Colors.white.withOpacity(.75),
              foregroundColor: Colors.transparent,
              child: const Icon(Icons.close),
            ),
            body: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        if (snapshot.hasError) {
          SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Cannot play movie trailer')),
            );
          });

          return Scaffold(
            floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
            floatingActionButton: FloatingActionButton(
              onPressed: () => Navigator.pop(context),
              backgroundColor: Colors.white.withOpacity(.75),
              foregroundColor: Colors.black,
              child: const Icon(Icons.close),
            ),
            body: const Center(
              child: Text('No video found'),
            ),
          );
        }

        if (!snapshot.hasData) {
          return Scaffold(
            floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
            floatingActionButton: FloatingActionButton(
              onPressed: () => Navigator.pop(context),
              backgroundColor: Colors.white.withOpacity(.75),
              foregroundColor: Colors.black,
              child: const Icon(Icons.close),
            ),
            body: const Center(
              child: Text('No video found'),
            ),
          );
        }

        final data = snapshot.data;

        final video = data
            ?.where(
              (video) =>
                  video.official &&
                  video.type == 'Trailer' &&
                  video.site == 'YouTube',
            )
            .first;

        if (video == null) {
          return Scaffold(
            floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
            floatingActionButton: FloatingActionButton(
              onPressed: () => Navigator.pop(context),
              backgroundColor: Colors.white.withOpacity(.75),
              foregroundColor: Colors.black,
              child: const Icon(Icons.close),
            ),
            body: const Center(
              child: Text('No video found'),
            ),
          );
        }

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
          body: Player(video: video),
        );
      },
    );
  }
}
