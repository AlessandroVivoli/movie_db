// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'season_account_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SeasonAccountStatus _$SeasonAccountStatusFromJson(Map<String, dynamic> json) {
  return _SeasonAccountStatus.fromJson(json);
}

/// @nodoc
mixin _$SeasonAccountStatus {
  int get id => throw _privateConstructorUsedError;
  List<NumberedEpisodeStatus> get results => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SeasonAccountStatusCopyWith<SeasonAccountStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SeasonAccountStatusCopyWith<$Res> {
  factory $SeasonAccountStatusCopyWith(
          SeasonAccountStatus value, $Res Function(SeasonAccountStatus) then) =
      _$SeasonAccountStatusCopyWithImpl<$Res, SeasonAccountStatus>;
  @useResult
  $Res call({int id, List<NumberedEpisodeStatus> results});
}

/// @nodoc
class _$SeasonAccountStatusCopyWithImpl<$Res, $Val extends SeasonAccountStatus>
    implements $SeasonAccountStatusCopyWith<$Res> {
  _$SeasonAccountStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? results = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      results: null == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<NumberedEpisodeStatus>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SeasonAccountStatusCopyWith<$Res>
    implements $SeasonAccountStatusCopyWith<$Res> {
  factory _$$_SeasonAccountStatusCopyWith(_$_SeasonAccountStatus value,
          $Res Function(_$_SeasonAccountStatus) then) =
      __$$_SeasonAccountStatusCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, List<NumberedEpisodeStatus> results});
}

/// @nodoc
class __$$_SeasonAccountStatusCopyWithImpl<$Res>
    extends _$SeasonAccountStatusCopyWithImpl<$Res, _$_SeasonAccountStatus>
    implements _$$_SeasonAccountStatusCopyWith<$Res> {
  __$$_SeasonAccountStatusCopyWithImpl(_$_SeasonAccountStatus _value,
      $Res Function(_$_SeasonAccountStatus) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? results = null,
  }) {
    return _then(_$_SeasonAccountStatus(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      results: null == results
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<NumberedEpisodeStatus>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SeasonAccountStatus implements _SeasonAccountStatus {
  const _$_SeasonAccountStatus(
      {required this.id, required final List<NumberedEpisodeStatus> results})
      : _results = results;

  factory _$_SeasonAccountStatus.fromJson(Map<String, dynamic> json) =>
      _$$_SeasonAccountStatusFromJson(json);

  @override
  final int id;
  final List<NumberedEpisodeStatus> _results;
  @override
  List<NumberedEpisodeStatus> get results {
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  @override
  String toString() {
    return 'SeasonAccountStatus(id: $id, results: $results)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SeasonAccountStatus &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other._results, _results));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, const DeepCollectionEquality().hash(_results));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SeasonAccountStatusCopyWith<_$_SeasonAccountStatus> get copyWith =>
      __$$_SeasonAccountStatusCopyWithImpl<_$_SeasonAccountStatus>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SeasonAccountStatusToJson(
      this,
    );
  }
}

abstract class _SeasonAccountStatus implements SeasonAccountStatus {
  const factory _SeasonAccountStatus(
          {required final int id,
          required final List<NumberedEpisodeStatus> results}) =
      _$_SeasonAccountStatus;

  factory _SeasonAccountStatus.fromJson(Map<String, dynamic> json) =
      _$_SeasonAccountStatus.fromJson;

  @override
  int get id;
  @override
  List<NumberedEpisodeStatus> get results;
  @override
  @JsonKey(ignore: true)
  _$$_SeasonAccountStatusCopyWith<_$_SeasonAccountStatus> get copyWith =>
      throw _privateConstructorUsedError;
}
