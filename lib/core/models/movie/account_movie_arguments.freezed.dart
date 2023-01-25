// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_movie_arguments.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AccountMovieArguments _$AccountMovieArgumentsFromJson(
    Map<String, dynamic> json) {
  return _AccountMovieArguments.fromJson(json);
}

/// @nodoc
mixin _$AccountMovieArguments {
  int get accountId => throw _privateConstructorUsedError;
  String get sessionId => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AccountMovieArgumentsCopyWith<AccountMovieArguments> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountMovieArgumentsCopyWith<$Res> {
  factory $AccountMovieArgumentsCopyWith(AccountMovieArguments value,
          $Res Function(AccountMovieArguments) then) =
      _$AccountMovieArgumentsCopyWithImpl<$Res, AccountMovieArguments>;
  @useResult
  $Res call({int accountId, String sessionId, int page});
}

/// @nodoc
class _$AccountMovieArgumentsCopyWithImpl<$Res,
        $Val extends AccountMovieArguments>
    implements $AccountMovieArgumentsCopyWith<$Res> {
  _$AccountMovieArgumentsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accountId = null,
    Object? sessionId = null,
    Object? page = null,
  }) {
    return _then(_value.copyWith(
      accountId: null == accountId
          ? _value.accountId
          : accountId // ignore: cast_nullable_to_non_nullable
              as int,
      sessionId: null == sessionId
          ? _value.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AccountMovieArgumentsCopyWith<$Res>
    implements $AccountMovieArgumentsCopyWith<$Res> {
  factory _$$_AccountMovieArgumentsCopyWith(_$_AccountMovieArguments value,
          $Res Function(_$_AccountMovieArguments) then) =
      __$$_AccountMovieArgumentsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int accountId, String sessionId, int page});
}

/// @nodoc
class __$$_AccountMovieArgumentsCopyWithImpl<$Res>
    extends _$AccountMovieArgumentsCopyWithImpl<$Res, _$_AccountMovieArguments>
    implements _$$_AccountMovieArgumentsCopyWith<$Res> {
  __$$_AccountMovieArgumentsCopyWithImpl(_$_AccountMovieArguments _value,
      $Res Function(_$_AccountMovieArguments) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accountId = null,
    Object? sessionId = null,
    Object? page = null,
  }) {
    return _then(_$_AccountMovieArguments(
      accountId: null == accountId
          ? _value.accountId
          : accountId // ignore: cast_nullable_to_non_nullable
              as int,
      sessionId: null == sessionId
          ? _value.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AccountMovieArguments implements _AccountMovieArguments {
  const _$_AccountMovieArguments(
      {required this.accountId, required this.sessionId, required this.page});

  factory _$_AccountMovieArguments.fromJson(Map<String, dynamic> json) =>
      _$$_AccountMovieArgumentsFromJson(json);

  @override
  final int accountId;
  @override
  final String sessionId;
  @override
  final int page;

  @override
  String toString() {
    return 'AccountMovieArguments(accountId: $accountId, sessionId: $sessionId, page: $page)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AccountMovieArguments &&
            (identical(other.accountId, accountId) ||
                other.accountId == accountId) &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId) &&
            (identical(other.page, page) || other.page == page));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, accountId, sessionId, page);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AccountMovieArgumentsCopyWith<_$_AccountMovieArguments> get copyWith =>
      __$$_AccountMovieArgumentsCopyWithImpl<_$_AccountMovieArguments>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AccountMovieArgumentsToJson(
      this,
    );
  }
}

abstract class _AccountMovieArguments implements AccountMovieArguments {
  const factory _AccountMovieArguments(
      {required final int accountId,
      required final String sessionId,
      required final int page}) = _$_AccountMovieArguments;

  factory _AccountMovieArguments.fromJson(Map<String, dynamic> json) =
      _$_AccountMovieArguments.fromJson;

  @override
  int get accountId;
  @override
  String get sessionId;
  @override
  int get page;
  @override
  @JsonKey(ignore: true)
  _$$_AccountMovieArgumentsCopyWith<_$_AccountMovieArguments> get copyWith =>
      throw _privateConstructorUsedError;
}
