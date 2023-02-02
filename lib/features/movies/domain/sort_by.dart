import 'package:freezed_annotation/freezed_annotation.dart';

part 'sort_by.freezed.dart';
part 'sort_by.g.dart';

@freezed
class SortBy with _$SortBy {
  const SortBy._();

  const factory SortBy({
    required String value,
  }) = _SortBy;

  @override
  String toString() {
    return value;
  }

  factory SortBy.fromJson(Map<String, Object?> json) => _$SortByFromJson(json);
}
