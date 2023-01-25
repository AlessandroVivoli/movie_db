import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../../../core/models/video/video.dart';
import '../../../../core/hooks/youtube_player_hook.dart';

class Player extends HookWidget {
  final Video video;

  const Player({super.key, required this.video});

  @override
  Widget build(BuildContext context) {
    final controller = useYoutubePlayerController(
      initialVideoId: video.key!,
    );

    return Center(
      child: YoutubePlayer(
        aspectRatio: 16 / 9,
        controller: controller,
        onEnded: (_) => Navigator.pop(context),
        bottomActions: const [],
        topActions: const [],
      ),
    );
  }
}
