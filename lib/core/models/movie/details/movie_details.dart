import 'package:freezed_annotation/freezed_annotation.dart';

import '../../genre/genre.dart';
import '../../production_company/production_company.dart';
import '../../production_country/production_country.dart';
import '../../spoken_language/spoken_language.dart';
import '../account_state/movie_account_state.dart';

part 'movie_details.freezed.dart';
part 'movie_details.g.dart';

@freezed
class MovieDetails with _$MovieDetails {
  const factory MovieDetails({
    required bool adult,
    required String? backdropPath,
    required int budget,
    required List<Genre> genres,
    required String? homepage,
    required int id,
    required String? imdbId,
    required String? originalLanguage,
    required String? originalTitle,
    required String? overview,
    required double? popularity,
    required String? posterPath,
    required List<ProductionCompany>? productionCompanies,
    required List<ProductionCountry>? productionCountries,
    required String? releaseDate,
    required int revenue,
    required int runtime,
    required List<SpokenLanguage> spokenLanguages,
    required String? status,
    required String? tagline,
    required bool video,
    required double voteAverage,
    required int voteCount,
    required MovieAccountState? state,
  }) = _MovieDetails;

  factory MovieDetails.fromJson(Map<String, Object?> json) =>
      _$MovieDetailsFromJson(json);
}
