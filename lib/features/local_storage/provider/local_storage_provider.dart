import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/local_storage_repository.dart';

part 'local_storage_provider.g.dart';

@Riverpod(keepAlive: true)
LocalStorageRepository localStorage(LocalStorageRef ref) {
  throw UnimplementedError();
}
