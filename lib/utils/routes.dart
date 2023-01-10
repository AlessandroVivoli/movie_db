import 'package:flutter/cupertino.dart';

import '../ui/pages/home_screen/home_screen.dart';
import '../ui/pages/movie_details_screen/movie_details_screen.dart';
import '../ui/pages/player_screen/player_screen.dart';

final Map<String, Widget Function(BuildContext)> routes = {
  '/home': (context) => const HomeScreen(title: 'FlutterMovie'),
  '/details': (context) => const MovieDetailsScreen(),
  '/play': (context) => const PlayerScreen(),
};
