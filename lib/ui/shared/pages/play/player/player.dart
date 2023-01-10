import 'package:flutter/cupertino.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../../../core/models/video/video.dart';

class Player extends StatefulWidget {
  final Video video;

  const Player({super.key, required this.video});

  @override
  State<Player> createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  late final YoutubePlayerController _controller;

  @override
  void initState() {
    _controller = YoutubePlayerController(initialVideoId: widget.video.key!);

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: YoutubePlayer(
        aspectRatio: 16 / 9,
        controller: _controller,
        bottomActions: const [],
        topActions: const [],
      ),
    );
  }
}
