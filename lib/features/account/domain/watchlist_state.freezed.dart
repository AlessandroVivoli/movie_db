// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'watchlist_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$WatchlistState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool watchlist) success,
    required TResult Function() loading,
    required TResult Function(Object error, StackTrace stackTrace) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool watchlist)? success,
    TResult? Function()? loading,
    TResult? Function(Object error, StackTrace stackTrace)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool watchlist)? success,
    TResult Function()? loading,
    TResult Function(Object error, StackTrace stackTrace)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WatchlistSuccess value) success,
    required TResult Function(WatchlistLoading value) loading,
    required TResult Function(WatchlistError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(WatchlistSuccess value)? success,
    TResult? Function(WatchlistLoading value)? loading,
    TResult? Function(WatchlistError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WatchlistSuccess value)? success,
    TResult Function(WatchlistLoading value)? loading,
    TResult Function(WatchlistError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WatchlistStateCopyWith<$Res> {
  factory $WatchlistStateCopyWith(
          WatchlistState value, $Res Function(WatchlistState) then) =
      _$WatchlistStateCopyWithImpl<$Res, WatchlistState>;
}

/// @nodoc
class _$WatchlistStateCopyWithImpl<$Res, $Val extends WatchlistState>
    implements $WatchlistStateCopyWith<$Res> {
  _$WatchlistStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$WatchlistSuccessCopyWith<$Res> {
  factory _$$WatchlistSuccessCopyWith(
          _$WatchlistSuccess value, $Res Function(_$WatchlistSuccess) then) =
      __$$WatchlistSuccessCopyWithImpl<$Res>;
  @useResult
  $Res call({bool watchlist});
}

/// @nodoc
class __$$WatchlistSuccessCopyWithImpl<$Res>
    extends _$WatchlistStateCopyWithImpl<$Res, _$WatchlistSuccess>
    implements _$$WatchlistSuccessCopyWith<$Res> {
  __$$WatchlistSuccessCopyWithImpl(
      _$WatchlistSuccess _value, $Res Function(_$WatchlistSuccess) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? watchlist = null,
  }) {
    return _then(_$WatchlistSuccess(
      null == watchlist
          ? _value.watchlist
          : watchlist // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$WatchlistSuccess implements WatchlistSuccess {
  const _$WatchlistSuccess(this.watchlist);

  @override
  final bool watchlist;

  @override
  String toString() {
    return 'WatchlistState.success(watchlist: $watchlist)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WatchlistSuccess &&
            (identical(other.watchlist, watchlist) ||
                other.watchlist == watchlist));
  }

  @override
  int get hashCode => Object.hash(runtimeType, watchlist);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WatchlistSuccessCopyWith<_$WatchlistSuccess> get copyWith =>
      __$$WatchlistSuccessCopyWithImpl<_$WatchlistSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool watchlist) success,
    required TResult Function() loading,
    required TResult Function(Object error, StackTrace stackTrace) error,
  }) {
    return success(watchlist);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool watchlist)? success,
    TResult? Function()? loading,
    TResult? Function(Object error, StackTrace stackTrace)? error,
  }) {
    return success?.call(watchlist);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool watchlist)? success,
    TResult Function()? loading,
    TResult Function(Object error, StackTrace stackTrace)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(watchlist);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WatchlistSuccess value) success,
    required TResult Function(WatchlistLoading value) loading,
    required TResult Function(WatchlistError value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(WatchlistSuccess value)? success,
    TResult? Function(WatchlistLoading value)? loading,
    TResult? Function(WatchlistError value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WatchlistSuccess value)? success,
    TResult Function(WatchlistLoading value)? loading,
    TResult Function(WatchlistError value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class WatchlistSuccess implements WatchlistState {
  const factory WatchlistSuccess(final bool watchlist) = _$WatchlistSuccess;

  bool get watchlist;
  @JsonKey(ignore: true)
  _$$WatchlistSuccessCopyWith<_$WatchlistSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$WatchlistLoadingCopyWith<$Res> {
  factory _$$WatchlistLoadingCopyWith(
          _$WatchlistLoading value, $Res Function(_$WatchlistLoading) then) =
      __$$WatchlistLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$WatchlistLoadingCopyWithImpl<$Res>
    extends _$WatchlistStateCopyWithImpl<$Res, _$WatchlistLoading>
    implements _$$WatchlistLoadingCopyWith<$Res> {
  __$$WatchlistLoadingCopyWithImpl(
      _$WatchlistLoading _value, $Res Function(_$WatchlistLoading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$WatchlistLoading implements WatchlistLoading {
  const _$WatchlistLoading();

  @override
  String toString() {
    return 'WatchlistState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$WatchlistLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool watchlist) success,
    required TResult Function() loading,
    required TResult Function(Object error, StackTrace stackTrace) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool watchlist)? success,
    TResult? Function()? loading,
    TResult? Function(Object error, StackTrace stackTrace)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool watchlist)? success,
    TResult Function()? loading,
    TResult Function(Object error, StackTrace stackTrace)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WatchlistSuccess value) success,
    required TResult Function(WatchlistLoading value) loading,
    required TResult Function(WatchlistError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(WatchlistSuccess value)? success,
    TResult? Function(WatchlistLoading value)? loading,
    TResult? Function(WatchlistError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WatchlistSuccess value)? success,
    TResult Function(WatchlistLoading value)? loading,
    TResult Function(WatchlistError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class WatchlistLoading implements WatchlistState {
  const factory WatchlistLoading() = _$WatchlistLoading;
}

/// @nodoc
abstract class _$$WatchlistErrorCopyWith<$Res> {
  factory _$$WatchlistErrorCopyWith(
          _$WatchlistError value, $Res Function(_$WatchlistError) then) =
      __$$WatchlistErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({Object error, StackTrace stackTrace});
}

/// @nodoc
class __$$WatchlistErrorCopyWithImpl<$Res>
    extends _$WatchlistStateCopyWithImpl<$Res, _$WatchlistError>
    implements _$$WatchlistErrorCopyWith<$Res> {
  __$$WatchlistErrorCopyWithImpl(
      _$WatchlistError _value, $Res Function(_$WatchlistError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
    Object? stackTrace = null,
  }) {
    return _then(_$WatchlistError(
      null == error ? _value.error : error,
      null == stackTrace
          ? _value.stackTrace
          : stackTrace // ignore: cast_nullable_to_non_nullable
              as StackTrace,
    ));
  }
}

/// @nodoc

class _$WatchlistError implements WatchlistError {
  const _$WatchlistError(this.error, this.stackTrace);

  @override
  final Object error;
  @override
  final StackTrace stackTrace;

  @override
  String toString() {
    return 'WatchlistState.error(error: $error, stackTrace: $stackTrace)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WatchlistError &&
            const DeepCollectionEquality().equals(other.error, error) &&
            (identical(other.stackTrace, stackTrace) ||
                other.stackTrace == stackTrace));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(error), stackTrace);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WatchlistErrorCopyWith<_$WatchlistError> get copyWith =>
      __$$WatchlistErrorCopyWithImpl<_$WatchlistError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool watchlist) success,
    required TResult Function() loading,
    required TResult Function(Object error, StackTrace stackTrace) error,
  }) {
    return error(this.error, stackTrace);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool watchlist)? success,
    TResult? Function()? loading,
    TResult? Function(Object error, StackTrace stackTrace)? error,
  }) {
    return error?.call(this.error, stackTrace);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool watchlist)? success,
    TResult Function()? loading,
    TResult Function(Object error, StackTrace stackTrace)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error, stackTrace);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WatchlistSuccess value) success,
    required TResult Function(WatchlistLoading value) loading,
    required TResult Function(WatchlistError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(WatchlistSuccess value)? success,
    TResult? Function(WatchlistLoading value)? loading,
    TResult? Function(WatchlistError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WatchlistSuccess value)? success,
    TResult Function(WatchlistLoading value)? loading,
    TResult Function(WatchlistError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class WatchlistError implements WatchlistState {
  const factory WatchlistError(
      final Object error, final StackTrace stackTrace) = _$WatchlistError;

  Object get error;
  StackTrace get stackTrace;
  @JsonKey(ignore: true)
  _$$WatchlistErrorCopyWith<_$WatchlistError> get copyWith =>
      throw _privateConstructorUsedError;
}
