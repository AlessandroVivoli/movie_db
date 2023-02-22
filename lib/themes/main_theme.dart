import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData mainTheme = ThemeData(
  colorScheme: const ColorScheme.dark().copyWith(
    primary: const Color.fromARGB(255, 217, 176, 22),
    background: const Color.fromARGB(255, 17, 25, 37),
    secondary: Colors.grey,
    surface: const Color.fromARGB(255, 29, 45, 70),
  ),
  snackBarTheme: const SnackBarThemeData(
    backgroundColor: Color.fromARGB(255, 29, 45, 70),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Color.fromARGB(255, 217, 176, 22),
    foregroundColor: Colors.white,
  ),
  appBarTheme: const AppBarTheme(
    color: Color.fromARGB(255, 17, 25, 37),
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Color.fromARGB(255, 17, 25, 37),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      side: const BorderSide(
        color: Color.fromARGB(255, 217, 176, 22),
        width: 2,
      ),
    ),
  ),
  tabBarTheme: const TabBarTheme(
    indicator: ShapeDecoration(
      shape: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Color.fromARGB(255, 217, 176, 22),
          width: 2.5,
        ),
      ),
    ),
  ),
  scaffoldBackgroundColor: const Color.fromARGB(255, 17, 25, 37),
  drawerTheme: const DrawerThemeData(
    backgroundColor: Color.fromARGB(255, 17, 25, 37),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: const Color.fromARGB(255, 16, 28, 41),
    selectedItemColor: const Color.fromARGB(255, 217, 176, 22),
    unselectedItemColor: Colors.grey.shade700,
  ),
);
