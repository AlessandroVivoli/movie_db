import 'package:freezed_annotation/freezed_annotation.dart';

import 'review.dart';

part 'review_list_model.freezed.dart';
part 'review_list_model.g.dart';

@freezed
class ReviewListModel with _$ReviewListModel {
  const factory ReviewListModel({
    required int? id,
    required int page,
    required List<Review> results,
    required int totalPages,
    required int totalResults,
  }) = _ReviewListModel;

  factory ReviewListModel.fromJson(Map<String, Object?> json) =>
      _$ReviewListModelFromJson(json);
}
