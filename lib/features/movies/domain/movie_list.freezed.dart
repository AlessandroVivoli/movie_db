// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movie_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MovieListModel _$MovieListModelFromJson(Map<String, dynamic> json) {
  return _MovieListModel.fromJson(json);
}

/// @nodoc
mixin _$MovieListModel {
  int get page => throw _privateConstructorUsedError;
  List<Movie> get results => throw _privateConstructorUsedError;
  int get totalPages => throw _privateConstructorUsedError;
  int get totalResults => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MovieListModelCopyWith<MovieListModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MovieListModelCopyWith<$Res> {
  factory $MovieListModelCopyWith(
          MovieListModel value, $Res Function(MovieListModel) then) =
      _$MovieListModelCopyWithImpl<$Res, MovieListModel>;
  @useResult
  $Res call({int page, List<Movie> results, int totalPages, int totalResults});
}

/// @nodoc
class _$MovieListModelCopyWithImpl<$Res, $Val extends MovieListModel>
    implements $MovieListModelCopyWith<$Res> {
  _$MovieListModelCopyWithImpl(this._value, this._then);

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
              as List<Movie>,
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
abstract class _$$_MovieListModelCopyWith<$Res>
    implements $MovieListModelCopyWith<$Res> {
  factory _$$_MovieListModelCopyWith(
          _$_MovieListModel value, $Res Function(_$_MovieListModel) then) =
      __$$_MovieListModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int page, List<Movie> results, int totalPages, int totalResults});
}

/// @nodoc
class __$$_MovieListModelCopyWithImpl<$Res>
    extends _$MovieListModelCopyWithImpl<$Res, _$_MovieListModel>
    implements _$$_MovieListModelCopyWith<$Res> {
  __$$_MovieListModelCopyWithImpl(
      _$_MovieListModel _value, $Res Function(_$_MovieListModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? results = null,
    Object? totalPages = null,
    Object? totalResults = null,
  }) {
    return _then(_$_MovieListModel(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      results: null == results
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<Movie>,
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
class _$_MovieListModel implements _MovieListModel {
  const _$_MovieListModel(
      {required this.page,
      required final List<Movie> results,
      required this.totalPages,
      required this.totalResults})
      : _results = results;

  factory _$_MovieListModel.fromJson(Map<String, dynamic> json) =>
      _$$_MovieListModelFromJson(json);

  @override
  final int page;
  final List<Movie> _results;
  @override
  List<Movie> get results {
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
    return 'MovieListModel(page: $page, results: $results, totalPages: $totalPages, totalResults: $totalResults)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MovieListModel &&
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
  _$$_MovieListModelCopyWith<_$_MovieListModel> get copyWith =>
      __$$_MovieListModelCopyWithImpl<_$_MovieListModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MovieListModelToJson(
      this,
    );
  }
}

abstract class _MovieListModel implements MovieListModel {
  const factory _MovieListModel(
      {required final int page,
      required final List<Movie> results,
      required final int totalPages,
      required final int totalResults}) = _$_MovieListModel;

  factory _MovieListModel.fromJson(Map<String, dynamic> json) =
      _$_MovieListModel.fromJson;

  @override
  int get page;
  @override
  List<Movie> get results;
  @override
  int get totalPages;
  @override
  int get totalResults;
  @override
  @JsonKey(ignore: true)
  _$$_MovieListModelCopyWith<_$_MovieListModel> get copyWith =>
      throw _privateConstructorUsedError;
}
