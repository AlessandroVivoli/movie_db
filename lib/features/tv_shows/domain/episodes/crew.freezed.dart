// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'crew.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Crew _$CrewFromJson(Map<String, dynamic> json) {
  return _Crew.fromJson(json);
}

/// @nodoc
mixin _$Crew {
  int get id => throw _privateConstructorUsedError;
  String get creditId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get department => throw _privateConstructorUsedError;
  String get job => throw _privateConstructorUsedError;
  String? get profilePath => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CrewCopyWith<Crew> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CrewCopyWith<$Res> {
  factory $CrewCopyWith(Crew value, $Res Function(Crew) then) =
      _$CrewCopyWithImpl<$Res, Crew>;
  @useResult
  $Res call(
      {int id,
      String creditId,
      String name,
      String department,
      String job,
      String? profilePath});
}

/// @nodoc
class _$CrewCopyWithImpl<$Res, $Val extends Crew>
    implements $CrewCopyWith<$Res> {
  _$CrewCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? creditId = null,
    Object? name = null,
    Object? department = null,
    Object? job = null,
    Object? profilePath = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      creditId: null == creditId
          ? _value.creditId
          : creditId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      department: null == department
          ? _value.department
          : department // ignore: cast_nullable_to_non_nullable
              as String,
      job: null == job
          ? _value.job
          : job // ignore: cast_nullable_to_non_nullable
              as String,
      profilePath: freezed == profilePath
          ? _value.profilePath
          : profilePath // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CrewCopyWith<$Res> implements $CrewCopyWith<$Res> {
  factory _$$_CrewCopyWith(_$_Crew value, $Res Function(_$_Crew) then) =
      __$$_CrewCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String creditId,
      String name,
      String department,
      String job,
      String? profilePath});
}

/// @nodoc
class __$$_CrewCopyWithImpl<$Res> extends _$CrewCopyWithImpl<$Res, _$_Crew>
    implements _$$_CrewCopyWith<$Res> {
  __$$_CrewCopyWithImpl(_$_Crew _value, $Res Function(_$_Crew) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? creditId = null,
    Object? name = null,
    Object? department = null,
    Object? job = null,
    Object? profilePath = freezed,
  }) {
    return _then(_$_Crew(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      creditId: null == creditId
          ? _value.creditId
          : creditId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      department: null == department
          ? _value.department
          : department // ignore: cast_nullable_to_non_nullable
              as String,
      job: null == job
          ? _value.job
          : job // ignore: cast_nullable_to_non_nullable
              as String,
      profilePath: freezed == profilePath
          ? _value.profilePath
          : profilePath // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Crew implements _Crew {
  const _$_Crew(
      {required this.id,
      required this.creditId,
      required this.name,
      required this.department,
      required this.job,
      required this.profilePath});

  factory _$_Crew.fromJson(Map<String, dynamic> json) => _$$_CrewFromJson(json);

  @override
  final int id;
  @override
  final String creditId;
  @override
  final String name;
  @override
  final String department;
  @override
  final String job;
  @override
  final String? profilePath;

  @override
  String toString() {
    return 'Crew(id: $id, creditId: $creditId, name: $name, department: $department, job: $job, profilePath: $profilePath)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Crew &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.creditId, creditId) ||
                other.creditId == creditId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.department, department) ||
                other.department == department) &&
            (identical(other.job, job) || other.job == job) &&
            (identical(other.profilePath, profilePath) ||
                other.profilePath == profilePath));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, creditId, name, department, job, profilePath);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CrewCopyWith<_$_Crew> get copyWith =>
      __$$_CrewCopyWithImpl<_$_Crew>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CrewToJson(
      this,
    );
  }
}

abstract class _Crew implements Crew {
  const factory _Crew(
      {required final int id,
      required final String creditId,
      required final String name,
      required final String department,
      required final String job,
      required final String? profilePath}) = _$_Crew;

  factory _Crew.fromJson(Map<String, dynamic> json) = _$_Crew.fromJson;

  @override
  int get id;
  @override
  String get creditId;
  @override
  String get name;
  @override
  String get department;
  @override
  String get job;
  @override
  String? get profilePath;
  @override
  @JsonKey(ignore: true)
  _$$_CrewCopyWith<_$_Crew> get copyWith => throw _privateConstructorUsedError;
}
