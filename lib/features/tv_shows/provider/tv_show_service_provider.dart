import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../dio/provider/dio_provider.dart';
import '../data/tv_show_service.dart';
import '../domain/i_tv_show_service.dart';

part 'tv_show_service_provider.g.dart';

@riverpod
ITVShowService tvShowService(TvShowServiceRef ref) =>
    TVShowService(ref.watch(dioProvider));
