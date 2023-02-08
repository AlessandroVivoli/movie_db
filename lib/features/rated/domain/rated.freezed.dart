// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rated.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Rated _$RatedFromJson(Map<String, dynamic> json) {
  return _Rated.fromJson(json);
}

/// @nodoc
mixin _$Rated {
  double get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RatedCopyWith<Rated> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RatedCopyWith<$Res> {
  factory $RatedCopyWith(Rated value, $Res Function(Rated) then) =
      _$RatedCopyWithImpl<$Res, Rated>;
  @useResult
  $Res call({double value});
}

/// @nodoc
class _$RatedCopyWithImpl<$Res, $Val extends Rated>
    implements $RatedCopyWith<$Res> {
  _$RatedCopyWithImpl(this._value, this._then);

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
abstract class _$$_RatedCopyWith<$Res> implements $RatedCopyWith<$Res> {
  factory _$$_RatedCopyWith(_$_Rated value, $Res Function(_$_Rated) then) =
      __$$_RatedCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double value});
}

/// @nodoc
class __$$_RatedCopyWithImpl<$Res> extends _$RatedCopyWithImpl<$Res, _$_Rated>
    implements _$$_RatedCopyWith<$Res> {
  __$$_RatedCopyWithImpl(_$_Rated _value, $Res Function(_$_Rated) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$_Rated(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Rated implements _Rated {
  const _$_Rated({required this.value});

  factory _$_Rated.fromJson(Map<String, dynamic> json) =>
      _$$_RatedFromJson(json);

  @override
  final double value;

  @override
  String toString() {
    return 'Rated(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Rated &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RatedCopyWith<_$_Rated> get copyWith =>
      __$$_RatedCopyWithImpl<_$_Rated>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RatedToJson(
      this,
    );
  }
}

abstract class _Rated implements Rated {
  const factory _Rated({required final double value}) = _$_Rated;

  factory _Rated.fromJson(Map<String, dynamic> json) = _$_Rated.fromJson;

  @override
  double get value;
  @override
  @JsonKey(ignore: true)
  _$$_RatedCopyWith<_$_Rated> get copyWith =>
      throw _privateConstructorUsedError;
}
