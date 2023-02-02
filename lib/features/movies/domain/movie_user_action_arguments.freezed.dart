// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movie_user_action_arguments.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MovieUserActionArguments _$MovieUserActionArgumentsFromJson(
    Map<String, dynamic> json) {
  return _MovieUserActionArguments.fromJson(json);
}

/// @nodoc
mixin _$MovieUserActionArguments {
  User get user => throw _privateConstructorUsedError;
  int get movieId => throw _privateConstructorUsedError;
  bool get action => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MovieUserActionArgumentsCopyWith<MovieUserActionArguments> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MovieUserActionArgumentsCopyWith<$Res> {
  factory $MovieUserActionArgumentsCopyWith(MovieUserActionArguments value,
          $Res Function(MovieUserActionArguments) then) =
      _$MovieUserActionArgumentsCopyWithImpl<$Res, MovieUserActionArguments>;
  @useResult
  $Res call({User user, int movieId, bool action});

  $UserCopyWith<$Res> get user;
}

/// @nodoc
class _$MovieUserActionArgumentsCopyWithImpl<$Res,
        $Val extends MovieUserActionArguments>
    implements $MovieUserActionArgumentsCopyWith<$Res> {
  _$MovieUserActionArgumentsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? movieId = null,
    Object? action = null,
  }) {
    return _then(_value.copyWith(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      movieId: null == movieId
          ? _value.movieId
          : movieId // ignore: cast_nullable_to_non_nullable
              as int,
      action: null == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as bool,
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
abstract class _$$_MovieUserActionArgumentsCopyWith<$Res>
    implements $MovieUserActionArgumentsCopyWith<$Res> {
  factory _$$_MovieUserActionArgumentsCopyWith(
          _$_MovieUserActionArguments value,
          $Res Function(_$_MovieUserActionArguments) then) =
      __$$_MovieUserActionArgumentsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({User user, int movieId, bool action});

  @override
  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$$_MovieUserActionArgumentsCopyWithImpl<$Res>
    extends _$MovieUserActionArgumentsCopyWithImpl<$Res,
        _$_MovieUserActionArguments>
    implements _$$_MovieUserActionArgumentsCopyWith<$Res> {
  __$$_MovieUserActionArgumentsCopyWithImpl(_$_MovieUserActionArguments _value,
      $Res Function(_$_MovieUserActionArguments) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? movieId = null,
    Object? action = null,
  }) {
    return _then(_$_MovieUserActionArguments(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      movieId: null == movieId
          ? _value.movieId
          : movieId // ignore: cast_nullable_to_non_nullable
              as int,
      action: null == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MovieUserActionArguments implements _MovieUserActionArguments {
  const _$_MovieUserActionArguments(
      {required this.user, required this.movieId, required this.action});

  factory _$_MovieUserActionArguments.fromJson(Map<String, dynamic> json) =>
      _$$_MovieUserActionArgumentsFromJson(json);

  @override
  final User user;
  @override
  final int movieId;
  @override
  final bool action;

  @override
  String toString() {
    return 'MovieUserActionArguments(user: $user, movieId: $movieId, action: $action)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MovieUserActionArguments &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.movieId, movieId) || other.movieId == movieId) &&
            (identical(other.action, action) || other.action == action));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, user, movieId, action);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MovieUserActionArgumentsCopyWith<_$_MovieUserActionArguments>
      get copyWith => __$$_MovieUserActionArgumentsCopyWithImpl<
          _$_MovieUserActionArguments>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MovieUserActionArgumentsToJson(
      this,
    );
  }
}

abstract class _MovieUserActionArguments implements MovieUserActionArguments {
  const factory _MovieUserActionArguments(
      {required final User user,
      required final int movieId,
      required final bool action}) = _$_MovieUserActionArguments;

  factory _MovieUserActionArguments.fromJson(Map<String, dynamic> json) =
      _$_MovieUserActionArguments.fromJson;

  @override
  User get user;
  @override
  int get movieId;
  @override
  bool get action;
  @override
  @JsonKey(ignore: true)
  _$$_MovieUserActionArgumentsCopyWith<_$_MovieUserActionArguments>
      get copyWith => throw _privateConstructorUsedError;
}
