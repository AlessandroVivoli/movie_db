import 'package:flutter/cupertino.dart';

import '../ui/pages/home/home.dart';
import '../ui/pages/movie_details/movie_details.dart';

final Map<String, Widget Function(BuildContext)> routes = {
  '/home': (context) => const HomePage(title: 'FlutterMovie'),
  '/details': (context) => const MovieDetailsPage(),
};
