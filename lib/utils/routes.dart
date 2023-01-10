import 'package:flutter/cupertino.dart';

import '../ui/pages/home_screen/home_screen.dart';
import '../ui/shared/pages/movie_details/movie_details.dart';
import '../ui/shared/pages/player_screen/player_screen.dart';

final Map<String, Widget Function(BuildContext)> routes = {
  '/home': (context) => const HomeScreen(title: 'FlutterMovie'),
  '/details': (context) => const MovieDetailsPage(),
  '/play': (context) => const PlayerScreen(),
};
