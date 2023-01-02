import 'package:flutter/material.dart';
import 'package:movie_db/ui/pages/home/home.dart';

void main() {
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
          secondary: Colors.grey,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 17, 25, 37),
        ),
        scaffoldBackgroundColor: const Color.fromARGB(255, 17, 25, 37),
        drawerTheme: const DrawerThemeData(
          backgroundColor: Color.fromARGB(255, 17, 25, 37),
        ),
      ),
      initialRoute: "/home",
      routes: {
        "/home": (context) => const HomePage(title: "FlutterMovie"),
      },
    );
  }
}
