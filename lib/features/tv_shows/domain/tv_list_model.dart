import 'package:freezed_annotation/freezed_annotation.dart';

import 'tv_show.dart';

part 'tv_list_model.freezed.dart';
part 'tv_list_model.g.dart';

@freezed
class TVListModel with _$TVListModel {
  const factory TVListModel({
    required int page,
    required List<TVShow> results,
    required int totalPages,
    required int totalResults,
  }) = _TVListModel;

  factory TVListModel.fromJson(Map<String, Object?> json) =>
      _$TVListModelFromJson(json);
}
