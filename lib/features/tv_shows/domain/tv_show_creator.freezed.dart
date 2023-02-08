// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tv_show_creator.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TVShowCreator _$TVShowCreatorFromJson(Map<String, dynamic> json) {
  return _TVShowCreator.fromJson(json);
}

/// @nodoc
mixin _$TVShowCreator {
  int get id => throw _privateConstructorUsedError;
  String get creditId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get gender => throw _privateConstructorUsedError;
  String? get profilePath => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TVShowCreatorCopyWith<TVShowCreator> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TVShowCreatorCopyWith<$Res> {
  factory $TVShowCreatorCopyWith(
          TVShowCreator value, $Res Function(TVShowCreator) then) =
      _$TVShowCreatorCopyWithImpl<$Res, TVShowCreator>;
  @useResult
  $Res call(
      {int id, String creditId, String name, int gender, String? profilePath});
}

/// @nodoc
class _$TVShowCreatorCopyWithImpl<$Res, $Val extends TVShowCreator>
    implements $TVShowCreatorCopyWith<$Res> {
  _$TVShowCreatorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? creditId = null,
    Object? name = null,
    Object? gender = null,
    Object? profilePath = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      creditId: null == creditId
          ? _value.creditId
          : creditId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as int,
      profilePath: freezed == profilePath
          ? _value.profilePath
          : profilePath // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TVShowCreatorCopyWith<$Res>
    implements $TVShowCreatorCopyWith<$Res> {
  factory _$$_TVShowCreatorCopyWith(
          _$_TVShowCreator value, $Res Function(_$_TVShowCreator) then) =
      __$$_TVShowCreatorCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id, String creditId, String name, int gender, String? profilePath});
}

/// @nodoc
class __$$_TVShowCreatorCopyWithImpl<$Res>
    extends _$TVShowCreatorCopyWithImpl<$Res, _$_TVShowCreator>
    implements _$$_TVShowCreatorCopyWith<$Res> {
  __$$_TVShowCreatorCopyWithImpl(
      _$_TVShowCreator _value, $Res Function(_$_TVShowCreator) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? creditId = null,
    Object? name = null,
    Object? gender = null,
    Object? profilePath = freezed,
  }) {
    return _then(_$_TVShowCreator(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      creditId: null == creditId
          ? _value.creditId
          : creditId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
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
class _$_TVShowCreator implements _TVShowCreator {
  const _$_TVShowCreator(
      {required this.id,
      required this.creditId,
      required this.name,
      required this.gender,
      required this.profilePath});

  factory _$_TVShowCreator.fromJson(Map<String, dynamic> json) =>
      _$$_TVShowCreatorFromJson(json);

  @override
  final int id;
  @override
  final String creditId;
  @override
  final String name;
  @override
  final int gender;
  @override
  final String? profilePath;

  @override
  String toString() {
    return 'TVShowCreator(id: $id, creditId: $creditId, name: $name, gender: $gender, profilePath: $profilePath)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TVShowCreator &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.creditId, creditId) ||
                other.creditId == creditId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.profilePath, profilePath) ||
                other.profilePath == profilePath));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, creditId, name, gender, profilePath);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TVShowCreatorCopyWith<_$_TVShowCreator> get copyWith =>
      __$$_TVShowCreatorCopyWithImpl<_$_TVShowCreator>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TVShowCreatorToJson(
      this,
    );
  }
}

abstract class _TVShowCreator implements TVShowCreator {
  const factory _TVShowCreator(
      {required final int id,
      required final String creditId,
      required final String name,
      required final int gender,
      required final String? profilePath}) = _$_TVShowCreator;

  factory _TVShowCreator.fromJson(Map<String, dynamic> json) =
      _$_TVShowCreator.fromJson;

  @override
  int get id;
  @override
  String get creditId;
  @override
  String get name;
  @override
  int get gender;
  @override
  String? get profilePath;
  @override
  @JsonKey(ignore: true)
  _$$_TVShowCreatorCopyWith<_$_TVShowCreator> get copyWith =>
      throw _privateConstructorUsedError;
}
