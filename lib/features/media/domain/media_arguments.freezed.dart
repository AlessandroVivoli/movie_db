// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'media_arguments.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MediaArguments _$MediaArgumentsFromJson(Map<String, dynamic> json) {
  return _MediaArguments.fromJson(json);
}

/// @nodoc
mixin _$MediaArguments {
  List<int> get withGenres => throw _privateConstructorUsedError;
  SortBy get sortBy => throw _privateConstructorUsedError;
  bool get includeAdult => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MediaArgumentsCopyWith<MediaArguments> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MediaArgumentsCopyWith<$Res> {
  factory $MediaArgumentsCopyWith(
          MediaArguments value, $Res Function(MediaArguments) then) =
      _$MediaArgumentsCopyWithImpl<$Res, MediaArguments>;
  @useResult
  $Res call({List<int> withGenres, SortBy sortBy, bool includeAdult});

  $SortByCopyWith<$Res> get sortBy;
}

/// @nodoc
class _$MediaArgumentsCopyWithImpl<$Res, $Val extends MediaArguments>
    implements $MediaArgumentsCopyWith<$Res> {
  _$MediaArgumentsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? withGenres = null,
    Object? sortBy = null,
    Object? includeAdult = null,
  }) {
    return _then(_value.copyWith(
      withGenres: null == withGenres
          ? _value.withGenres
          : withGenres // ignore: cast_nullable_to_non_nullable
              as List<int>,
      sortBy: null == sortBy
          ? _value.sortBy
          : sortBy // ignore: cast_nullable_to_non_nullable
              as SortBy,
      includeAdult: null == includeAdult
          ? _value.includeAdult
          : includeAdult // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SortByCopyWith<$Res> get sortBy {
    return $SortByCopyWith<$Res>(_value.sortBy, (value) {
      return _then(_value.copyWith(sortBy: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_MediaArgumentsCopyWith<$Res>
    implements $MediaArgumentsCopyWith<$Res> {
  factory _$$_MediaArgumentsCopyWith(
          _$_MediaArguments value, $Res Function(_$_MediaArguments) then) =
      __$$_MediaArgumentsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<int> withGenres, SortBy sortBy, bool includeAdult});

  @override
  $SortByCopyWith<$Res> get sortBy;
}

/// @nodoc
class __$$_MediaArgumentsCopyWithImpl<$Res>
    extends _$MediaArgumentsCopyWithImpl<$Res, _$_MediaArguments>
    implements _$$_MediaArgumentsCopyWith<$Res> {
  __$$_MediaArgumentsCopyWithImpl(
      _$_MediaArguments _value, $Res Function(_$_MediaArguments) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? withGenres = null,
    Object? sortBy = null,
    Object? includeAdult = null,
  }) {
    return _then(_$_MediaArguments(
      withGenres: null == withGenres
          ? _value._withGenres
          : withGenres // ignore: cast_nullable_to_non_nullable
              as List<int>,
      sortBy: null == sortBy
          ? _value.sortBy
          : sortBy // ignore: cast_nullable_to_non_nullable
              as SortBy,
      includeAdult: null == includeAdult
          ? _value.includeAdult
          : includeAdult // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MediaArguments implements _MediaArguments {
  const _$_MediaArguments(
      {required final List<int> withGenres,
      this.sortBy = SortBy.popularityDesc,
      this.includeAdult = false})
      : _withGenres = withGenres;

  factory _$_MediaArguments.fromJson(Map<String, dynamic> json) =>
      _$$_MediaArgumentsFromJson(json);

  final List<int> _withGenres;
  @override
  List<int> get withGenres {
    if (_withGenres is EqualUnmodifiableListView) return _withGenres;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_withGenres);
  }

  @override
  @JsonKey()
  final SortBy sortBy;
  @override
  @JsonKey()
  final bool includeAdult;

  @override
  String toString() {
    return 'MediaArguments(withGenres: $withGenres, sortBy: $sortBy, includeAdult: $includeAdult)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MediaArguments &&
            const DeepCollectionEquality()
                .equals(other._withGenres, _withGenres) &&
            (identical(other.sortBy, sortBy) || other.sortBy == sortBy) &&
            (identical(other.includeAdult, includeAdult) ||
                other.includeAdult == includeAdult));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_withGenres), sortBy, includeAdult);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MediaArgumentsCopyWith<_$_MediaArguments> get copyWith =>
      __$$_MediaArgumentsCopyWithImpl<_$_MediaArguments>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MediaArgumentsToJson(
      this,
    );
  }
}

abstract class _MediaArguments implements MediaArguments {
  const factory _MediaArguments(
      {required final List<int> withGenres,
      final SortBy sortBy,
      final bool includeAdult}) = _$_MediaArguments;

  factory _MediaArguments.fromJson(Map<String, dynamic> json) =
      _$_MediaArguments.fromJson;

  @override
  List<int> get withGenres;
  @override
  SortBy get sortBy;
  @override
  bool get includeAdult;
  @override
  @JsonKey(ignore: true)
  _$$_MediaArgumentsCopyWith<_$_MediaArguments> get copyWith =>
      throw _privateConstructorUsedError;
}
