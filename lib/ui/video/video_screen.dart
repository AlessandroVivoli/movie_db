import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../core/extensions.dart';
import '../../core/widgets/errors/error_text.dart';
import '../../features/video/provider/get_videos_provider.dart';
import 'player/player.dart';

class VideoScreen extends ConsumerWidget {
  final int movieId;

  const VideoScreen({super.key, required this.movieId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final videos = ref.watch(getVideosProvider(movieId));

    final localization = AppLocalizations.of(context)!;

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
              child: Text(localization.noTrailer),
            );
          }

          return Player(video: videos.first);
        },
        error: (error, stackTrace) {
          context.showErrorSnackBar(localization.trailerError);

          return Center(
            child: ErrorText(localization.unexpectedErrorMessage),
          );
        },
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
