import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/converters/date_time_converter.dart';
import '../../account/domain/account_media_status/account_media_status.dart';
import '../../genre/domain/genre.dart';
import '../../networks/domain/network.dart';
import '../../production/domain/production_company.dart';
import '../../production/domain/production_country.dart';
import '../../reviews/domain/review_list_model.dart';
import '../../spoken_language/domain/spoken_language.dart';
import 'episodes/tv_episode.dart';
import 'seasons/tv_season.dart';
import 'tv_show_creator.dart';

part 'tv_show_details.freezed.dart';
part 'tv_show_details.g.dart';

@freezed
class TVShowDetails with _$TVShowDetails {
  const factory TVShowDetails({
    required String? backdropPath,
    required List<TVShowCreator> createdBy,
    required List<int> episodeRunTime,
    @DateTimeConverter() required DateTime? firstAirDate,
    required List<Genre> genres,
    required String homepage,
    required int id,
    required bool inProduction,
    required List<String> languages,
    @DateTimeConverter() required DateTime? lastAirDate,
    required TVEpisode lastEpisodeToAir,
    required String name,
    required TVEpisode? nextEpisodeToAir,
    required List<Network> networks,
    required int numberOfEpisodes,
    required int numberOfSeasons,
    required List<String> originCountry,
    required String? orignalLanguage,
    required String originalName,
    required String overview,
    required double popularity,
    required String? posterPath,
    required List<ProductionCompany> productionCompanies,
    required List<ProductionCountry> productionCountries,
    required List<TVSeason> seasons,
    required List<SpokenLanguage> spokenLanguages,
    required String status,
    required String tagline,
    required String type,
    required double voteAverage,
    required int voteCount,
    required AccountMediaStatus? accountStates,
    required ReviewListModel reviews,
  }) = _TVShowDetails;

  factory TVShowDetails.fromJson(Map<String, Object?> json) =>
      _$TVShowDetailsFromJson(json);
}
