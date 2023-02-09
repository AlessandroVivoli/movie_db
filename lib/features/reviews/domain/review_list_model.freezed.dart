// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'review_list_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ReviewListModel _$ReviewListModelFromJson(Map<String, dynamic> json) {
  return _ReviewListModel.fromJson(json);
}

/// @nodoc
mixin _$ReviewListModel {
  int? get id => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;
  List<Review> get results => throw _privateConstructorUsedError;
  int get totalPages => throw _privateConstructorUsedError;
  int get totalResults => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReviewListModelCopyWith<ReviewListModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReviewListModelCopyWith<$Res> {
  factory $ReviewListModelCopyWith(
          ReviewListModel value, $Res Function(ReviewListModel) then) =
      _$ReviewListModelCopyWithImpl<$Res, ReviewListModel>;
  @useResult
  $Res call(
      {int? id,
      int page,
      List<Review> results,
      int totalPages,
      int totalResults});
}

/// @nodoc
class _$ReviewListModelCopyWithImpl<$Res, $Val extends ReviewListModel>
    implements $ReviewListModelCopyWith<$Res> {
  _$ReviewListModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? page = null,
    Object? results = null,
    Object? totalPages = null,
    Object? totalResults = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      results: null == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<Review>,
      totalPages: null == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
      totalResults: null == totalResults
          ? _value.totalResults
          : totalResults // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ReviewListModelCopyWith<$Res>
    implements $ReviewListModelCopyWith<$Res> {
  factory _$$_ReviewListModelCopyWith(
          _$_ReviewListModel value, $Res Function(_$_ReviewListModel) then) =
      __$$_ReviewListModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      int page,
      List<Review> results,
      int totalPages,
      int totalResults});
}

/// @nodoc
class __$$_ReviewListModelCopyWithImpl<$Res>
    extends _$ReviewListModelCopyWithImpl<$Res, _$_ReviewListModel>
    implements _$$_ReviewListModelCopyWith<$Res> {
  __$$_ReviewListModelCopyWithImpl(
      _$_ReviewListModel _value, $Res Function(_$_ReviewListModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? page = null,
    Object? results = null,
    Object? totalPages = null,
    Object? totalResults = null,
  }) {
    return _then(_$_ReviewListModel(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      results: null == results
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<Review>,
      totalPages: null == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
      totalResults: null == totalResults
          ? _value.totalResults
          : totalResults // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ReviewListModel implements _ReviewListModel {
  const _$_ReviewListModel(
      {required this.id,
      required this.page,
      required final List<Review> results,
      required this.totalPages,
      required this.totalResults})
      : _results = results;

  factory _$_ReviewListModel.fromJson(Map<String, dynamic> json) =>
      _$$_ReviewListModelFromJson(json);

  @override
  final int? id;
  @override
  final int page;
  final List<Review> _results;
  @override
  List<Review> get results {
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  @override
  final int totalPages;
  @override
  final int totalResults;

  @override
  String toString() {
    return 'ReviewListModel(id: $id, page: $page, results: $results, totalPages: $totalPages, totalResults: $totalResults)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReviewListModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.page, page) || other.page == page) &&
            const DeepCollectionEquality().equals(other._results, _results) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages) &&
            (identical(other.totalResults, totalResults) ||
                other.totalResults == totalResults));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, page,
      const DeepCollectionEquality().hash(_results), totalPages, totalResults);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReviewListModelCopyWith<_$_ReviewListModel> get copyWith =>
      __$$_ReviewListModelCopyWithImpl<_$_ReviewListModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReviewListModelToJson(
      this,
    );
  }
}

abstract class _ReviewListModel implements ReviewListModel {
  const factory _ReviewListModel(
      {required final int? id,
      required final int page,
      required final List<Review> results,
      required final int totalPages,
      required final int totalResults}) = _$_ReviewListModel;

  factory _ReviewListModel.fromJson(Map<String, dynamic> json) =
      _$_ReviewListModel.fromJson;

  @override
  int? get id;
  @override
  int get page;
  @override
  List<Review> get results;
  @override
  int get totalPages;
  @override
  int get totalResults;
  @override
  @JsonKey(ignore: true)
  _$$_ReviewListModelCopyWith<_$_ReviewListModel> get copyWith =>
      throw _privateConstructorUsedError;
}
