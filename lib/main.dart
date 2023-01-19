import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:loggy/loggy.dart';

import 'core/providers/session_provider.dart';
import 'utils/router.dart';
import 'utils/routes.dart';
import 'utils/themes.dart';

void main() async {
  await dotenv.load();

  await SessionProvider.init();

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
      theme: mainTheme,
      initialRoute: AppRoute.home,
      onGenerateRoute: generateRoute,
    );
  }
}
