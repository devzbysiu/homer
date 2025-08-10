// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'backup_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BackupEvent {
  String get path => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String path) restoreTriggered,
    required TResult Function(String path) backupTriggered,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String path)? restoreTriggered,
    TResult? Function(String path)? backupTriggered,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String path)? restoreTriggered,
    TResult Function(String path)? backupTriggered,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RestoreTriggered value) restoreTriggered,
    required TResult Function(BackupTriggered value) backupTriggered,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RestoreTriggered value)? restoreTriggered,
    TResult? Function(BackupTriggered value)? backupTriggered,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RestoreTriggered value)? restoreTriggered,
    TResult Function(BackupTriggered value)? backupTriggered,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of BackupEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BackupEventCopyWith<BackupEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BackupEventCopyWith<$Res> {
  factory $BackupEventCopyWith(
          BackupEvent value, $Res Function(BackupEvent) then) =
      _$BackupEventCopyWithImpl<$Res, BackupEvent>;
  @useResult
  $Res call({String path});
}

/// @nodoc
class _$BackupEventCopyWithImpl<$Res, $Val extends BackupEvent>
    implements $BackupEventCopyWith<$Res> {
  _$BackupEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BackupEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? path = null,
  }) {
    return _then(_value.copyWith(
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RestoreTriggeredImplCopyWith<$Res>
    implements $BackupEventCopyWith<$Res> {
  factory _$$RestoreTriggeredImplCopyWith(_$RestoreTriggeredImpl value,
          $Res Function(_$RestoreTriggeredImpl) then) =
      __$$RestoreTriggeredImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String path});
}

/// @nodoc
class __$$RestoreTriggeredImplCopyWithImpl<$Res>
    extends _$BackupEventCopyWithImpl<$Res, _$RestoreTriggeredImpl>
    implements _$$RestoreTriggeredImplCopyWith<$Res> {
  __$$RestoreTriggeredImplCopyWithImpl(_$RestoreTriggeredImpl _value,
      $Res Function(_$RestoreTriggeredImpl) _then)
      : super(_value, _then);

  /// Create a copy of BackupEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? path = null,
  }) {
    return _then(_$RestoreTriggeredImpl(
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RestoreTriggeredImpl implements RestoreTriggered {
  const _$RestoreTriggeredImpl({required this.path});

  @override
  final String path;

  @override
  String toString() {
    return 'BackupEvent.restoreTriggered(path: $path)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RestoreTriggeredImpl &&
            (identical(other.path, path) || other.path == path));
  }

  @override
  int get hashCode => Object.hash(runtimeType, path);

  /// Create a copy of BackupEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RestoreTriggeredImplCopyWith<_$RestoreTriggeredImpl> get copyWith =>
      __$$RestoreTriggeredImplCopyWithImpl<_$RestoreTriggeredImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String path) restoreTriggered,
    required TResult Function(String path) backupTriggered,
  }) {
    return restoreTriggered(path);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String path)? restoreTriggered,
    TResult? Function(String path)? backupTriggered,
  }) {
    return restoreTriggered?.call(path);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String path)? restoreTriggered,
    TResult Function(String path)? backupTriggered,
    required TResult orElse(),
  }) {
    if (restoreTriggered != null) {
      return restoreTriggered(path);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RestoreTriggered value) restoreTriggered,
    required TResult Function(BackupTriggered value) backupTriggered,
  }) {
    return restoreTriggered(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RestoreTriggered value)? restoreTriggered,
    TResult? Function(BackupTriggered value)? backupTriggered,
  }) {
    return restoreTriggered?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RestoreTriggered value)? restoreTriggered,
    TResult Function(BackupTriggered value)? backupTriggered,
    required TResult orElse(),
  }) {
    if (restoreTriggered != null) {
      return restoreTriggered(this);
    }
    return orElse();
  }
}

abstract class RestoreTriggered implements BackupEvent {
  const factory RestoreTriggered({required final String path}) =
      _$RestoreTriggeredImpl;

  @override
  String get path;

  /// Create a copy of BackupEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RestoreTriggeredImplCopyWith<_$RestoreTriggeredImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BackupTriggeredImplCopyWith<$Res>
    implements $BackupEventCopyWith<$Res> {
  factory _$$BackupTriggeredImplCopyWith(_$BackupTriggeredImpl value,
          $Res Function(_$BackupTriggeredImpl) then) =
      __$$BackupTriggeredImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String path});
}

/// @nodoc
class __$$BackupTriggeredImplCopyWithImpl<$Res>
    extends _$BackupEventCopyWithImpl<$Res, _$BackupTriggeredImpl>
    implements _$$BackupTriggeredImplCopyWith<$Res> {
  __$$BackupTriggeredImplCopyWithImpl(
      _$BackupTriggeredImpl _value, $Res Function(_$BackupTriggeredImpl) _then)
      : super(_value, _then);

  /// Create a copy of BackupEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? path = null,
  }) {
    return _then(_$BackupTriggeredImpl(
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$BackupTriggeredImpl implements BackupTriggered {
  const _$BackupTriggeredImpl({required this.path});

  @override
  final String path;

  @override
  String toString() {
    return 'BackupEvent.backupTriggered(path: $path)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BackupTriggeredImpl &&
            (identical(other.path, path) || other.path == path));
  }

  @override
  int get hashCode => Object.hash(runtimeType, path);

  /// Create a copy of BackupEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BackupTriggeredImplCopyWith<_$BackupTriggeredImpl> get copyWith =>
      __$$BackupTriggeredImplCopyWithImpl<_$BackupTriggeredImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String path) restoreTriggered,
    required TResult Function(String path) backupTriggered,
  }) {
    return backupTriggered(path);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String path)? restoreTriggered,
    TResult? Function(String path)? backupTriggered,
  }) {
    return backupTriggered?.call(path);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String path)? restoreTriggered,
    TResult Function(String path)? backupTriggered,
    required TResult orElse(),
  }) {
    if (backupTriggered != null) {
      return backupTriggered(path);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RestoreTriggered value) restoreTriggered,
    required TResult Function(BackupTriggered value) backupTriggered,
  }) {
    return backupTriggered(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RestoreTriggered value)? restoreTriggered,
    TResult? Function(BackupTriggered value)? backupTriggered,
  }) {
    return backupTriggered?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RestoreTriggered value)? restoreTriggered,
    TResult Function(BackupTriggered value)? backupTriggered,
    required TResult orElse(),
  }) {
    if (backupTriggered != null) {
      return backupTriggered(this);
    }
    return orElse();
  }
}

abstract class BackupTriggered implements BackupEvent {
  const factory BackupTriggered({required final String path}) =
      _$BackupTriggeredImpl;

  @override
  String get path;

  /// Create a copy of BackupEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BackupTriggeredImplCopyWith<_$BackupTriggeredImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
