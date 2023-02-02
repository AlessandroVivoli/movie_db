import 'package:freezed_annotation/freezed_annotation.dart';

part 'video.freezed.dart';
part 'video.g.dart';

@freezed
class Video with _$Video {
  const Video._();

  const factory Video({
    required String? iso_649_1,
    required String? iso_3166_1,
    required String? name,
    required String? key,
    required String? site,
    required int size,
    required String? type,
    required bool official,
    required String? publishedAt,
    required String? id,
  }) = _Video;

  factory Video.fromJson(Map<String, Object?> json) => _$VideoFromJson(json);

  bool get isOfficial {
    return official;
  }

  bool get isTrailer {
    return type == 'Trailer';
  }

  bool get isYouTube {
    return site == 'YouTube';
  }
}
