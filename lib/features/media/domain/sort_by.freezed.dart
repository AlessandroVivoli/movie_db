// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sort_by.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SortBy _$SortByFromJson(Map<String, dynamic> json) {
  return _SortBy.fromJson(json);
}

/// @nodoc
mixin _$SortBy {
  String get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SortByCopyWith<SortBy> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SortByCopyWith<$Res> {
  factory $SortByCopyWith(SortBy value, $Res Function(SortBy) then) =
      _$SortByCopyWithImpl<$Res, SortBy>;
  @useResult
  $Res call({String value});
}

/// @nodoc
class _$SortByCopyWithImpl<$Res, $Val extends SortBy>
    implements $SortByCopyWith<$Res> {
  _$SortByCopyWithImpl(this._value, this._then);

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
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SortByCopyWith<$Res> implements $SortByCopyWith<$Res> {
  factory _$$_SortByCopyWith(_$_SortBy value, $Res Function(_$_SortBy) then) =
      __$$_SortByCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String value});
}

/// @nodoc
class __$$_SortByCopyWithImpl<$Res>
    extends _$SortByCopyWithImpl<$Res, _$_SortBy>
    implements _$$_SortByCopyWith<$Res> {
  __$$_SortByCopyWithImpl(_$_SortBy _value, $Res Function(_$_SortBy) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$_SortBy(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SortBy extends _SortBy {
  const _$_SortBy({required this.value}) : super._();

  factory _$_SortBy.fromJson(Map<String, dynamic> json) =>
      _$$_SortByFromJson(json);

  @override
  final String value;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SortBy &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SortByCopyWith<_$_SortBy> get copyWith =>
      __$$_SortByCopyWithImpl<_$_SortBy>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SortByToJson(
      this,
    );
  }
}

abstract class _SortBy extends SortBy {
  const factory _SortBy({required final String value}) = _$_SortBy;
  const _SortBy._() : super._();

  factory _SortBy.fromJson(Map<String, dynamic> json) = _$_SortBy.fromJson;

  @override
  String get value;
  @override
  @JsonKey(ignore: true)
  _$$_SortByCopyWith<_$_SortBy> get copyWith =>
      throw _privateConstructorUsedError;
}
