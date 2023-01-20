// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movie_rate.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MovieRate _$MovieRateFromJson(Map<String, dynamic> json) {
  return _MovieRate.fromJson(json);
}

/// @nodoc
mixin _$MovieRate {
  double get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MovieRateCopyWith<MovieRate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MovieRateCopyWith<$Res> {
  factory $MovieRateCopyWith(MovieRate value, $Res Function(MovieRate) then) =
      _$MovieRateCopyWithImpl<$Res, MovieRate>;
  @useResult
  $Res call({double value});
}

/// @nodoc
class _$MovieRateCopyWithImpl<$Res, $Val extends MovieRate>
    implements $MovieRateCopyWith<$Res> {
  _$MovieRateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_value.copyWith(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MovieRateCopyWith<$Res> implements $MovieRateCopyWith<$Res> {
  factory _$$_MovieRateCopyWith(
          _$_MovieRate value, $Res Function(_$_MovieRate) then) =
      __$$_MovieRateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double value});
}

/// @nodoc
class __$$_MovieRateCopyWithImpl<$Res>
    extends _$MovieRateCopyWithImpl<$Res, _$_MovieRate>
    implements _$$_MovieRateCopyWith<$Res> {
  __$$_MovieRateCopyWithImpl(
      _$_MovieRate _value, $Res Function(_$_MovieRate) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$_MovieRate(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MovieRate implements _MovieRate {
  const _$_MovieRate({required this.value});

  factory _$_MovieRate.fromJson(Map<String, dynamic> json) =>
      _$$_MovieRateFromJson(json);

  @override
  final double value;

  @override
  String toString() {
    return 'MovieRate(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MovieRate &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MovieRateCopyWith<_$_MovieRate> get copyWith =>
      __$$_MovieRateCopyWithImpl<_$_MovieRate>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MovieRateToJson(
      this,
    );
  }
}

abstract class _MovieRate implements MovieRate {
  const factory _MovieRate({required final double value}) = _$_MovieRate;

  factory _MovieRate.fromJson(Map<String, dynamic> json) =
      _$_MovieRate.fromJson;

  @override
  double get value;
  @override
  @JsonKey(ignore: true)
  _$$_MovieRateCopyWith<_$_MovieRate> get copyWith =>
      throw _privateConstructorUsedError;
}
