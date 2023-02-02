import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../dio/provider/dio_provider.dart';
import '../data/movie_service.dart';
import '../domain/i_movie_service.dart';

final movieServiceProvider = Provider<IMovieService>(
  name: 'MovieServiceProvider',
  (ref) => MovieService(ref.watch(dioProvider)),
);
