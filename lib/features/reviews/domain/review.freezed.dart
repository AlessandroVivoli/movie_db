// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'review.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Review _$ReviewFromJson(Map<String, dynamic> json) {
  return _Review.fromJson(json);
}

/// @nodoc
mixin _$Review {
  String get author => throw _privateConstructorUsedError;
  ReviewAuthorDetails get authorDetails => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  @DateTimeConverter()
  DateTime? get createdAt => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  @DateTimeConverter()
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReviewCopyWith<Review> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReviewCopyWith<$Res> {
  factory $ReviewCopyWith(Review value, $Res Function(Review) then) =
      _$ReviewCopyWithImpl<$Res, Review>;
  @useResult
  $Res call(
      {String author,
      ReviewAuthorDetails authorDetails,
      String content,
      @DateTimeConverter() DateTime? createdAt,
      String id,
      @DateTimeConverter() DateTime? updatedAt,
      String url});

  $ReviewAuthorDetailsCopyWith<$Res> get authorDetails;
}

/// @nodoc
class _$ReviewCopyWithImpl<$Res, $Val extends Review>
    implements $ReviewCopyWith<$Res> {
  _$ReviewCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? author = null,
    Object? authorDetails = null,
    Object? content = null,
    Object? createdAt = freezed,
    Object? id = null,
    Object? updatedAt = freezed,
    Object? url = null,
  }) {
    return _then(_value.copyWith(
      author: null == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
      authorDetails: null == authorDetails
          ? _value.authorDetails
          : authorDetails // ignore: cast_nullable_to_non_nullable
              as ReviewAuthorDetails,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ReviewAuthorDetailsCopyWith<$Res> get authorDetails {
    return $ReviewAuthorDetailsCopyWith<$Res>(_value.authorDetails, (value) {
      return _then(_value.copyWith(authorDetails: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ReviewCopyWith<$Res> implements $ReviewCopyWith<$Res> {
  factory _$$_ReviewCopyWith(_$_Review value, $Res Function(_$_Review) then) =
      __$$_ReviewCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String author,
      ReviewAuthorDetails authorDetails,
      String content,
      @DateTimeConverter() DateTime? createdAt,
      String id,
      @DateTimeConverter() DateTime? updatedAt,
      String url});

  @override
  $ReviewAuthorDetailsCopyWith<$Res> get authorDetails;
}

/// @nodoc
class __$$_ReviewCopyWithImpl<$Res>
    extends _$ReviewCopyWithImpl<$Res, _$_Review>
    implements _$$_ReviewCopyWith<$Res> {
  __$$_ReviewCopyWithImpl(_$_Review _value, $Res Function(_$_Review) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? author = null,
    Object? authorDetails = null,
    Object? content = null,
    Object? createdAt = freezed,
    Object? id = null,
    Object? updatedAt = freezed,
    Object? url = null,
  }) {
    return _then(_$_Review(
      author: null == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
      authorDetails: null == authorDetails
          ? _value.authorDetails
          : authorDetails // ignore: cast_nullable_to_non_nullable
              as ReviewAuthorDetails,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Review implements _Review {
  const _$_Review(
      {required this.author,
      required this.authorDetails,
      required this.content,
      @DateTimeConverter() required this.createdAt,
      required this.id,
      @DateTimeConverter() required this.updatedAt,
      required this.url});

  factory _$_Review.fromJson(Map<String, dynamic> json) =>
      _$$_ReviewFromJson(json);

  @override
  final String author;
  @override
  final ReviewAuthorDetails authorDetails;
  @override
  final String content;
  @override
  @DateTimeConverter()
  final DateTime? createdAt;
  @override
  final String id;
  @override
  @DateTimeConverter()
  final DateTime? updatedAt;
  @override
  final String url;

  @override
  String toString() {
    return 'Review(author: $author, authorDetails: $authorDetails, content: $content, createdAt: $createdAt, id: $id, updatedAt: $updatedAt, url: $url)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Review &&
            (identical(other.author, author) || other.author == author) &&
            (identical(other.authorDetails, authorDetails) ||
                other.authorDetails == authorDetails) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, author, authorDetails, content,
      createdAt, id, updatedAt, url);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReviewCopyWith<_$_Review> get copyWith =>
      __$$_ReviewCopyWithImpl<_$_Review>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReviewToJson(
      this,
    );
  }
}

abstract class _Review implements Review {
  const factory _Review(
      {required final String author,
      required final ReviewAuthorDetails authorDetails,
      required final String content,
      @DateTimeConverter() required final DateTime? createdAt,
      required final String id,
      @DateTimeConverter() required final DateTime? updatedAt,
      required final String url}) = _$_Review;

  factory _Review.fromJson(Map<String, dynamic> json) = _$_Review.fromJson;

  @override
  String get author;
  @override
  ReviewAuthorDetails get authorDetails;
  @override
  String get content;
  @override
  @DateTimeConverter()
  DateTime? get createdAt;
  @override
  String get id;
  @override
  @DateTimeConverter()
  DateTime? get updatedAt;
  @override
  String get url;
  @override
  @JsonKey(ignore: true)
  _$$_ReviewCopyWith<_$_Review> get copyWith =>
      throw _privateConstructorUsedError;
}
