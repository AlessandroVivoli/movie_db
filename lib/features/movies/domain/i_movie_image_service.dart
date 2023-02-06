import 'backdrop_sizes_enum.dart';
import 'movie_images.dart';
import 'poster_sizes_enum.dart';

abstract class IMovieImageService {
  const IMovieImageService();

  String? getMovieBackdropUrl({required BackdropSizes size, String? path});

  String? getMoviePosterUrl({required PosterSizes size, String? path});

  Future<MovieImages> getMovieImages({required int id});
}
