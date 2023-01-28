// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AuthState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(User user) loggedIn,
    required TResult Function() loggedOut,
    required TResult Function() loading,
    required TResult Function(Object? error, StackTrace stack) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(User user)? loggedIn,
    TResult? Function()? loggedOut,
    TResult? Function()? loading,
    TResult? Function(Object? error, StackTrace stack)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(User user)? loggedIn,
    TResult Function()? loggedOut,
    TResult Function()? loading,
    TResult Function(Object? error, StackTrace stack)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoggedIn value) loggedIn,
    required TResult Function(LoggedOut value) loggedOut,
    required TResult Function(AuthLoading value) loading,
    required TResult Function(AuthError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoggedIn value)? loggedIn,
    TResult? Function(LoggedOut value)? loggedOut,
    TResult? Function(AuthLoading value)? loading,
    TResult? Function(AuthError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoggedIn value)? loggedIn,
    TResult Function(LoggedOut value)? loggedOut,
    TResult Function(AuthLoading value)? loading,
    TResult Function(AuthError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res, AuthState>;
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res, $Val extends AuthState>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LoggedInCopyWith<$Res> {
  factory _$$LoggedInCopyWith(
          _$LoggedIn value, $Res Function(_$LoggedIn) then) =
      __$$LoggedInCopyWithImpl<$Res>;
  @useResult
  $Res call({User user});

  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$$LoggedInCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$LoggedIn>
    implements _$$LoggedInCopyWith<$Res> {
  __$$LoggedInCopyWithImpl(_$LoggedIn _value, $Res Function(_$LoggedIn) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
  }) {
    return _then(_$LoggedIn(
      null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc

class _$LoggedIn implements LoggedIn {
  const _$LoggedIn(this.user);

  @override
  final User user;

  @override
  String toString() {
    return 'AuthState.loggedIn(user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoggedIn &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoggedInCopyWith<_$LoggedIn> get copyWith =>
      __$$LoggedInCopyWithImpl<_$LoggedIn>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(User user) loggedIn,
    required TResult Function() loggedOut,
    required TResult Function() loading,
    required TResult Function(Object? error, StackTrace stack) error,
  }) {
    return loggedIn(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(User user)? loggedIn,
    TResult? Function()? loggedOut,
    TResult? Function()? loading,
    TResult? Function(Object? error, StackTrace stack)? error,
  }) {
    return loggedIn?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(User user)? loggedIn,
    TResult Function()? loggedOut,
    TResult Function()? loading,
    TResult Function(Object? error, StackTrace stack)? error,
    required TResult orElse(),
  }) {
    if (loggedIn != null) {
      return loggedIn(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoggedIn value) loggedIn,
    required TResult Function(LoggedOut value) loggedOut,
    required TResult Function(AuthLoading value) loading,
    required TResult Function(AuthError value) error,
  }) {
    return loggedIn(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoggedIn value)? loggedIn,
    TResult? Function(LoggedOut value)? loggedOut,
    TResult? Function(AuthLoading value)? loading,
    TResult? Function(AuthError value)? error,
  }) {
    return loggedIn?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoggedIn value)? loggedIn,
    TResult Function(LoggedOut value)? loggedOut,
    TResult Function(AuthLoading value)? loading,
    TResult Function(AuthError value)? error,
    required TResult orElse(),
  }) {
    if (loggedIn != null) {
      return loggedIn(this);
    }
    return orElse();
  }
}

abstract class LoggedIn implements AuthState {
  const factory LoggedIn(final User user) = _$LoggedIn;

  User get user;
  @JsonKey(ignore: true)
  _$$LoggedInCopyWith<_$LoggedIn> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoggedOutCopyWith<$Res> {
  factory _$$LoggedOutCopyWith(
          _$LoggedOut value, $Res Function(_$LoggedOut) then) =
      __$$LoggedOutCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoggedOutCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$LoggedOut>
    implements _$$LoggedOutCopyWith<$Res> {
  __$$LoggedOutCopyWithImpl(
      _$LoggedOut _value, $Res Function(_$LoggedOut) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoggedOut implements LoggedOut {
  const _$LoggedOut();

  @override
  String toString() {
    return 'AuthState.loggedOut()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoggedOut);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(User user) loggedIn,
    required TResult Function() loggedOut,
    required TResult Function() loading,
    required TResult Function(Object? error, StackTrace stack) error,
  }) {
    return loggedOut();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(User user)? loggedIn,
    TResult? Function()? loggedOut,
    TResult? Function()? loading,
    TResult? Function(Object? error, StackTrace stack)? error,
  }) {
    return loggedOut?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(User user)? loggedIn,
    TResult Function()? loggedOut,
    TResult Function()? loading,
    TResult Function(Object? error, StackTrace stack)? error,
    required TResult orElse(),
  }) {
    if (loggedOut != null) {
      return loggedOut();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoggedIn value) loggedIn,
    required TResult Function(LoggedOut value) loggedOut,
    required TResult Function(AuthLoading value) loading,
    required TResult Function(AuthError value) error,
  }) {
    return loggedOut(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoggedIn value)? loggedIn,
    TResult? Function(LoggedOut value)? loggedOut,
    TResult? Function(AuthLoading value)? loading,
    TResult? Function(AuthError value)? error,
  }) {
    return loggedOut?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoggedIn value)? loggedIn,
    TResult Function(LoggedOut value)? loggedOut,
    TResult Function(AuthLoading value)? loading,
    TResult Function(AuthError value)? error,
    required TResult orElse(),
  }) {
    if (loggedOut != null) {
      return loggedOut(this);
    }
    return orElse();
  }
}

abstract class LoggedOut implements AuthState {
  const factory LoggedOut() = _$LoggedOut;
}

/// @nodoc
abstract class _$$AuthLoadingCopyWith<$Res> {
  factory _$$AuthLoadingCopyWith(
          _$AuthLoading value, $Res Function(_$AuthLoading) then) =
      __$$AuthLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthLoadingCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthLoading>
    implements _$$AuthLoadingCopyWith<$Res> {
  __$$AuthLoadingCopyWithImpl(
      _$AuthLoading _value, $Res Function(_$AuthLoading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AuthLoading implements AuthLoading {
  const _$AuthLoading();

  @override
  String toString() {
    return 'AuthState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AuthLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(User user) loggedIn,
    required TResult Function() loggedOut,
    required TResult Function() loading,
    required TResult Function(Object? error, StackTrace stack) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(User user)? loggedIn,
    TResult? Function()? loggedOut,
    TResult? Function()? loading,
    TResult? Function(Object? error, StackTrace stack)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(User user)? loggedIn,
    TResult Function()? loggedOut,
    TResult Function()? loading,
    TResult Function(Object? error, StackTrace stack)? error,
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
    required TResult Function(LoggedIn value) loggedIn,
    required TResult Function(LoggedOut value) loggedOut,
    required TResult Function(AuthLoading value) loading,
    required TResult Function(AuthError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoggedIn value)? loggedIn,
    TResult? Function(LoggedOut value)? loggedOut,
    TResult? Function(AuthLoading value)? loading,
    TResult? Function(AuthError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoggedIn value)? loggedIn,
    TResult Function(LoggedOut value)? loggedOut,
    TResult Function(AuthLoading value)? loading,
    TResult Function(AuthError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class AuthLoading implements AuthState {
  const factory AuthLoading() = _$AuthLoading;
}

/// @nodoc
abstract class _$$AuthErrorCopyWith<$Res> {
  factory _$$AuthErrorCopyWith(
          _$AuthError value, $Res Function(_$AuthError) then) =
      __$$AuthErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({Object? error, StackTrace stack});
}

/// @nodoc
class __$$AuthErrorCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthError>
    implements _$$AuthErrorCopyWith<$Res> {
  __$$AuthErrorCopyWithImpl(
      _$AuthError _value, $Res Function(_$AuthError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
    Object? stack = null,
  }) {
    return _then(_$AuthError(
      freezed == error ? _value.error : error,
      null == stack
          ? _value.stack
          : stack // ignore: cast_nullable_to_non_nullable
              as StackTrace,
    ));
  }
}

/// @nodoc

class _$AuthError implements AuthError {
  const _$AuthError(this.error, this.stack);

  @override
  final Object? error;
  @override
  final StackTrace stack;

  @override
  String toString() {
    return 'AuthState.error(error: $error, stack: $stack)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthError &&
            const DeepCollectionEquality().equals(other.error, error) &&
            (identical(other.stack, stack) || other.stack == stack));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(error), stack);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthErrorCopyWith<_$AuthError> get copyWith =>
      __$$AuthErrorCopyWithImpl<_$AuthError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(User user) loggedIn,
    required TResult Function() loggedOut,
    required TResult Function() loading,
    required TResult Function(Object? error, StackTrace stack) error,
  }) {
    return error(this.error, stack);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(User user)? loggedIn,
    TResult? Function()? loggedOut,
    TResult? Function()? loading,
    TResult? Function(Object? error, StackTrace stack)? error,
  }) {
    return error?.call(this.error, stack);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(User user)? loggedIn,
    TResult Function()? loggedOut,
    TResult Function()? loading,
    TResult Function(Object? error, StackTrace stack)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error, stack);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoggedIn value) loggedIn,
    required TResult Function(LoggedOut value) loggedOut,
    required TResult Function(AuthLoading value) loading,
    required TResult Function(AuthError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoggedIn value)? loggedIn,
    TResult? Function(LoggedOut value)? loggedOut,
    TResult? Function(AuthLoading value)? loading,
    TResult? Function(AuthError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoggedIn value)? loggedIn,
    TResult Function(LoggedOut value)? loggedOut,
    TResult Function(AuthLoading value)? loading,
    TResult Function(AuthError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class AuthError implements AuthState {
  const factory AuthError(final Object? error, final StackTrace stack) =
      _$AuthError;

  Object? get error;
  StackTrace get stack;
  @JsonKey(ignore: true)
  _$$AuthErrorCopyWith<_$AuthError> get copyWith =>
      throw _privateConstructorUsedError;
}
