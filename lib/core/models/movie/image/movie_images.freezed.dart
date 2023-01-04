// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movie_images.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MovieImages _$MovieImagesFromJson(Map<String, dynamic> json) {
  return _MovieImages.fromJson(json);
}

/// @nodoc
mixin _$MovieImages {
  List<MovieImage> get backdrops => throw _privateConstructorUsedError;
  List<MovieImage> get posters => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MovieImagesCopyWith<MovieImages> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MovieImagesCopyWith<$Res> {
  factory $MovieImagesCopyWith(
          MovieImages value, $Res Function(MovieImages) then) =
      _$MovieImagesCopyWithImpl<$Res, MovieImages>;
  @useResult
  $Res call({List<MovieImage> backdrops, List<MovieImage> posters});
}

/// @nodoc
class _$MovieImagesCopyWithImpl<$Res, $Val extends MovieImages>
    implements $MovieImagesCopyWith<$Res> {
  _$MovieImagesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? backdrops = null,
    Object? posters = null,
  }) {
    return _then(_value.copyWith(
      backdrops: null == backdrops
          ? _value.backdrops
          : backdrops // ignore: cast_nullable_to_non_nullable
              as List<MovieImage>,
      posters: null == posters
          ? _value.posters
          : posters // ignore: cast_nullable_to_non_nullable
              as List<MovieImage>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MovieImagesCopyWith<$Res>
    implements $MovieImagesCopyWith<$Res> {
  factory _$$_MovieImagesCopyWith(
          _$_MovieImages value, $Res Function(_$_MovieImages) then) =
      __$$_MovieImagesCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<MovieImage> backdrops, List<MovieImage> posters});
}

/// @nodoc
class __$$_MovieImagesCopyWithImpl<$Res>
    extends _$MovieImagesCopyWithImpl<$Res, _$_MovieImages>
    implements _$$_MovieImagesCopyWith<$Res> {
  __$$_MovieImagesCopyWithImpl(
      _$_MovieImages _value, $Res Function(_$_MovieImages) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? backdrops = null,
    Object? posters = null,
  }) {
    return _then(_$_MovieImages(
      backdrops: null == backdrops
          ? _value._backdrops
          : backdrops // ignore: cast_nullable_to_non_nullable
              as List<MovieImage>,
      posters: null == posters
          ? _value._posters
          : posters // ignore: cast_nullable_to_non_nullable
              as List<MovieImage>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MovieImages implements _MovieImages {
  const _$_MovieImages(
      {required final List<MovieImage> backdrops,
      required final List<MovieImage> posters})
      : _backdrops = backdrops,
        _posters = posters;

  factory _$_MovieImages.fromJson(Map<String, dynamic> json) =>
      _$$_MovieImagesFromJson(json);

  final List<MovieImage> _backdrops;
  @override
  List<MovieImage> get backdrops {
    if (_backdrops is EqualUnmodifiableListView) return _backdrops;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_backdrops);
  }

  final List<MovieImage> _posters;
  @override
  List<MovieImage> get posters {
    if (_posters is EqualUnmodifiableListView) return _posters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_posters);
  }

  @override
  String toString() {
    return 'MovieImages(backdrops: $backdrops, posters: $posters)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MovieImages &&
            const DeepCollectionEquality()
                .equals(other._backdrops, _backdrops) &&
            const DeepCollectionEquality().equals(other._posters, _posters));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_backdrops),
      const DeepCollectionEquality().hash(_posters));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MovieImagesCopyWith<_$_MovieImages> get copyWith =>
      __$$_MovieImagesCopyWithImpl<_$_MovieImages>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MovieImagesToJson(
      this,
    );
  }
}

abstract class _MovieImages implements MovieImages {
  const factory _MovieImages(
      {required final List<MovieImage> backdrops,
      required final List<MovieImage> posters}) = _$_MovieImages;

  factory _MovieImages.fromJson(Map<String, dynamic> json) =
      _$_MovieImages.fromJson;

  @override
  List<MovieImage> get backdrops;
  @override
  List<MovieImage> get posters;
  @override
  @JsonKey(ignore: true)
  _$$_MovieImagesCopyWith<_$_MovieImages> get copyWith =>
      throw _privateConstructorUsedError;
}
