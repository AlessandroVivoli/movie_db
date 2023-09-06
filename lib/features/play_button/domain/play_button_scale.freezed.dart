// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'play_button_scale.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PlayButtonScale _$PlayButtonScaleFromJson(Map<String, dynamic> json) {
  return _PlayButtonScale.fromJson(json);
}

/// @nodoc
mixin _$PlayButtonScale {
  double get top => throw _privateConstructorUsedError;
  double get offset => throw _privateConstructorUsedError;
  double get scale => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PlayButtonScaleCopyWith<PlayButtonScale> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlayButtonScaleCopyWith<$Res> {
  factory $PlayButtonScaleCopyWith(
          PlayButtonScale value, $Res Function(PlayButtonScale) then) =
      _$PlayButtonScaleCopyWithImpl<$Res, PlayButtonScale>;
  @useResult
  $Res call({double top, double offset, double scale});
}

/// @nodoc
class _$PlayButtonScaleCopyWithImpl<$Res, $Val extends PlayButtonScale>
    implements $PlayButtonScaleCopyWith<$Res> {
  _$PlayButtonScaleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? top = null,
    Object? offset = null,
    Object? scale = null,
  }) {
    return _then(_value.copyWith(
      top: null == top
          ? _value.top
          : top // ignore: cast_nullable_to_non_nullable
              as double,
      offset: null == offset
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as double,
      scale: null == scale
          ? _value.scale
          : scale // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PlayButtonScaleCopyWith<$Res>
    implements $PlayButtonScaleCopyWith<$Res> {
  factory _$$_PlayButtonScaleCopyWith(
          _$_PlayButtonScale value, $Res Function(_$_PlayButtonScale) then) =
      __$$_PlayButtonScaleCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double top, double offset, double scale});
}

/// @nodoc
class __$$_PlayButtonScaleCopyWithImpl<$Res>
    extends _$PlayButtonScaleCopyWithImpl<$Res, _$_PlayButtonScale>
    implements _$$_PlayButtonScaleCopyWith<$Res> {
  __$$_PlayButtonScaleCopyWithImpl(
      _$_PlayButtonScale _value, $Res Function(_$_PlayButtonScale) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? top = null,
    Object? offset = null,
    Object? scale = null,
  }) {
    return _then(_$_PlayButtonScale(
      top: null == top
          ? _value.top
          : top // ignore: cast_nullable_to_non_nullable
              as double,
      offset: null == offset
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as double,
      scale: null == scale
          ? _value.scale
          : scale // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PlayButtonScale implements _PlayButtonScale {
  const _$_PlayButtonScale(
      {required this.top, required this.offset, required this.scale});

  factory _$_PlayButtonScale.fromJson(Map<String, dynamic> json) =>
      _$$_PlayButtonScaleFromJson(json);

  @override
  final double top;
  @override
  final double offset;
  @override
  final double scale;

  @override
  String toString() {
    return 'PlayButtonScale(top: $top, offset: $offset, scale: $scale)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PlayButtonScale &&
            (identical(other.top, top) || other.top == top) &&
            (identical(other.offset, offset) || other.offset == offset) &&
            (identical(other.scale, scale) || other.scale == scale));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, top, offset, scale);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PlayButtonScaleCopyWith<_$_PlayButtonScale> get copyWith =>
      __$$_PlayButtonScaleCopyWithImpl<_$_PlayButtonScale>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PlayButtonScaleToJson(
      this,
    );
  }
}

abstract class _PlayButtonScale implements PlayButtonScale {
  const factory _PlayButtonScale(
      {required final double top,
      required final double offset,
      required final double scale}) = _$_PlayButtonScale;

  factory _PlayButtonScale.fromJson(Map<String, dynamic> json) =
      _$_PlayButtonScale.fromJson;

  @override
  double get top;
  @override
  double get offset;
  @override
  double get scale;
  @override
  @JsonKey(ignore: true)
  _$$_PlayButtonScaleCopyWith<_$_PlayButtonScale> get copyWith =>
      throw _privateConstructorUsedError;
}
