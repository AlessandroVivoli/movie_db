// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tv_season_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TVSeasonDetails _$TVSeasonDetailsFromJson(Map<String, dynamic> json) {
  return _TVSeasonDetails.fromJson(json);
}

/// @nodoc
mixin _$TVSeasonDetails {
  @JsonKey(name: '_id')
  String get seasonId => throw _privateConstructorUsedError;
  DateTime? get airDate => throw _privateConstructorUsedError;
  List<TVEpisode> get episodes => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get overview => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;
  String? get posterPath => throw _privateConstructorUsedError;
  int get seasonNumber => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TVSeasonDetailsCopyWith<TVSeasonDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TVSeasonDetailsCopyWith<$Res> {
  factory $TVSeasonDetailsCopyWith(
          TVSeasonDetails value, $Res Function(TVSeasonDetails) then) =
      _$TVSeasonDetailsCopyWithImpl<$Res, TVSeasonDetails>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String seasonId,
      DateTime? airDate,
      List<TVEpisode> episodes,
      String name,
      String overview,
      int id,
      String? posterPath,
      int seasonNumber});
}

/// @nodoc
class _$TVSeasonDetailsCopyWithImpl<$Res, $Val extends TVSeasonDetails>
    implements $TVSeasonDetailsCopyWith<$Res> {
  _$TVSeasonDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? seasonId = null,
    Object? airDate = freezed,
    Object? episodes = null,
    Object? name = null,
    Object? overview = null,
    Object? id = null,
    Object? posterPath = freezed,
    Object? seasonNumber = null,
  }) {
    return _then(_value.copyWith(
      seasonId: null == seasonId
          ? _value.seasonId
          : seasonId // ignore: cast_nullable_to_non_nullable
              as String,
      airDate: freezed == airDate
          ? _value.airDate
          : airDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      episodes: null == episodes
          ? _value.episodes
          : episodes // ignore: cast_nullable_to_non_nullable
              as List<TVEpisode>,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      overview: null == overview
          ? _value.overview
          : overview // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      posterPath: freezed == posterPath
          ? _value.posterPath
          : posterPath // ignore: cast_nullable_to_non_nullable
              as String?,
      seasonNumber: null == seasonNumber
          ? _value.seasonNumber
          : seasonNumber // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TVSeasonDetailsCopyWith<$Res>
    implements $TVSeasonDetailsCopyWith<$Res> {
  factory _$$_TVSeasonDetailsCopyWith(
          _$_TVSeasonDetails value, $Res Function(_$_TVSeasonDetails) then) =
      __$$_TVSeasonDetailsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String seasonId,
      DateTime? airDate,
      List<TVEpisode> episodes,
      String name,
      String overview,
      int id,
      String? posterPath,
      int seasonNumber});
}

/// @nodoc
class __$$_TVSeasonDetailsCopyWithImpl<$Res>
    extends _$TVSeasonDetailsCopyWithImpl<$Res, _$_TVSeasonDetails>
    implements _$$_TVSeasonDetailsCopyWith<$Res> {
  __$$_TVSeasonDetailsCopyWithImpl(
      _$_TVSeasonDetails _value, $Res Function(_$_TVSeasonDetails) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? seasonId = null,
    Object? airDate = freezed,
    Object? episodes = null,
    Object? name = null,
    Object? overview = null,
    Object? id = null,
    Object? posterPath = freezed,
    Object? seasonNumber = null,
  }) {
    return _then(_$_TVSeasonDetails(
      seasonId: null == seasonId
          ? _value.seasonId
          : seasonId // ignore: cast_nullable_to_non_nullable
              as String,
      airDate: freezed == airDate
          ? _value.airDate
          : airDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      episodes: null == episodes
          ? _value._episodes
          : episodes // ignore: cast_nullable_to_non_nullable
              as List<TVEpisode>,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      overview: null == overview
          ? _value.overview
          : overview // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      posterPath: freezed == posterPath
          ? _value.posterPath
          : posterPath // ignore: cast_nullable_to_non_nullable
              as String?,
      seasonNumber: null == seasonNumber
          ? _value.seasonNumber
          : seasonNumber // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TVSeasonDetails implements _TVSeasonDetails {
  const _$_TVSeasonDetails(
      {@JsonKey(name: '_id') required this.seasonId,
      required this.airDate,
      required final List<TVEpisode> episodes,
      required this.name,
      required this.overview,
      required this.id,
      required this.posterPath,
      required this.seasonNumber})
      : _episodes = episodes;

  factory _$_TVSeasonDetails.fromJson(Map<String, dynamic> json) =>
      _$$_TVSeasonDetailsFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String seasonId;
  @override
  final DateTime? airDate;
  final List<TVEpisode> _episodes;
  @override
  List<TVEpisode> get episodes {
    if (_episodes is EqualUnmodifiableListView) return _episodes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_episodes);
  }

  @override
  final String name;
  @override
  final String overview;
  @override
  final int id;
  @override
  final String? posterPath;
  @override
  final int seasonNumber;

  @override
  String toString() {
    return 'TVSeasonDetails(seasonId: $seasonId, airDate: $airDate, episodes: $episodes, name: $name, overview: $overview, id: $id, posterPath: $posterPath, seasonNumber: $seasonNumber)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TVSeasonDetails &&
            (identical(other.seasonId, seasonId) ||
                other.seasonId == seasonId) &&
            (identical(other.airDate, airDate) || other.airDate == airDate) &&
            const DeepCollectionEquality().equals(other._episodes, _episodes) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.overview, overview) ||
                other.overview == overview) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.posterPath, posterPath) ||
                other.posterPath == posterPath) &&
            (identical(other.seasonNumber, seasonNumber) ||
                other.seasonNumber == seasonNumber));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      seasonId,
      airDate,
      const DeepCollectionEquality().hash(_episodes),
      name,
      overview,
      id,
      posterPath,
      seasonNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TVSeasonDetailsCopyWith<_$_TVSeasonDetails> get copyWith =>
      __$$_TVSeasonDetailsCopyWithImpl<_$_TVSeasonDetails>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TVSeasonDetailsToJson(
      this,
    );
  }
}

abstract class _TVSeasonDetails implements TVSeasonDetails {
  const factory _TVSeasonDetails(
      {@JsonKey(name: '_id') required final String seasonId,
      required final DateTime? airDate,
      required final List<TVEpisode> episodes,
      required final String name,
      required final String overview,
      required final int id,
      required final String? posterPath,
      required final int seasonNumber}) = _$_TVSeasonDetails;

  factory _TVSeasonDetails.fromJson(Map<String, dynamic> json) =
      _$_TVSeasonDetails.fromJson;

  @override
  @JsonKey(name: '_id')
  String get seasonId;
  @override
  DateTime? get airDate;
  @override
  List<TVEpisode> get episodes;
  @override
  String get name;
  @override
  String get overview;
  @override
  int get id;
  @override
  String? get posterPath;
  @override
  int get seasonNumber;
  @override
  @JsonKey(ignore: true)
  _$$_TVSeasonDetailsCopyWith<_$_TVSeasonDetails> get copyWith =>
      throw _privateConstructorUsedError;
}
