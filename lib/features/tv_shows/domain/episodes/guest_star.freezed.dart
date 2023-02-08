// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'guest_star.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GuestStar _$GuestStarFromJson(Map<String, dynamic> json) {
  return _GuestStar.fromJson(json);
}

/// @nodoc
mixin _$GuestStar {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get creditId => throw _privateConstructorUsedError;
  String get character => throw _privateConstructorUsedError;
  int get order => throw _privateConstructorUsedError;
  String? get profilePath => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GuestStarCopyWith<GuestStar> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GuestStarCopyWith<$Res> {
  factory $GuestStarCopyWith(GuestStar value, $Res Function(GuestStar) then) =
      _$GuestStarCopyWithImpl<$Res, GuestStar>;
  @useResult
  $Res call(
      {int id,
      String name,
      String creditId,
      String character,
      int order,
      String? profilePath});
}

/// @nodoc
class _$GuestStarCopyWithImpl<$Res, $Val extends GuestStar>
    implements $GuestStarCopyWith<$Res> {
  _$GuestStarCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? creditId = null,
    Object? character = null,
    Object? order = null,
    Object? profilePath = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      creditId: null == creditId
          ? _value.creditId
          : creditId // ignore: cast_nullable_to_non_nullable
              as String,
      character: null == character
          ? _value.character
          : character // ignore: cast_nullable_to_non_nullable
              as String,
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int,
      profilePath: freezed == profilePath
          ? _value.profilePath
          : profilePath // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GuestStarCopyWith<$Res> implements $GuestStarCopyWith<$Res> {
  factory _$$_GuestStarCopyWith(
          _$_GuestStar value, $Res Function(_$_GuestStar) then) =
      __$$_GuestStarCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String creditId,
      String character,
      int order,
      String? profilePath});
}

/// @nodoc
class __$$_GuestStarCopyWithImpl<$Res>
    extends _$GuestStarCopyWithImpl<$Res, _$_GuestStar>
    implements _$$_GuestStarCopyWith<$Res> {
  __$$_GuestStarCopyWithImpl(
      _$_GuestStar _value, $Res Function(_$_GuestStar) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? creditId = null,
    Object? character = null,
    Object? order = null,
    Object? profilePath = freezed,
  }) {
    return _then(_$_GuestStar(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      creditId: null == creditId
          ? _value.creditId
          : creditId // ignore: cast_nullable_to_non_nullable
              as String,
      character: null == character
          ? _value.character
          : character // ignore: cast_nullable_to_non_nullable
              as String,
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int,
      profilePath: freezed == profilePath
          ? _value.profilePath
          : profilePath // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GuestStar implements _GuestStar {
  const _$_GuestStar(
      {required this.id,
      required this.name,
      required this.creditId,
      required this.character,
      required this.order,
      required this.profilePath});

  factory _$_GuestStar.fromJson(Map<String, dynamic> json) =>
      _$$_GuestStarFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String creditId;
  @override
  final String character;
  @override
  final int order;
  @override
  final String? profilePath;

  @override
  String toString() {
    return 'GuestStar(id: $id, name: $name, creditId: $creditId, character: $character, order: $order, profilePath: $profilePath)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GuestStar &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.creditId, creditId) ||
                other.creditId == creditId) &&
            (identical(other.character, character) ||
                other.character == character) &&
            (identical(other.order, order) || other.order == order) &&
            (identical(other.profilePath, profilePath) ||
                other.profilePath == profilePath));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, creditId, character, order, profilePath);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GuestStarCopyWith<_$_GuestStar> get copyWith =>
      __$$_GuestStarCopyWithImpl<_$_GuestStar>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GuestStarToJson(
      this,
    );
  }
}

abstract class _GuestStar implements GuestStar {
  const factory _GuestStar(
      {required final int id,
      required final String name,
      required final String creditId,
      required final String character,
      required final int order,
      required final String? profilePath}) = _$_GuestStar;

  factory _GuestStar.fromJson(Map<String, dynamic> json) =
      _$_GuestStar.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get creditId;
  @override
  String get character;
  @override
  int get order;
  @override
  String? get profilePath;
  @override
  @JsonKey(ignore: true)
  _$$_GuestStarCopyWith<_$_GuestStar> get copyWith =>
      throw _privateConstructorUsedError;
}
