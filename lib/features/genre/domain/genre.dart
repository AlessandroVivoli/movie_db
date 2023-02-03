import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'genre.freezed.dart';
part 'genre.g.dart';

@freezed
class Genre with _$Genre {
  const Genre._();

  const factory Genre({
    required int id,
    required String name,
  }) = _Genre;

  factory Genre.fromJson(Map<String, Object?> json) => _$GenreFromJson(json);

  String getName(Locale locale) {
    switch (locale.languageCode) {
      case 'hr':
        return _genreLocales[locale.languageCode]![id]!;
      default:
        return name;
    }
  }
}

final Map<String, Map<int, String>> _genreLocales = {
  'hr': {
    28: 'Akcija',
    12: 'Avantura',
    16: 'Animirani',
    35: 'Komedija',
    80: 'Kriminalni',
    99: 'Dokumentarac',
    18: 'Drama',
    10751: 'Obiteljski',
    14: 'Fantasy',
    36: 'Povijesni',
    27: 'Horor',
    10402: 'Glazbeni',
    9648: 'Misterij',
    10749: 'Romantički',
    878: 'Znanstvena Fantastika',
    10770: 'TV Film',
    53: 'Triler',
    10752: 'Ratni',
    37: 'Western',
  }
};
