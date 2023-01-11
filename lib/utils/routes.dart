import 'package:flutter/material.dart';

import '../core/models/movie/details/movie_details.dart';
import '../core/models/video/video.dart';
import '../ui/pages/home_screen/home_screen.dart';
import '../ui/pages/movie_details_screen/movie_details_screen.dart';
import '../ui/pages/player_screen/player_screen.dart';
import 'enums.dart';

final Map<String, Widget Function(BuildContext)> routes = {
  '/home': (context) => const HomeScreen(title: 'FlutterMovie'),
};

Route<dynamic>? onGenerateRoute(RouteSettings settings) {
  if (settings.name == RouteNames.movieDetails.name) {
    if (settings.arguments == null) return null;

    final movieDetails = settings.arguments as Future<MovieDetails>;

    return MaterialPageRoute(
      builder: (_) => MovieDetailsScreen(movieDetails: movieDetails),
    );
  }

  if (settings.name == RouteNames.player.name) {
    if (settings.arguments == null) return null;

    final videoList = settings.arguments as Future<List<Video>>;

    return MaterialPageRoute(
      builder: (_) => PlayerScreen(videoList: videoList),
    );
  }

  return null;
}
