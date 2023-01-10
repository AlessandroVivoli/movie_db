import 'package:flutter/cupertino.dart';

import '../ui/pages/home/home.dart';
import '../ui/shared/pages/movie_details/movie_details.dart';
import '../ui/shared/pages/play/play.dart';

final Map<String, Widget Function(BuildContext)> routes = {
  '/home': (context) => const HomePage(title: 'FlutterMovie'),
  '/details': (context) => const MovieDetailsPage(),
  '/play': (context) => const PlayPage(),
};
