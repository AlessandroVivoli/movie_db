import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../services/local_storage_repository.dart';

final localStorageFutureProvider = FutureProvider((ref) async {
  final preferences = await SharedPreferences.getInstance();
  return LocalStorageRepository(preferences);
});

final localStorageProvider = Provider(
  (ref) => ref
      .watch(localStorageFutureProvider)
      .maybeWhen(data: (data) => data, orElse: () => null),
);
