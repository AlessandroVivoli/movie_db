import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

YoutubePlayerController useYoutubePlayerController({
  required String initialVideoId,
  YoutubePlayerFlags flags = const YoutubePlayerFlags(),
}) {
  return use(
    _YoutubePlayerControllerHook(
      initialVideoId: initialVideoId,
      flags: flags,
    ),
  );
}

typedef __YoutubePlayerState
    = HookState<YoutubePlayerController, _YoutubePlayerControllerHook>;

class _YoutubePlayerControllerHook extends Hook<YoutubePlayerController> {
  const _YoutubePlayerControllerHook({
    required this.initialVideoId,
    required this.flags,
  });

  final String initialVideoId;
  final YoutubePlayerFlags flags;

  @override
  __YoutubePlayerState createState() => __YoutubePlayerControllerHookState();
}

class __YoutubePlayerControllerHookState extends __YoutubePlayerState {
  late final controller = YoutubePlayerController(
    initialVideoId: hook.initialVideoId,
    flags: hook.flags,
  );

  @override
  YoutubePlayerController build(BuildContext context) => controller;

  @override
  void dispose() => controller.dispose();

  @override
  String? get debugLabel => 'useYoutubePlayerController';
}
