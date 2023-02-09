import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/converters/date_time_converter.dart';
import 'review_author_details.dart';

part 'review.freezed.dart';
part 'review.g.dart';

@freezed
class Review with _$Review {
  const factory Review({
    required String author,
    required ReviewAuthorDetails authorDetails,
    required String content,
    @DateTimeConverter() required DateTime? createdAt,
    required String id,
    @DateTimeConverter() required DateTime? updatedAt,
    required String url,
  }) = _Review;

  factory Review.fromJson(Map<String, Object?> json) => _$ReviewFromJson(json);
}
