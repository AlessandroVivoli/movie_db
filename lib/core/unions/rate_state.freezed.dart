// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rate_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RateState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() completed,
    required TResult Function() loading,
    required TResult Function(Object? error, StackTrace stackTrace) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? completed,
    TResult? Function()? loading,
    TResult? Function(Object? error, StackTrace stackTrace)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? completed,
    TResult Function()? loading,
    TResult Function(Object? error, StackTrace stackTrace)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RateInit value) init,
    required TResult Function(RateCompleted value) completed,
    required TResult Function(RateLoading value) loading,
    required TResult Function(RateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RateInit value)? init,
    TResult? Function(RateCompleted value)? completed,
    TResult? Function(RateLoading value)? loading,
    TResult? Function(RateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RateInit value)? init,
    TResult Function(RateCompleted value)? completed,
    TResult Function(RateLoading value)? loading,
    TResult Function(RateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RateStateCopyWith<$Res> {
  factory $RateStateCopyWith(RateState value, $Res Function(RateState) then) =
      _$RateStateCopyWithImpl<$Res, RateState>;
}

/// @nodoc
class _$RateStateCopyWithImpl<$Res, $Val extends RateState>
    implements $RateStateCopyWith<$Res> {
  _$RateStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$RateInitCopyWith<$Res> {
  factory _$$RateInitCopyWith(
          _$RateInit value, $Res Function(_$RateInit) then) =
      __$$RateInitCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RateInitCopyWithImpl<$Res>
    extends _$RateStateCopyWithImpl<$Res, _$RateInit>
    implements _$$RateInitCopyWith<$Res> {
  __$$RateInitCopyWithImpl(_$RateInit _value, $Res Function(_$RateInit) _then)
      : super(_value, _then);
}

/// @nodoc

class _$RateInit implements RateInit {
  const _$RateInit();

  @override
  String toString() {
    return 'RateState.init()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RateInit);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() completed,
    required TResult Function() loading,
    required TResult Function(Object? error, StackTrace stackTrace) error,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? completed,
    TResult? Function()? loading,
    TResult? Function(Object? error, StackTrace stackTrace)? error,
  }) {
    return init?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? completed,
    TResult Function()? loading,
    TResult Function(Object? error, StackTrace stackTrace)? error,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RateInit value) init,
    required TResult Function(RateCompleted value) completed,
    required TResult Function(RateLoading value) loading,
    required TResult Function(RateError value) error,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RateInit value)? init,
    TResult? Function(RateCompleted value)? completed,
    TResult? Function(RateLoading value)? loading,
    TResult? Function(RateError value)? error,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RateInit value)? init,
    TResult Function(RateCompleted value)? completed,
    TResult Function(RateLoading value)? loading,
    TResult Function(RateError value)? error,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class RateInit implements RateState {
  const factory RateInit() = _$RateInit;
}

/// @nodoc
abstract class _$$RateCompletedCopyWith<$Res> {
  factory _$$RateCompletedCopyWith(
          _$RateCompleted value, $Res Function(_$RateCompleted) then) =
      __$$RateCompletedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RateCompletedCopyWithImpl<$Res>
    extends _$RateStateCopyWithImpl<$Res, _$RateCompleted>
    implements _$$RateCompletedCopyWith<$Res> {
  __$$RateCompletedCopyWithImpl(
      _$RateCompleted _value, $Res Function(_$RateCompleted) _then)
      : super(_value, _then);
}

/// @nodoc

class _$RateCompleted implements RateCompleted {
  const _$RateCompleted();

  @override
  String toString() {
    return 'RateState.completed()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RateCompleted);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() completed,
    required TResult Function() loading,
    required TResult Function(Object? error, StackTrace stackTrace) error,
  }) {
    return completed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? completed,
    TResult? Function()? loading,
    TResult? Function(Object? error, StackTrace stackTrace)? error,
  }) {
    return completed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? completed,
    TResult Function()? loading,
    TResult Function(Object? error, StackTrace stackTrace)? error,
    required TResult orElse(),
  }) {
    if (completed != null) {
      return completed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RateInit value) init,
    required TResult Function(RateCompleted value) completed,
    required TResult Function(RateLoading value) loading,
    required TResult Function(RateError value) error,
  }) {
    return completed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RateInit value)? init,
    TResult? Function(RateCompleted value)? completed,
    TResult? Function(RateLoading value)? loading,
    TResult? Function(RateError value)? error,
  }) {
    return completed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RateInit value)? init,
    TResult Function(RateCompleted value)? completed,
    TResult Function(RateLoading value)? loading,
    TResult Function(RateError value)? error,
    required TResult orElse(),
  }) {
    if (completed != null) {
      return completed(this);
    }
    return orElse();
  }
}

abstract class RateCompleted implements RateState {
  const factory RateCompleted() = _$RateCompleted;
}

/// @nodoc
abstract class _$$RateLoadingCopyWith<$Res> {
  factory _$$RateLoadingCopyWith(
          _$RateLoading value, $Res Function(_$RateLoading) then) =
      __$$RateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RateLoadingCopyWithImpl<$Res>
    extends _$RateStateCopyWithImpl<$Res, _$RateLoading>
    implements _$$RateLoadingCopyWith<$Res> {
  __$$RateLoadingCopyWithImpl(
      _$RateLoading _value, $Res Function(_$RateLoading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$RateLoading implements RateLoading {
  const _$RateLoading();

  @override
  String toString() {
    return 'RateState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() completed,
    required TResult Function() loading,
    required TResult Function(Object? error, StackTrace stackTrace) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? completed,
    TResult? Function()? loading,
    TResult? Function(Object? error, StackTrace stackTrace)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? completed,
    TResult Function()? loading,
    TResult Function(Object? error, StackTrace stackTrace)? error,
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
    required TResult Function(RateInit value) init,
    required TResult Function(RateCompleted value) completed,
    required TResult Function(RateLoading value) loading,
    required TResult Function(RateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RateInit value)? init,
    TResult? Function(RateCompleted value)? completed,
    TResult? Function(RateLoading value)? loading,
    TResult? Function(RateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RateInit value)? init,
    TResult Function(RateCompleted value)? completed,
    TResult Function(RateLoading value)? loading,
    TResult Function(RateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class RateLoading implements RateState {
  const factory RateLoading() = _$RateLoading;
}

/// @nodoc
abstract class _$$RateErrorCopyWith<$Res> {
  factory _$$RateErrorCopyWith(
          _$RateError value, $Res Function(_$RateError) then) =
      __$$RateErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({Object? error, StackTrace stackTrace});
}

/// @nodoc
class __$$RateErrorCopyWithImpl<$Res>
    extends _$RateStateCopyWithImpl<$Res, _$RateError>
    implements _$$RateErrorCopyWith<$Res> {
  __$$RateErrorCopyWithImpl(
      _$RateError _value, $Res Function(_$RateError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
    Object? stackTrace = null,
  }) {
    return _then(_$RateError(
      freezed == error ? _value.error : error,
      null == stackTrace
          ? _value.stackTrace
          : stackTrace // ignore: cast_nullable_to_non_nullable
              as StackTrace,
    ));
  }
}

/// @nodoc

class _$RateError implements RateError {
  const _$RateError(this.error, this.stackTrace);

  @override
  final Object? error;
  @override
  final StackTrace stackTrace;

  @override
  String toString() {
    return 'RateState.error(error: $error, stackTrace: $stackTrace)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RateError &&
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
  _$$RateErrorCopyWith<_$RateError> get copyWith =>
      __$$RateErrorCopyWithImpl<_$RateError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() completed,
    required TResult Function() loading,
    required TResult Function(Object? error, StackTrace stackTrace) error,
  }) {
    return error(this.error, stackTrace);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? completed,
    TResult? Function()? loading,
    TResult? Function(Object? error, StackTrace stackTrace)? error,
  }) {
    return error?.call(this.error, stackTrace);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? completed,
    TResult Function()? loading,
    TResult Function(Object? error, StackTrace stackTrace)? error,
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
    required TResult Function(RateInit value) init,
    required TResult Function(RateCompleted value) completed,
    required TResult Function(RateLoading value) loading,
    required TResult Function(RateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RateInit value)? init,
    TResult? Function(RateCompleted value)? completed,
    TResult? Function(RateLoading value)? loading,
    TResult? Function(RateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RateInit value)? init,
    TResult Function(RateCompleted value)? completed,
    TResult Function(RateLoading value)? loading,
    TResult Function(RateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class RateError implements RateState {
  const factory RateError(final Object? error, final StackTrace stackTrace) =
      _$RateError;

  Object? get error;
  StackTrace get stackTrace;
  @JsonKey(ignore: true)
  _$$RateErrorCopyWith<_$RateError> get copyWith =>
      throw _privateConstructorUsedError;
}
