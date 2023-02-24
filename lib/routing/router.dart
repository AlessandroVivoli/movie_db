import 'package:flutter/material.dart';

import '../ui/account_details/account_details_screen.dart';
import '../ui/home/home_screen.dart';
import '../ui/login/login_screen.dart';
import '../ui/movie_details/movie_details_screen.dart';
import '../ui/person_details/person_details_screen.dart';
import '../ui/tv_details/season_details/season_details.dart';
import '../ui/tv_details/tv_details_screen.dart';
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
      final arguments = settings.arguments as List<dynamic>;

      return MaterialPageRoute(
        builder: (context) => VideoScreen(
          mediaId: arguments[0],
          mediaType: arguments[1],
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

    case AppRoute.season:
    case AppRoute.episode:
      final seasonId = settings.arguments as int;

      return MaterialPageRoute(
          builder: (context) => SeasonDetails(seasonId: seasonId));
    default:
      throw Exception('Route ${settings.name} doesn\'t exist');
  }
}
