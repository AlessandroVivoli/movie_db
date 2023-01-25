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

class _YoutubePlayerControllerHook extends Hook<YoutubePlayerController> {
  const _YoutubePlayerControllerHook(
      {required this.initialVideoId, required this.flags});

  final String initialVideoId;
  final YoutubePlayerFlags flags;

  @override
  HookState<YoutubePlayerController, Hook<YoutubePlayerController>>
      createState() => __YoutubePlayerControllerHookState();
}

class __YoutubePlayerControllerHookState
    extends HookState<YoutubePlayerController, _YoutubePlayerControllerHook> {
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
