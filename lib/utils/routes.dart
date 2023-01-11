import 'package:flutter/cupertino.dart';

import '../ui/pages/home_screen/home_screen.dart';

final Map<String, Widget Function(BuildContext)> routes = {
  '/home': (context) => const HomeScreen(title: 'FlutterMovie'),
};
