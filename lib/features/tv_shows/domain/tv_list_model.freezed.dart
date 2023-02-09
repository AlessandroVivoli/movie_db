// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tv_list_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TVListModel _$TVListModelFromJson(Map<String, dynamic> json) {
  return _TVListModel.fromJson(json);
}

/// @nodoc
mixin _$TVListModel {
  int get page => throw _privateConstructorUsedError;
  List<TVShow> get results => throw _privateConstructorUsedError;
  int get totalPages => throw _privateConstructorUsedError;
  int get totalResults => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TVListModelCopyWith<TVListModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TVListModelCopyWith<$Res> {
  factory $TVListModelCopyWith(
          TVListModel value, $Res Function(TVListModel) then) =
      _$TVListModelCopyWithImpl<$Res, TVListModel>;
  @useResult
  $Res call({int page, List<TVShow> results, int totalPages, int totalResults});
}

/// @nodoc
class _$TVListModelCopyWithImpl<$Res, $Val extends TVListModel>
    implements $TVListModelCopyWith<$Res> {
  _$TVListModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? results = null,
    Object? totalPages = null,
    Object? totalResults = null,
  }) {
    return _then(_value.copyWith(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      results: null == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<TVShow>,
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
abstract class _$$_TVListModelCopyWith<$Res>
    implements $TVListModelCopyWith<$Res> {
  factory _$$_TVListModelCopyWith(
          _$_TVListModel value, $Res Function(_$_TVListModel) then) =
      __$$_TVListModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int page, List<TVShow> results, int totalPages, int totalResults});
}

/// @nodoc
class __$$_TVListModelCopyWithImpl<$Res>
    extends _$TVListModelCopyWithImpl<$Res, _$_TVListModel>
    implements _$$_TVListModelCopyWith<$Res> {
  __$$_TVListModelCopyWithImpl(
      _$_TVListModel _value, $Res Function(_$_TVListModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? results = null,
    Object? totalPages = null,
    Object? totalResults = null,
  }) {
    return _then(_$_TVListModel(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      results: null == results
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<TVShow>,
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
class _$_TVListModel implements _TVListModel {
  const _$_TVListModel(
      {required this.page,
      required final List<TVShow> results,
      required this.totalPages,
      required this.totalResults})
      : _results = results;

  factory _$_TVListModel.fromJson(Map<String, dynamic> json) =>
      _$$_TVListModelFromJson(json);

  @override
  final int page;
  final List<TVShow> _results;
  @override
  List<TVShow> get results {
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
    return 'TVListModel(page: $page, results: $results, totalPages: $totalPages, totalResults: $totalResults)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TVListModel &&
            (identical(other.page, page) || other.page == page) &&
            const DeepCollectionEquality().equals(other._results, _results) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages) &&
            (identical(other.totalResults, totalResults) ||
                other.totalResults == totalResults));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, page,
      const DeepCollectionEquality().hash(_results), totalPages, totalResults);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TVListModelCopyWith<_$_TVListModel> get copyWith =>
      __$$_TVListModelCopyWithImpl<_$_TVListModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TVListModelToJson(
      this,
    );
  }
}

abstract class _TVListModel implements TVListModel {
  const factory _TVListModel(
      {required final int page,
      required final List<TVShow> results,
      required final int totalPages,
      required final int totalResults}) = _$_TVListModel;

  factory _TVListModel.fromJson(Map<String, dynamic> json) =
      _$_TVListModel.fromJson;

  @override
  int get page;
  @override
  List<TVShow> get results;
  @override
  int get totalPages;
  @override
  int get totalResults;
  @override
  @JsonKey(ignore: true)
  _$$_TVListModelCopyWith<_$_TVListModel> get copyWith =>
      throw _privateConstructorUsedError;
}
