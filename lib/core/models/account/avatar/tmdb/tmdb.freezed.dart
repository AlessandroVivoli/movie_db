// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tmdb.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TMDB _$TMDBFromJson(Map<String, dynamic> json) {
  return _TMDB.fromJson(json);
}

/// @nodoc
mixin _$TMDB {
  String? get avatarPath => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TMDBCopyWith<TMDB> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TMDBCopyWith<$Res> {
  factory $TMDBCopyWith(TMDB value, $Res Function(TMDB) then) =
      _$TMDBCopyWithImpl<$Res, TMDB>;
  @useResult
  $Res call({String? avatarPath});
}

/// @nodoc
class _$TMDBCopyWithImpl<$Res, $Val extends TMDB>
    implements $TMDBCopyWith<$Res> {
  _$TMDBCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? avatarPath = freezed,
  }) {
    return _then(_value.copyWith(
      avatarPath: freezed == avatarPath
          ? _value.avatarPath
          : avatarPath // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TMDBCopyWith<$Res> implements $TMDBCopyWith<$Res> {
  factory _$$_TMDBCopyWith(_$_TMDB value, $Res Function(_$_TMDB) then) =
      __$$_TMDBCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? avatarPath});
}

/// @nodoc
class __$$_TMDBCopyWithImpl<$Res> extends _$TMDBCopyWithImpl<$Res, _$_TMDB>
    implements _$$_TMDBCopyWith<$Res> {
  __$$_TMDBCopyWithImpl(_$_TMDB _value, $Res Function(_$_TMDB) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? avatarPath = freezed,
  }) {
    return _then(_$_TMDB(
      avatarPath: freezed == avatarPath
          ? _value.avatarPath
          : avatarPath // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TMDB implements _TMDB {
  const _$_TMDB({required this.avatarPath});

  factory _$_TMDB.fromJson(Map<String, dynamic> json) => _$$_TMDBFromJson(json);

  @override
  final String? avatarPath;

  @override
  String toString() {
    return 'TMDB(avatarPath: $avatarPath)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TMDB &&
            (identical(other.avatarPath, avatarPath) ||
                other.avatarPath == avatarPath));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, avatarPath);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TMDBCopyWith<_$_TMDB> get copyWith =>
      __$$_TMDBCopyWithImpl<_$_TMDB>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TMDBToJson(
      this,
    );
  }
}

abstract class _TMDB implements TMDB {
  const factory _TMDB({required final String? avatarPath}) = _$_TMDB;

  factory _TMDB.fromJson(Map<String, dynamic> json) = _$_TMDB.fromJson;

  @override
  String? get avatarPath;
  @override
  @JsonKey(ignore: true)
  _$$_TMDBCopyWith<_$_TMDB> get copyWith => throw _privateConstructorUsedError;
}
