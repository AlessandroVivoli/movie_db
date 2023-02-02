import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loggy/loggy.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/loggers/provider_logger.dart';
import 'features/auth/provider/auth_provider.dart';
import 'features/local_storage/data/local_storage_repository.dart';
import 'features/local_storage/provider/local_storage_provider.dart';
import 'routing/router.dart';
import 'routing/routes.dart';
import 'themes/main_theme.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await dotenv.load();

  final prefs = await SharedPreferences.getInstance();

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

  final container = ProviderContainer(
    overrides: [
      localStorageProvider.overrideWithValue(LocalStorageRepository(prefs))
    ],
    observers: [
      ProviderLogger(),
    ],
  );

  await container.read(authProvider.notifier).init();

  runApp(
    UncontrolledProviderScope(
      container: container,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();

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
