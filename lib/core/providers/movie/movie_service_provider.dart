import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../interfaces/i_movie_service.dart';
import '../../services/movie_service.dart';
import '../dio/dio_provider.dart';

final movieServiceProvider = Provider<IMovieService>(
  name: 'MovieServiceProvider',
  (ref) => MovieService(ref.watch(dioProvider)),
);
