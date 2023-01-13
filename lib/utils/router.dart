import 'package:flutter/material.dart';

import '../core/models/movie/details/movie_details.dart';
import '../core/models/person/details/person_details.dart';
import '../core/models/video/video.dart';
import '../ui/screens/home/home.dart';
import '../ui/screens/movie_details/movie_details.dart';
import '../ui/screens/person_details/person_details.dart';
import '../ui/screens/video/video.dart';
import 'routes.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRoute.home:
      return MaterialPageRoute(
        builder: (context) => const HomeScreen(title: 'FlutterMovie'),
      );
    case AppRoute.movie:
      final movieDetails = settings.arguments as Future<MovieDetails>;

      return MaterialPageRoute(
        builder: (context) => MovieDetailsScreen(movieDetails: movieDetails),
      );
    case AppRoute.person:
      final personDetails = settings.arguments as Future<PersonDetails>;

      return MaterialPageRoute(
        builder: (context) => PersonDetailsScreen(personDetails: personDetails),
      );
    case AppRoute.play:
      final videoList = settings.arguments as Future<List<Video>>;

      return MaterialPageRoute(
        builder: (context) => VideoScreen(videoList: videoList),
      );
    default:
      throw Exception('Route ${settings.name} doesn\'t exist');
  }
}
