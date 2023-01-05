import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'core/providers/dio_provider.dart';
import 'ui/pages/home/home.dart';

void main() async {
  await dotenv.load();

  DioProvider.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlutterMovie',
      theme: ThemeData(
        colorScheme: const ColorScheme.dark().copyWith(
          primary: const Color.fromARGB(255, 217, 176, 22),
          background: const Color.fromARGB(255, 17, 25, 37),
          secondary: Colors.grey,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 17, 25, 37),
        ),
        tabBarTheme: const TabBarTheme(
            indicator: ShapeDecoration(
          shape: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromARGB(255, 217, 176, 22),
              width: 5,
            ),
          ),
        )),
        scaffoldBackgroundColor: const Color.fromARGB(255, 17, 25, 37),
        drawerTheme: const DrawerThemeData(
          backgroundColor: Color.fromARGB(255, 17, 25, 37),
        ),
      ),
      initialRoute: '/home',
      routes: {
        '/home': (context) => const HomePage(title: 'FlutterMovie'),
      },
    );
  }
}
