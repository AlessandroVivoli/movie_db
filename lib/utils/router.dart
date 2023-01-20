import 'package:flutter/material.dart';

import '../core/models/account/account_details.dart';
import '../core/models/person/details/person_details.dart';
import '../core/models/video/video.dart';
import '../ui/screens/account_details/account_details_screen.dart';
import '../ui/screens/auth/login_screen.dart';
import '../ui/screens/home/home_screen.dart';
import '../ui/screens/movie_details/movie_details_screen.dart';
import '../ui/screens/person_details/person_details_screen.dart';
import '../ui/screens/video/video_screen.dart';
import 'routes.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    // HomeScreen
    case AppRoute.home:
      return MaterialPageRoute(
        builder: (context) => const HomeScreen(title: 'FlutterMovie'),
      );

    // MovieDetailsScreen
    case AppRoute.movie:
      final movieId = settings.arguments as int;

      return MaterialPageRoute(
        builder: (context) => MovieDetailsScreen(
          movieId: movieId,
        ),
      );

    // PersonDetailsScreen
    case AppRoute.person:
      final personDetails = settings.arguments as Future<PersonDetails>;

      return MaterialPageRoute(
        builder: (context) => PersonDetailsScreen(
          personDetails: personDetails,
        ),
      );

    // VideoScreen
    case AppRoute.play:
      final videoList = settings.arguments as Future<List<Video>>;

      return MaterialPageRoute(
        builder: (context) => VideoScreen(
          videoList: videoList,
        ),
      );

    // LoginScreen
    case AppRoute.login:
      return MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      );

    // AccountDetailsScreen
    case AppRoute.account:
      final accountDetails = settings.arguments as AccountDetails;

      return MaterialPageRoute(
        builder: (context) => AccountDetailsScreen(
          accountDetails: accountDetails,
        ),
      );
    default:
      throw Exception('Route ${settings.name} doesn\'t exist');
  }
}
