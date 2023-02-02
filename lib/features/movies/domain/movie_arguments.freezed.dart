// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movie_arguments.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MovieArguments _$MovieArgumentsFromJson(Map<String, dynamic> json) {
  return _MovieArguments.fromJson(json);
}

/// @nodoc
mixin _$MovieArguments {
  List<int>? get withGenres => throw _privateConstructorUsedError;
  SortBy get sortBy => throw _privateConstructorUsedError;
  bool? get includeAdult => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MovieArgumentsCopyWith<MovieArguments> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MovieArgumentsCopyWith<$Res> {
  factory $MovieArgumentsCopyWith(
          MovieArguments value, $Res Function(MovieArguments) then) =
      _$MovieArgumentsCopyWithImpl<$Res, MovieArguments>;
  @useResult
  $Res call({List<int>? withGenres, SortBy sortBy, bool? includeAdult});

  $SortByCopyWith<$Res> get sortBy;
}

/// @nodoc
class _$MovieArgumentsCopyWithImpl<$Res, $Val extends MovieArguments>
    implements $MovieArgumentsCopyWith<$Res> {
  _$MovieArgumentsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? withGenres = freezed,
    Object? sortBy = null,
    Object? includeAdult = freezed,
  }) {
    return _then(_value.copyWith(
      withGenres: freezed == withGenres
          ? _value.withGenres
          : withGenres // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      sortBy: null == sortBy
          ? _value.sortBy
          : sortBy // ignore: cast_nullable_to_non_nullable
              as SortBy,
      includeAdult: freezed == includeAdult
          ? _value.includeAdult
          : includeAdult // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SortByCopyWith<$Res> get sortBy {
    return $SortByCopyWith<$Res>(_value.sortBy, (value) {
      return _then(_value.copyWith(sortBy: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_MovieArgumentsCopyWith<$Res>
    implements $MovieArgumentsCopyWith<$Res> {
  factory _$$_MovieArgumentsCopyWith(
          _$_MovieArguments value, $Res Function(_$_MovieArguments) then) =
      __$$_MovieArgumentsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<int>? withGenres, SortBy sortBy, bool? includeAdult});

  @override
  $SortByCopyWith<$Res> get sortBy;
}

/// @nodoc
class __$$_MovieArgumentsCopyWithImpl<$Res>
    extends _$MovieArgumentsCopyWithImpl<$Res, _$_MovieArguments>
    implements _$$_MovieArgumentsCopyWith<$Res> {
  __$$_MovieArgumentsCopyWithImpl(
      _$_MovieArguments _value, $Res Function(_$_MovieArguments) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? withGenres = freezed,
    Object? sortBy = null,
    Object? includeAdult = freezed,
  }) {
    return _then(_$_MovieArguments(
      withGenres: freezed == withGenres
          ? _value._withGenres
          : withGenres // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      sortBy: null == sortBy
          ? _value.sortBy
          : sortBy // ignore: cast_nullable_to_non_nullable
              as SortBy,
      includeAdult: freezed == includeAdult
          ? _value.includeAdult
          : includeAdult // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MovieArguments implements _MovieArguments {
  const _$_MovieArguments(
      {required final List<int>? withGenres,
      this.sortBy = SortBy.popularityDesc,
      required this.includeAdult})
      : _withGenres = withGenres;

  factory _$_MovieArguments.fromJson(Map<String, dynamic> json) =>
      _$$_MovieArgumentsFromJson(json);

  final List<int>? _withGenres;
  @override
  List<int>? get withGenres {
    final value = _withGenres;
    if (value == null) return null;
    if (_withGenres is EqualUnmodifiableListView) return _withGenres;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey()
  final SortBy sortBy;
  @override
  final bool? includeAdult;

  @override
  String toString() {
    return 'MovieArguments(withGenres: $withGenres, sortBy: $sortBy, includeAdult: $includeAdult)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MovieArguments &&
            const DeepCollectionEquality()
                .equals(other._withGenres, _withGenres) &&
            (identical(other.sortBy, sortBy) || other.sortBy == sortBy) &&
            (identical(other.includeAdult, includeAdult) ||
                other.includeAdult == includeAdult));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_withGenres), sortBy, includeAdult);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MovieArgumentsCopyWith<_$_MovieArguments> get copyWith =>
      __$$_MovieArgumentsCopyWithImpl<_$_MovieArguments>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MovieArgumentsToJson(
      this,
    );
  }
}

abstract class _MovieArguments implements MovieArguments {
  const factory _MovieArguments(
      {required final List<int>? withGenres,
      final SortBy sortBy,
      required final bool? includeAdult}) = _$_MovieArguments;

  factory _MovieArguments.fromJson(Map<String, dynamic> json) =
      _$_MovieArguments.fromJson;

  @override
  List<int>? get withGenres;
  @override
  SortBy get sortBy;
  @override
  bool? get includeAdult;
  @override
  @JsonKey(ignore: true)
  _$$_MovieArgumentsCopyWith<_$_MovieArguments> get copyWith =>
      throw _privateConstructorUsedError;
}
