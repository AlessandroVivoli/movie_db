// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'episode_account_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

EpisodeAccountStatus _$EpisodeAccountStatusFromJson(Map<String, dynamic> json) {
  return _EpisodeAccountStatus.fromJson(json);
}

/// @nodoc
mixin _$EpisodeAccountStatus {
  int get id => throw _privateConstructorUsedError;
  dynamic get rated => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EpisodeAccountStatusCopyWith<EpisodeAccountStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EpisodeAccountStatusCopyWith<$Res> {
  factory $EpisodeAccountStatusCopyWith(EpisodeAccountStatus value,
          $Res Function(EpisodeAccountStatus) then) =
      _$EpisodeAccountStatusCopyWithImpl<$Res, EpisodeAccountStatus>;
  @useResult
  $Res call({int id, dynamic rated});
}

/// @nodoc
class _$EpisodeAccountStatusCopyWithImpl<$Res,
        $Val extends EpisodeAccountStatus>
    implements $EpisodeAccountStatusCopyWith<$Res> {
  _$EpisodeAccountStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? rated = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      rated: freezed == rated
          ? _value.rated
          : rated // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_EpisodeAccountStatusCopyWith<$Res>
    implements $EpisodeAccountStatusCopyWith<$Res> {
  factory _$$_EpisodeAccountStatusCopyWith(_$_EpisodeAccountStatus value,
          $Res Function(_$_EpisodeAccountStatus) then) =
      __$$_EpisodeAccountStatusCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, dynamic rated});
}

/// @nodoc
class __$$_EpisodeAccountStatusCopyWithImpl<$Res>
    extends _$EpisodeAccountStatusCopyWithImpl<$Res, _$_EpisodeAccountStatus>
    implements _$$_EpisodeAccountStatusCopyWith<$Res> {
  __$$_EpisodeAccountStatusCopyWithImpl(_$_EpisodeAccountStatus _value,
      $Res Function(_$_EpisodeAccountStatus) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? rated = freezed,
  }) {
    return _then(_$_EpisodeAccountStatus(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      rated: freezed == rated
          ? _value.rated
          : rated // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_EpisodeAccountStatus implements _EpisodeAccountStatus {
  const _$_EpisodeAccountStatus({required this.id, required this.rated});

  factory _$_EpisodeAccountStatus.fromJson(Map<String, dynamic> json) =>
      _$$_EpisodeAccountStatusFromJson(json);

  @override
  final int id;
  @override
  final dynamic rated;

  @override
  String toString() {
    return 'EpisodeAccountStatus(id: $id, rated: $rated)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EpisodeAccountStatus &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other.rated, rated));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, const DeepCollectionEquality().hash(rated));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EpisodeAccountStatusCopyWith<_$_EpisodeAccountStatus> get copyWith =>
      __$$_EpisodeAccountStatusCopyWithImpl<_$_EpisodeAccountStatus>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EpisodeAccountStatusToJson(
      this,
    );
  }
}

abstract class _EpisodeAccountStatus implements EpisodeAccountStatus {
  const factory _EpisodeAccountStatus(
      {required final int id,
      required final dynamic rated}) = _$_EpisodeAccountStatus;

  factory _EpisodeAccountStatus.fromJson(Map<String, dynamic> json) =
      _$_EpisodeAccountStatus.fromJson;

  @override
  int get id;
  @override
  dynamic get rated;
  @override
  @JsonKey(ignore: true)
  _$$_EpisodeAccountStatusCopyWith<_$_EpisodeAccountStatus> get copyWith =>
      throw _privateConstructorUsedError;
}
