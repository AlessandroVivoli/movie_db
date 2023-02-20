import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../localization/provider/locale_state_provider.dart';
import '../data/query_interceptor.dart';

part 'query_interceptor_provider.g.dart';

@Riverpod(keepAlive: true)
class QueryInterceptorState extends _$QueryInterceptorState {
  @override
  QueryInterceptor build() => QueryInterceptor(
        locale: ref.watch(localeStateProvider),
      );
}
