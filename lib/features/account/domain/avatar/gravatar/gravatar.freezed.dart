// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gravatar.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Gravatar _$GravatarFromJson(Map<String, dynamic> json) {
  return _Gravatar.fromJson(json);
}

/// @nodoc
mixin _$Gravatar {
  String get hash => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GravatarCopyWith<Gravatar> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GravatarCopyWith<$Res> {
  factory $GravatarCopyWith(Gravatar value, $Res Function(Gravatar) then) =
      _$GravatarCopyWithImpl<$Res, Gravatar>;
  @useResult
  $Res call({String hash});
}

/// @nodoc
class _$GravatarCopyWithImpl<$Res, $Val extends Gravatar>
    implements $GravatarCopyWith<$Res> {
  _$GravatarCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hash = null,
  }) {
    return _then(_value.copyWith(
      hash: null == hash
          ? _value.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GravatarCopyWith<$Res> implements $GravatarCopyWith<$Res> {
  factory _$$_GravatarCopyWith(
          _$_Gravatar value, $Res Function(_$_Gravatar) then) =
      __$$_GravatarCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String hash});
}

/// @nodoc
class __$$_GravatarCopyWithImpl<$Res>
    extends _$GravatarCopyWithImpl<$Res, _$_Gravatar>
    implements _$$_GravatarCopyWith<$Res> {
  __$$_GravatarCopyWithImpl(
      _$_Gravatar _value, $Res Function(_$_Gravatar) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hash = null,
  }) {
    return _then(_$_Gravatar(
      hash: null == hash
          ? _value.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Gravatar implements _Gravatar {
  const _$_Gravatar({required this.hash});

  factory _$_Gravatar.fromJson(Map<String, dynamic> json) =>
      _$$_GravatarFromJson(json);

  @override
  final String hash;

  @override
  String toString() {
    return 'Gravatar(hash: $hash)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Gravatar &&
            (identical(other.hash, hash) || other.hash == hash));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, hash);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GravatarCopyWith<_$_Gravatar> get copyWith =>
      __$$_GravatarCopyWithImpl<_$_Gravatar>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GravatarToJson(
      this,
    );
  }
}

abstract class _Gravatar implements Gravatar {
  const factory _Gravatar({required final String hash}) = _$_Gravatar;

  factory _Gravatar.fromJson(Map<String, dynamic> json) = _$_Gravatar.fromJson;

  @override
  String get hash;
  @override
  @JsonKey(ignore: true)
  _$$_GravatarCopyWith<_$_Gravatar> get copyWith =>
      throw _privateConstructorUsedError;
}
