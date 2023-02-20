import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../core/extensions/build_context_extensions.dart';
import '../../core/widgets/errors/error_text.dart';
import '../../features/video/provider/get_videos_provider.dart';
import 'player/player.dart';

class VideoScreen extends ConsumerWidget {
  final int mediaId;
  final String mediaType;

  const VideoScreen({
    super.key,
    required this.mediaId,
    required this.mediaType,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final videos = ref.watch(getVideosProvider(mediaId, mediaType));

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
            return Center(
              child: Text(context.locale.noTrailer),
            );
          }

          return Player(video: videos.first);
        },
        error: (error, stackTrace) {
          context.showErrorSnackBar(context.locale.trailerError);

          return Center(
            child: ErrorText(context.locale.unexpectedErrorMessage),
          );
        },
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
