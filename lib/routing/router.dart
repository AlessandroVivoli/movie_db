import 'package:flutter/material.dart';

import '../ui/account_details/account_details_screen.dart';
import '../ui/auth/login_screen.dart';
import '../ui/home/home_screen.dart';
import '../ui/movie_details/movie_details_screen.dart';
import '../ui/person_details/person_details_screen.dart';
import '../ui/tv_show/tv_details/tv_details_screen.dart';
import '../ui/video/video_screen.dart';
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
      final personId = settings.arguments as int;

      return MaterialPageRoute(
        builder: (context) => PersonDetailsScreen(
          personId: personId,
        ),
      );

    // VideoScreen
    case AppRoute.play:
      final movieId = settings.arguments as int;

      return MaterialPageRoute(
        builder: (context) => VideoScreen(
          movieId: movieId,
        ),
      );

    // LoginScreen
    case AppRoute.login:
      return MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      );

    // AccountDetailsScreen
    case AppRoute.account:
      return MaterialPageRoute(
        builder: (context) => const AccountDetailsScreen(),
      );

    case AppRoute.tv:
      final tvId = settings.arguments as int;

      return MaterialPageRoute(
        builder: (context) => TVDetailsScreen(
          tvId: tvId,
        ),
      );
    default:
      throw Exception('Route ${settings.name} doesn\'t exist');
  }
}
