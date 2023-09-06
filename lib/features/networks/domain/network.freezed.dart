// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'network.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Network _$NetworkFromJson(Map<String, dynamic> json) {
  return _Network.fromJson(json);
}

/// @nodoc
mixin _$Network {
  String get name => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;
  String get logoPath => throw _privateConstructorUsedError;
  String get originCountry => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NetworkCopyWith<Network> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NetworkCopyWith<$Res> {
  factory $NetworkCopyWith(Network value, $Res Function(Network) then) =
      _$NetworkCopyWithImpl<$Res, Network>;
  @useResult
  $Res call({String name, int id, String logoPath, String originCountry});
}

/// @nodoc
class _$NetworkCopyWithImpl<$Res, $Val extends Network>
    implements $NetworkCopyWith<$Res> {
  _$NetworkCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? id = null,
    Object? logoPath = null,
    Object? originCountry = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      logoPath: null == logoPath
          ? _value.logoPath
          : logoPath // ignore: cast_nullable_to_non_nullable
              as String,
      originCountry: null == originCountry
          ? _value.originCountry
          : originCountry // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NetworkCopyWith<$Res> implements $NetworkCopyWith<$Res> {
  factory _$$_NetworkCopyWith(
          _$_Network value, $Res Function(_$_Network) then) =
      __$$_NetworkCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, int id, String logoPath, String originCountry});
}

/// @nodoc
class __$$_NetworkCopyWithImpl<$Res>
    extends _$NetworkCopyWithImpl<$Res, _$_Network>
    implements _$$_NetworkCopyWith<$Res> {
  __$$_NetworkCopyWithImpl(_$_Network _value, $Res Function(_$_Network) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? id = null,
    Object? logoPath = null,
    Object? originCountry = null,
  }) {
    return _then(_$_Network(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      logoPath: null == logoPath
          ? _value.logoPath
          : logoPath // ignore: cast_nullable_to_non_nullable
              as String,
      originCountry: null == originCountry
          ? _value.originCountry
          : originCountry // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Network implements _Network {
  const _$_Network(
      {required this.name,
      required this.id,
      required this.logoPath,
      required this.originCountry});

  factory _$_Network.fromJson(Map<String, dynamic> json) =>
      _$$_NetworkFromJson(json);

  @override
  final String name;
  @override
  final int id;
  @override
  final String logoPath;
  @override
  final String originCountry;

  @override
  String toString() {
    return 'Network(name: $name, id: $id, logoPath: $logoPath, originCountry: $originCountry)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Network &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.logoPath, logoPath) ||
                other.logoPath == logoPath) &&
            (identical(other.originCountry, originCountry) ||
                other.originCountry == originCountry));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, id, logoPath, originCountry);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NetworkCopyWith<_$_Network> get copyWith =>
      __$$_NetworkCopyWithImpl<_$_Network>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NetworkToJson(
      this,
    );
  }
}

abstract class _Network implements Network {
  const factory _Network(
      {required final String name,
      required final int id,
      required final String logoPath,
      required final String originCountry}) = _$_Network;

  factory _Network.fromJson(Map<String, dynamic> json) = _$_Network.fromJson;

  @override
  String get name;
  @override
  int get id;
  @override
  String get logoPath;
  @override
  String get originCountry;
  @override
  @JsonKey(ignore: true)
  _$$_NetworkCopyWith<_$_Network> get copyWith =>
      throw _privateConstructorUsedError;
}
