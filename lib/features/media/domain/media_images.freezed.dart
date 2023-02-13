// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'media_images.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MediaImages _$MediaImagesFromJson(Map<String, dynamic> json) {
  return _MediaImages.fromJson(json);
}

/// @nodoc
mixin _$MediaImages {
  int get id => throw _privateConstructorUsedError;
  List<ImageModel> get backdrops => throw _privateConstructorUsedError;
  List<ImageModel> get posters => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MediaImagesCopyWith<MediaImages> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MediaImagesCopyWith<$Res> {
  factory $MediaImagesCopyWith(
          MediaImages value, $Res Function(MediaImages) then) =
      _$MediaImagesCopyWithImpl<$Res, MediaImages>;
  @useResult
  $Res call({int id, List<ImageModel> backdrops, List<ImageModel> posters});
}

/// @nodoc
class _$MediaImagesCopyWithImpl<$Res, $Val extends MediaImages>
    implements $MediaImagesCopyWith<$Res> {
  _$MediaImagesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? backdrops = null,
    Object? posters = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      backdrops: null == backdrops
          ? _value.backdrops
          : backdrops // ignore: cast_nullable_to_non_nullable
              as List<ImageModel>,
      posters: null == posters
          ? _value.posters
          : posters // ignore: cast_nullable_to_non_nullable
              as List<ImageModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MediaImagesCopyWith<$Res>
    implements $MediaImagesCopyWith<$Res> {
  factory _$$_MediaImagesCopyWith(
          _$_MediaImages value, $Res Function(_$_MediaImages) then) =
      __$$_MediaImagesCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, List<ImageModel> backdrops, List<ImageModel> posters});
}

/// @nodoc
class __$$_MediaImagesCopyWithImpl<$Res>
    extends _$MediaImagesCopyWithImpl<$Res, _$_MediaImages>
    implements _$$_MediaImagesCopyWith<$Res> {
  __$$_MediaImagesCopyWithImpl(
      _$_MediaImages _value, $Res Function(_$_MediaImages) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? backdrops = null,
    Object? posters = null,
  }) {
    return _then(_$_MediaImages(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      backdrops: null == backdrops
          ? _value._backdrops
          : backdrops // ignore: cast_nullable_to_non_nullable
              as List<ImageModel>,
      posters: null == posters
          ? _value._posters
          : posters // ignore: cast_nullable_to_non_nullable
              as List<ImageModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MediaImages implements _MediaImages {
  const _$_MediaImages(
      {required this.id,
      required final List<ImageModel> backdrops,
      required final List<ImageModel> posters})
      : _backdrops = backdrops,
        _posters = posters;

  factory _$_MediaImages.fromJson(Map<String, dynamic> json) =>
      _$$_MediaImagesFromJson(json);

  @override
  final int id;
  final List<ImageModel> _backdrops;
  @override
  List<ImageModel> get backdrops {
    if (_backdrops is EqualUnmodifiableListView) return _backdrops;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_backdrops);
  }

  final List<ImageModel> _posters;
  @override
  List<ImageModel> get posters {
    if (_posters is EqualUnmodifiableListView) return _posters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_posters);
  }

  @override
  String toString() {
    return 'MediaImages(id: $id, backdrops: $backdrops, posters: $posters)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MediaImages &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality()
                .equals(other._backdrops, _backdrops) &&
            const DeepCollectionEquality().equals(other._posters, _posters));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      const DeepCollectionEquality().hash(_backdrops),
      const DeepCollectionEquality().hash(_posters));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MediaImagesCopyWith<_$_MediaImages> get copyWith =>
      __$$_MediaImagesCopyWithImpl<_$_MediaImages>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MediaImagesToJson(
      this,
    );
  }
}

abstract class _MediaImages implements MediaImages {
  const factory _MediaImages(
      {required final int id,
      required final List<ImageModel> backdrops,
      required final List<ImageModel> posters}) = _$_MediaImages;

  factory _MediaImages.fromJson(Map<String, dynamic> json) =
      _$_MediaImages.fromJson;

  @override
  int get id;
  @override
  List<ImageModel> get backdrops;
  @override
  List<ImageModel> get posters;
  @override
  @JsonKey(ignore: true)
  _$$_MediaImagesCopyWith<_$_MediaImages> get copyWith =>
      throw _privateConstructorUsedError;
}
