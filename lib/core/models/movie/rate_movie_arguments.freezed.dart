// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rate_movie_arguments.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RateMovieArguments _$RateMovieArgumentsFromJson(Map<String, dynamic> json) {
  return _RateMovieArguments.fromJson(json);
}

/// @nodoc
mixin _$RateMovieArguments {
  int get movieId => throw _privateConstructorUsedError;
  User get user => throw _privateConstructorUsedError;
  double get rating => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RateMovieArgumentsCopyWith<RateMovieArguments> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RateMovieArgumentsCopyWith<$Res> {
  factory $RateMovieArgumentsCopyWith(
          RateMovieArguments value, $Res Function(RateMovieArguments) then) =
      _$RateMovieArgumentsCopyWithImpl<$Res, RateMovieArguments>;
  @useResult
  $Res call({int movieId, User user, double rating});

  $UserCopyWith<$Res> get user;
}

/// @nodoc
class _$RateMovieArgumentsCopyWithImpl<$Res, $Val extends RateMovieArguments>
    implements $RateMovieArgumentsCopyWith<$Res> {
  _$RateMovieArgumentsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? movieId = null,
    Object? user = null,
    Object? rating = null,
  }) {
    return _then(_value.copyWith(
      movieId: null == movieId
          ? _value.movieId
          : movieId // ignore: cast_nullable_to_non_nullable
              as int,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_RateMovieArgumentsCopyWith<$Res>
    implements $RateMovieArgumentsCopyWith<$Res> {
  factory _$$_RateMovieArgumentsCopyWith(_$_RateMovieArguments value,
          $Res Function(_$_RateMovieArguments) then) =
      __$$_RateMovieArgumentsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int movieId, User user, double rating});

  @override
  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$$_RateMovieArgumentsCopyWithImpl<$Res>
    extends _$RateMovieArgumentsCopyWithImpl<$Res, _$_RateMovieArguments>
    implements _$$_RateMovieArgumentsCopyWith<$Res> {
  __$$_RateMovieArgumentsCopyWithImpl(
      _$_RateMovieArguments _value, $Res Function(_$_RateMovieArguments) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? movieId = null,
    Object? user = null,
    Object? rating = null,
  }) {
    return _then(_$_RateMovieArguments(
      movieId: null == movieId
          ? _value.movieId
          : movieId // ignore: cast_nullable_to_non_nullable
              as int,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RateMovieArguments implements _RateMovieArguments {
  const _$_RateMovieArguments(
      {required this.movieId, required this.user, required this.rating});

  factory _$_RateMovieArguments.fromJson(Map<String, dynamic> json) =>
      _$$_RateMovieArgumentsFromJson(json);

  @override
  final int movieId;
  @override
  final User user;
  @override
  final double rating;

  @override
  String toString() {
    return 'RateMovieArguments(movieId: $movieId, user: $user, rating: $rating)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RateMovieArguments &&
            (identical(other.movieId, movieId) || other.movieId == movieId) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.rating, rating) || other.rating == rating));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, movieId, user, rating);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RateMovieArgumentsCopyWith<_$_RateMovieArguments> get copyWith =>
      __$$_RateMovieArgumentsCopyWithImpl<_$_RateMovieArguments>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RateMovieArgumentsToJson(
      this,
    );
  }
}

abstract class _RateMovieArguments implements RateMovieArguments {
  const factory _RateMovieArguments(
      {required final int movieId,
      required final User user,
      required final double rating}) = _$_RateMovieArguments;

  factory _RateMovieArguments.fromJson(Map<String, dynamic> json) =
      _$_RateMovieArguments.fromJson;

  @override
  int get movieId;
  @override
  User get user;
  @override
  double get rating;
  @override
  @JsonKey(ignore: true)
  _$$_RateMovieArgumentsCopyWith<_$_RateMovieArguments> get copyWith =>
      throw _privateConstructorUsedError;
}
