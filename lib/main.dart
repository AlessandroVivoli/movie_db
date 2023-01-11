import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:loggy/loggy.dart';

import 'utils/routes.dart';

void main() async {
  await dotenv.load();

  Loggy.initLoggy(
    logOptions: const LogOptions(
      LogLevel.all,
      stackTraceLevel: LogLevel.error,
    ),
  );

  FlutterError.onError = (details) {
    FlutterError.presentError(details);

    if (!kDebugMode) {
      logError(details.toString(), details.stack);
    }
  };

  PlatformDispatcher.instance.onError = (error, stack) {
    logError(error, stack);
    return true;
  };

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: const Color.fromARGB(255, 17, 25, 37),
      title: 'FlutterMovie',
      theme: ThemeData(
        colorScheme: const ColorScheme.dark().copyWith(
          primary: const Color.fromARGB(255, 217, 176, 22),
          background: const Color.fromARGB(255, 17, 25, 37),
          secondary: Colors.grey,
        ),
        appBarTheme: const AppBarTheme(
            color: Color.fromARGB(255, 17, 25, 37),
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Color.fromARGB(255, 17, 25, 37),
            )),
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
      routes: routes,
      onGenerateRoute: onGenerateRoute,
    );
  }
}
