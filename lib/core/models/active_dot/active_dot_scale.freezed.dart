// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'active_dot_scale.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ActiveDotScale _$ActiveDotScaleFromJson(Map<String, dynamic> json) {
  return _ActiveDotScale.fromJson(json);
}

/// @nodoc
mixin _$ActiveDotScale {
  double get dotComposite => throw _privateConstructorUsedError;
  double get left => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ActiveDotScaleCopyWith<ActiveDotScale> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ActiveDotScaleCopyWith<$Res> {
  factory $ActiveDotScaleCopyWith(
          ActiveDotScale value, $Res Function(ActiveDotScale) then) =
      _$ActiveDotScaleCopyWithImpl<$Res, ActiveDotScale>;
  @useResult
  $Res call({double dotComposite, double left});
}

/// @nodoc
class _$ActiveDotScaleCopyWithImpl<$Res, $Val extends ActiveDotScale>
    implements $ActiveDotScaleCopyWith<$Res> {
  _$ActiveDotScaleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dotComposite = null,
    Object? left = null,
  }) {
    return _then(_value.copyWith(
      dotComposite: null == dotComposite
          ? _value.dotComposite
          : dotComposite // ignore: cast_nullable_to_non_nullable
              as double,
      left: null == left
          ? _value.left
          : left // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ActiveDotScaleCopyWith<$Res>
    implements $ActiveDotScaleCopyWith<$Res> {
  factory _$$_ActiveDotScaleCopyWith(
          _$_ActiveDotScale value, $Res Function(_$_ActiveDotScale) then) =
      __$$_ActiveDotScaleCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double dotComposite, double left});
}

/// @nodoc
class __$$_ActiveDotScaleCopyWithImpl<$Res>
    extends _$ActiveDotScaleCopyWithImpl<$Res, _$_ActiveDotScale>
    implements _$$_ActiveDotScaleCopyWith<$Res> {
  __$$_ActiveDotScaleCopyWithImpl(
      _$_ActiveDotScale _value, $Res Function(_$_ActiveDotScale) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dotComposite = null,
    Object? left = null,
  }) {
    return _then(_$_ActiveDotScale(
      dotComposite: null == dotComposite
          ? _value.dotComposite
          : dotComposite // ignore: cast_nullable_to_non_nullable
              as double,
      left: null == left
          ? _value.left
          : left // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ActiveDotScale implements _ActiveDotScale {
  const _$_ActiveDotScale({required this.dotComposite, required this.left});

  factory _$_ActiveDotScale.fromJson(Map<String, dynamic> json) =>
      _$$_ActiveDotScaleFromJson(json);

  @override
  final double dotComposite;
  @override
  final double left;

  @override
  String toString() {
    return 'ActiveDotScale(dotComposite: $dotComposite, left: $left)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ActiveDotScale &&
            (identical(other.dotComposite, dotComposite) ||
                other.dotComposite == dotComposite) &&
            (identical(other.left, left) || other.left == left));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, dotComposite, left);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ActiveDotScaleCopyWith<_$_ActiveDotScale> get copyWith =>
      __$$_ActiveDotScaleCopyWithImpl<_$_ActiveDotScale>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ActiveDotScaleToJson(
      this,
    );
  }
}

abstract class _ActiveDotScale implements ActiveDotScale {
  const factory _ActiveDotScale(
      {required final double dotComposite,
      required final double left}) = _$_ActiveDotScale;

  factory _ActiveDotScale.fromJson(Map<String, dynamic> json) =
      _$_ActiveDotScale.fromJson;

  @override
  double get dotComposite;
  @override
  double get left;
  @override
  @JsonKey(ignore: true)
  _$$_ActiveDotScaleCopyWith<_$_ActiveDotScale> get copyWith =>
      throw _privateConstructorUsedError;
}
