import 'package:freezed_annotation/freezed_annotation.dart';

part 'review_author_details.freezed.dart';
part 'review_author_details.g.dart';

@freezed
class ReviewAuthorDetails with _$ReviewAuthorDetails {
  const factory ReviewAuthorDetails({
    required String name,
    required String username,
    required String? avatarPath,
    required double? rating,
  }) = _ReviewAuthorDetails;

  factory ReviewAuthorDetails.fromJson(Map<String, Object?> json) =>
      _$ReviewAuthorDetailsFromJson(json);
}
