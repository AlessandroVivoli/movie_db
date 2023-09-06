import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../domain/tv_show_details.dart';
import 'tv_show_service_provider.dart';

part 'get_tv_details_provider.g.dart';

@riverpod
Future<TVShowDetails> getTVDetails(GetTVDetailsRef ref, int id) {
  return ref.read(tvShowServiceProvider).getTVShowDetails(id: id);
}
