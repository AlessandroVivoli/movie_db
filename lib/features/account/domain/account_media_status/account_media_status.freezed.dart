// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_media_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AccountMediaStatus _$AccountMediaStatusFromJson(Map<String, dynamic> json) {
  return _AccountMediaStatus.fromJson(json);
}

/// @nodoc
mixin _$AccountMediaStatus {
  int get id => throw _privateConstructorUsedError;
  bool get favorite => throw _privateConstructorUsedError;
  dynamic get rated => throw _privateConstructorUsedError;
  bool get watchlist => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AccountMediaStatusCopyWith<AccountMediaStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountMediaStatusCopyWith<$Res> {
  factory $AccountMediaStatusCopyWith(
          AccountMediaStatus value, $Res Function(AccountMediaStatus) then) =
      _$AccountMediaStatusCopyWithImpl<$Res, AccountMediaStatus>;
  @useResult
  $Res call({int id, bool favorite, dynamic rated, bool watchlist});
}

/// @nodoc
class _$AccountMediaStatusCopyWithImpl<$Res, $Val extends AccountMediaStatus>
    implements $AccountMediaStatusCopyWith<$Res> {
  _$AccountMediaStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? favorite = null,
    Object? rated = freezed,
    Object? watchlist = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      favorite: null == favorite
          ? _value.favorite
          : favorite // ignore: cast_nullable_to_non_nullable
              as bool,
      rated: freezed == rated
          ? _value.rated
          : rated // ignore: cast_nullable_to_non_nullable
              as dynamic,
      watchlist: null == watchlist
          ? _value.watchlist
          : watchlist // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AccountMediaStatusCopyWith<$Res>
    implements $AccountMediaStatusCopyWith<$Res> {
  factory _$$_AccountMediaStatusCopyWith(_$_AccountMediaStatus value,
          $Res Function(_$_AccountMediaStatus) then) =
      __$$_AccountMediaStatusCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, bool favorite, dynamic rated, bool watchlist});
}

/// @nodoc
class __$$_AccountMediaStatusCopyWithImpl<$Res>
    extends _$AccountMediaStatusCopyWithImpl<$Res, _$_AccountMediaStatus>
    implements _$$_AccountMediaStatusCopyWith<$Res> {
  __$$_AccountMediaStatusCopyWithImpl(
      _$_AccountMediaStatus _value, $Res Function(_$_AccountMediaStatus) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? favorite = null,
    Object? rated = freezed,
    Object? watchlist = null,
  }) {
    return _then(_$_AccountMediaStatus(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      favorite: null == favorite
          ? _value.favorite
          : favorite // ignore: cast_nullable_to_non_nullable
              as bool,
      rated: freezed == rated
          ? _value.rated
          : rated // ignore: cast_nullable_to_non_nullable
              as dynamic,
      watchlist: null == watchlist
          ? _value.watchlist
          : watchlist // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AccountMediaStatus implements _AccountMediaStatus {
  const _$_AccountMediaStatus(
      {required this.id,
      required this.favorite,
      required this.rated,
      required this.watchlist});

  factory _$_AccountMediaStatus.fromJson(Map<String, dynamic> json) =>
      _$$_AccountMediaStatusFromJson(json);

  @override
  final int id;
  @override
  final bool favorite;
  @override
  final dynamic rated;
  @override
  final bool watchlist;

  @override
  String toString() {
    return 'AccountMediaStatus(id: $id, favorite: $favorite, rated: $rated, watchlist: $watchlist)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AccountMediaStatus &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.favorite, favorite) ||
                other.favorite == favorite) &&
            const DeepCollectionEquality().equals(other.rated, rated) &&
            (identical(other.watchlist, watchlist) ||
                other.watchlist == watchlist));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, favorite,
      const DeepCollectionEquality().hash(rated), watchlist);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AccountMediaStatusCopyWith<_$_AccountMediaStatus> get copyWith =>
      __$$_AccountMediaStatusCopyWithImpl<_$_AccountMediaStatus>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AccountMediaStatusToJson(
      this,
    );
  }
}

abstract class _AccountMediaStatus implements AccountMediaStatus {
  const factory _AccountMediaStatus(
      {required final int id,
      required final bool favorite,
      required final dynamic rated,
      required final bool watchlist}) = _$_AccountMediaStatus;

  factory _AccountMediaStatus.fromJson(Map<String, dynamic> json) =
      _$_AccountMediaStatus.fromJson;

  @override
  int get id;
  @override
  bool get favorite;
  @override
  dynamic get rated;
  @override
  bool get watchlist;
  @override
  @JsonKey(ignore: true)
  _$$_AccountMediaStatusCopyWith<_$_AccountMediaStatus> get copyWith =>
      throw _privateConstructorUsedError;
}
