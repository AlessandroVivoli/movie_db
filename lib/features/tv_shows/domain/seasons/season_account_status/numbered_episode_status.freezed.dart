// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'numbered_episode_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NumberedEpisodeStatus _$NumberedEpisodeStatusFromJson(
    Map<String, dynamic> json) {
  return _NumberedEpisodeStatus.fromJson(json);
}

/// @nodoc
mixin _$NumberedEpisodeStatus {
  int get id => throw _privateConstructorUsedError;
  int get episodeNumber => throw _privateConstructorUsedError;
  dynamic get rated => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NumberedEpisodeStatusCopyWith<NumberedEpisodeStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NumberedEpisodeStatusCopyWith<$Res> {
  factory $NumberedEpisodeStatusCopyWith(NumberedEpisodeStatus value,
          $Res Function(NumberedEpisodeStatus) then) =
      _$NumberedEpisodeStatusCopyWithImpl<$Res, NumberedEpisodeStatus>;
  @useResult
  $Res call({int id, int episodeNumber, dynamic rated});
}

/// @nodoc
class _$NumberedEpisodeStatusCopyWithImpl<$Res,
        $Val extends NumberedEpisodeStatus>
    implements $NumberedEpisodeStatusCopyWith<$Res> {
  _$NumberedEpisodeStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? episodeNumber = null,
    Object? rated = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      episodeNumber: null == episodeNumber
          ? _value.episodeNumber
          : episodeNumber // ignore: cast_nullable_to_non_nullable
              as int,
      rated: freezed == rated
          ? _value.rated
          : rated // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NumberedEpisodeStatusCopyWith<$Res>
    implements $NumberedEpisodeStatusCopyWith<$Res> {
  factory _$$_NumberedEpisodeStatusCopyWith(_$_NumberedEpisodeStatus value,
          $Res Function(_$_NumberedEpisodeStatus) then) =
      __$$_NumberedEpisodeStatusCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, int episodeNumber, dynamic rated});
}

/// @nodoc
class __$$_NumberedEpisodeStatusCopyWithImpl<$Res>
    extends _$NumberedEpisodeStatusCopyWithImpl<$Res, _$_NumberedEpisodeStatus>
    implements _$$_NumberedEpisodeStatusCopyWith<$Res> {
  __$$_NumberedEpisodeStatusCopyWithImpl(_$_NumberedEpisodeStatus _value,
      $Res Function(_$_NumberedEpisodeStatus) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? episodeNumber = null,
    Object? rated = freezed,
  }) {
    return _then(_$_NumberedEpisodeStatus(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      episodeNumber: null == episodeNumber
          ? _value.episodeNumber
          : episodeNumber // ignore: cast_nullable_to_non_nullable
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
class _$_NumberedEpisodeStatus implements _NumberedEpisodeStatus {
  const _$_NumberedEpisodeStatus(
      {required this.id, required this.episodeNumber, required this.rated});

  factory _$_NumberedEpisodeStatus.fromJson(Map<String, dynamic> json) =>
      _$$_NumberedEpisodeStatusFromJson(json);

  @override
  final int id;
  @override
  final int episodeNumber;
  @override
  final dynamic rated;

  @override
  String toString() {
    return 'NumberedEpisodeStatus(id: $id, episodeNumber: $episodeNumber, rated: $rated)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NumberedEpisodeStatus &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.episodeNumber, episodeNumber) ||
                other.episodeNumber == episodeNumber) &&
            const DeepCollectionEquality().equals(other.rated, rated));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, episodeNumber,
      const DeepCollectionEquality().hash(rated));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NumberedEpisodeStatusCopyWith<_$_NumberedEpisodeStatus> get copyWith =>
      __$$_NumberedEpisodeStatusCopyWithImpl<_$_NumberedEpisodeStatus>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NumberedEpisodeStatusToJson(
      this,
    );
  }
}

abstract class _NumberedEpisodeStatus implements NumberedEpisodeStatus {
  const factory _NumberedEpisodeStatus(
      {required final int id,
      required final int episodeNumber,
      required final dynamic rated}) = _$_NumberedEpisodeStatus;

  factory _NumberedEpisodeStatus.fromJson(Map<String, dynamic> json) =
      _$_NumberedEpisodeStatus.fromJson;

  @override
  int get id;
  @override
  int get episodeNumber;
  @override
  dynamic get rated;
  @override
  @JsonKey(ignore: true)
  _$$_NumberedEpisodeStatusCopyWith<_$_NumberedEpisodeStatus> get copyWith =>
      throw _privateConstructorUsedError;
}
