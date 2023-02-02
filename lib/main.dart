import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loggy/loggy.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/auth/provider/auth_provider.dart';
import 'features/local_storage/data/local_storage_repository.dart';
import 'features/local_storage/provider/local_storage_provider.dart';
import 'routing/router.dart';
import 'routing/routes.dart';
import 'themes/main_theme.dart';
import 'core/utils/loggers/provider_logger.dart';

void main() async {
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
      localStorageProvider.overrideWithValue(
        LocalStorageRepository(prefs),
      )
    ],
  );

  await container.read(authProvider.notifier).init();

  runApp(
    ProviderScope(
      observers: [
        ProviderLogger(),
      ],
      parent: container,
      child: const MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
