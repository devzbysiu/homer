// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'backup_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BackupState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() restoreInProgress,
    required TResult Function() restoreDone,
    required TResult Function() restoreFailed,
    required TResult Function() backupInProgress,
    required TResult Function() backupFinished,
    required TResult Function() backupFailed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? restoreInProgress,
    TResult? Function()? restoreDone,
    TResult? Function()? restoreFailed,
    TResult? Function()? backupInProgress,
    TResult? Function()? backupFinished,
    TResult? Function()? backupFailed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? restoreInProgress,
    TResult Function()? restoreDone,
    TResult Function()? restoreFailed,
    TResult Function()? backupInProgress,
    TResult Function()? backupFinished,
    TResult Function()? backupFailed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(RestoreInProgress value) restoreInProgress,
    required TResult Function(RestoreDone value) restoreDone,
    required TResult Function(RestoreFailed value) restoreFailed,
    required TResult Function(BackupInProgress value) backupInProgress,
    required TResult Function(BackupFinished value) backupFinished,
    required TResult Function(BackupFailed value) backupFailed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(RestoreInProgress value)? restoreInProgress,
    TResult? Function(RestoreDone value)? restoreDone,
    TResult? Function(RestoreFailed value)? restoreFailed,
    TResult? Function(BackupInProgress value)? backupInProgress,
    TResult? Function(BackupFinished value)? backupFinished,
    TResult? Function(BackupFailed value)? backupFailed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(RestoreInProgress value)? restoreInProgress,
    TResult Function(RestoreDone value)? restoreDone,
    TResult Function(RestoreFailed value)? restoreFailed,
    TResult Function(BackupInProgress value)? backupInProgress,
    TResult Function(BackupFinished value)? backupFinished,
    TResult Function(BackupFailed value)? backupFailed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BackupStateCopyWith<$Res> {
  factory $BackupStateCopyWith(
          BackupState value, $Res Function(BackupState) then) =
      _$BackupStateCopyWithImpl<$Res, BackupState>;
}

/// @nodoc
class _$BackupStateCopyWithImpl<$Res, $Val extends BackupState>
    implements $BackupStateCopyWith<$Res> {
  _$BackupStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BackupState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$BackupStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of BackupState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'BackupState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() restoreInProgress,
    required TResult Function() restoreDone,
    required TResult Function() restoreFailed,
    required TResult Function() backupInProgress,
    required TResult Function() backupFinished,
    required TResult Function() backupFailed,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? restoreInProgress,
    TResult? Function()? restoreDone,
    TResult? Function()? restoreFailed,
    TResult? Function()? backupInProgress,
    TResult? Function()? backupFinished,
    TResult? Function()? backupFailed,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? restoreInProgress,
    TResult Function()? restoreDone,
    TResult Function()? restoreFailed,
    TResult Function()? backupInProgress,
    TResult Function()? backupFinished,
    TResult Function()? backupFailed,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(RestoreInProgress value) restoreInProgress,
    required TResult Function(RestoreDone value) restoreDone,
    required TResult Function(RestoreFailed value) restoreFailed,
    required TResult Function(BackupInProgress value) backupInProgress,
    required TResult Function(BackupFinished value) backupFinished,
    required TResult Function(BackupFailed value) backupFailed,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(RestoreInProgress value)? restoreInProgress,
    TResult? Function(RestoreDone value)? restoreDone,
    TResult? Function(RestoreFailed value)? restoreFailed,
    TResult? Function(BackupInProgress value)? backupInProgress,
    TResult? Function(BackupFinished value)? backupFinished,
    TResult? Function(BackupFailed value)? backupFailed,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(RestoreInProgress value)? restoreInProgress,
    TResult Function(RestoreDone value)? restoreDone,
    TResult Function(RestoreFailed value)? restoreFailed,
    TResult Function(BackupInProgress value)? backupInProgress,
    TResult Function(BackupFinished value)? backupFinished,
    TResult Function(BackupFailed value)? backupFailed,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class Initial implements BackupState {
  const factory Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$RestoreInProgressImplCopyWith<$Res> {
  factory _$$RestoreInProgressImplCopyWith(_$RestoreInProgressImpl value,
          $Res Function(_$RestoreInProgressImpl) then) =
      __$$RestoreInProgressImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RestoreInProgressImplCopyWithImpl<$Res>
    extends _$BackupStateCopyWithImpl<$Res, _$RestoreInProgressImpl>
    implements _$$RestoreInProgressImplCopyWith<$Res> {
  __$$RestoreInProgressImplCopyWithImpl(_$RestoreInProgressImpl _value,
      $Res Function(_$RestoreInProgressImpl) _then)
      : super(_value, _then);

  /// Create a copy of BackupState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$RestoreInProgressImpl implements RestoreInProgress {
  const _$RestoreInProgressImpl();

  @override
  String toString() {
    return 'BackupState.restoreInProgress()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RestoreInProgressImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() restoreInProgress,
    required TResult Function() restoreDone,
    required TResult Function() restoreFailed,
    required TResult Function() backupInProgress,
    required TResult Function() backupFinished,
    required TResult Function() backupFailed,
  }) {
    return restoreInProgress();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? restoreInProgress,
    TResult? Function()? restoreDone,
    TResult? Function()? restoreFailed,
    TResult? Function()? backupInProgress,
    TResult? Function()? backupFinished,
    TResult? Function()? backupFailed,
  }) {
    return restoreInProgress?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? restoreInProgress,
    TResult Function()? restoreDone,
    TResult Function()? restoreFailed,
    TResult Function()? backupInProgress,
    TResult Function()? backupFinished,
    TResult Function()? backupFailed,
    required TResult orElse(),
  }) {
    if (restoreInProgress != null) {
      return restoreInProgress();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(RestoreInProgress value) restoreInProgress,
    required TResult Function(RestoreDone value) restoreDone,
    required TResult Function(RestoreFailed value) restoreFailed,
    required TResult Function(BackupInProgress value) backupInProgress,
    required TResult Function(BackupFinished value) backupFinished,
    required TResult Function(BackupFailed value) backupFailed,
  }) {
    return restoreInProgress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(RestoreInProgress value)? restoreInProgress,
    TResult? Function(RestoreDone value)? restoreDone,
    TResult? Function(RestoreFailed value)? restoreFailed,
    TResult? Function(BackupInProgress value)? backupInProgress,
    TResult? Function(BackupFinished value)? backupFinished,
    TResult? Function(BackupFailed value)? backupFailed,
  }) {
    return restoreInProgress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(RestoreInProgress value)? restoreInProgress,
    TResult Function(RestoreDone value)? restoreDone,
    TResult Function(RestoreFailed value)? restoreFailed,
    TResult Function(BackupInProgress value)? backupInProgress,
    TResult Function(BackupFinished value)? backupFinished,
    TResult Function(BackupFailed value)? backupFailed,
    required TResult orElse(),
  }) {
    if (restoreInProgress != null) {
      return restoreInProgress(this);
    }
    return orElse();
  }
}

abstract class RestoreInProgress implements BackupState {
  const factory RestoreInProgress() = _$RestoreInProgressImpl;
}

/// @nodoc
abstract class _$$RestoreDoneImplCopyWith<$Res> {
  factory _$$RestoreDoneImplCopyWith(
          _$RestoreDoneImpl value, $Res Function(_$RestoreDoneImpl) then) =
      __$$RestoreDoneImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RestoreDoneImplCopyWithImpl<$Res>
    extends _$BackupStateCopyWithImpl<$Res, _$RestoreDoneImpl>
    implements _$$RestoreDoneImplCopyWith<$Res> {
  __$$RestoreDoneImplCopyWithImpl(
      _$RestoreDoneImpl _value, $Res Function(_$RestoreDoneImpl) _then)
      : super(_value, _then);

  /// Create a copy of BackupState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$RestoreDoneImpl implements RestoreDone {
  const _$RestoreDoneImpl();

  @override
  String toString() {
    return 'BackupState.restoreDone()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RestoreDoneImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() restoreInProgress,
    required TResult Function() restoreDone,
    required TResult Function() restoreFailed,
    required TResult Function() backupInProgress,
    required TResult Function() backupFinished,
    required TResult Function() backupFailed,
  }) {
    return restoreDone();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? restoreInProgress,
    TResult? Function()? restoreDone,
    TResult? Function()? restoreFailed,
    TResult? Function()? backupInProgress,
    TResult? Function()? backupFinished,
    TResult? Function()? backupFailed,
  }) {
    return restoreDone?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? restoreInProgress,
    TResult Function()? restoreDone,
    TResult Function()? restoreFailed,
    TResult Function()? backupInProgress,
    TResult Function()? backupFinished,
    TResult Function()? backupFailed,
    required TResult orElse(),
  }) {
    if (restoreDone != null) {
      return restoreDone();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(RestoreInProgress value) restoreInProgress,
    required TResult Function(RestoreDone value) restoreDone,
    required TResult Function(RestoreFailed value) restoreFailed,
    required TResult Function(BackupInProgress value) backupInProgress,
    required TResult Function(BackupFinished value) backupFinished,
    required TResult Function(BackupFailed value) backupFailed,
  }) {
    return restoreDone(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(RestoreInProgress value)? restoreInProgress,
    TResult? Function(RestoreDone value)? restoreDone,
    TResult? Function(RestoreFailed value)? restoreFailed,
    TResult? Function(BackupInProgress value)? backupInProgress,
    TResult? Function(BackupFinished value)? backupFinished,
    TResult? Function(BackupFailed value)? backupFailed,
  }) {
    return restoreDone?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(RestoreInProgress value)? restoreInProgress,
    TResult Function(RestoreDone value)? restoreDone,
    TResult Function(RestoreFailed value)? restoreFailed,
    TResult Function(BackupInProgress value)? backupInProgress,
    TResult Function(BackupFinished value)? backupFinished,
    TResult Function(BackupFailed value)? backupFailed,
    required TResult orElse(),
  }) {
    if (restoreDone != null) {
      return restoreDone(this);
    }
    return orElse();
  }
}

abstract class RestoreDone implements BackupState {
  const factory RestoreDone() = _$RestoreDoneImpl;
}

/// @nodoc
abstract class _$$RestoreFailedImplCopyWith<$Res> {
  factory _$$RestoreFailedImplCopyWith(
          _$RestoreFailedImpl value, $Res Function(_$RestoreFailedImpl) then) =
      __$$RestoreFailedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RestoreFailedImplCopyWithImpl<$Res>
    extends _$BackupStateCopyWithImpl<$Res, _$RestoreFailedImpl>
    implements _$$RestoreFailedImplCopyWith<$Res> {
  __$$RestoreFailedImplCopyWithImpl(
      _$RestoreFailedImpl _value, $Res Function(_$RestoreFailedImpl) _then)
      : super(_value, _then);

  /// Create a copy of BackupState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$RestoreFailedImpl implements RestoreFailed {
  const _$RestoreFailedImpl();

  @override
  String toString() {
    return 'BackupState.restoreFailed()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RestoreFailedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() restoreInProgress,
    required TResult Function() restoreDone,
    required TResult Function() restoreFailed,
    required TResult Function() backupInProgress,
    required TResult Function() backupFinished,
    required TResult Function() backupFailed,
  }) {
    return restoreFailed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? restoreInProgress,
    TResult? Function()? restoreDone,
    TResult? Function()? restoreFailed,
    TResult? Function()? backupInProgress,
    TResult? Function()? backupFinished,
    TResult? Function()? backupFailed,
  }) {
    return restoreFailed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? restoreInProgress,
    TResult Function()? restoreDone,
    TResult Function()? restoreFailed,
    TResult Function()? backupInProgress,
    TResult Function()? backupFinished,
    TResult Function()? backupFailed,
    required TResult orElse(),
  }) {
    if (restoreFailed != null) {
      return restoreFailed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(RestoreInProgress value) restoreInProgress,
    required TResult Function(RestoreDone value) restoreDone,
    required TResult Function(RestoreFailed value) restoreFailed,
    required TResult Function(BackupInProgress value) backupInProgress,
    required TResult Function(BackupFinished value) backupFinished,
    required TResult Function(BackupFailed value) backupFailed,
  }) {
    return restoreFailed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(RestoreInProgress value)? restoreInProgress,
    TResult? Function(RestoreDone value)? restoreDone,
    TResult? Function(RestoreFailed value)? restoreFailed,
    TResult? Function(BackupInProgress value)? backupInProgress,
    TResult? Function(BackupFinished value)? backupFinished,
    TResult? Function(BackupFailed value)? backupFailed,
  }) {
    return restoreFailed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(RestoreInProgress value)? restoreInProgress,
    TResult Function(RestoreDone value)? restoreDone,
    TResult Function(RestoreFailed value)? restoreFailed,
    TResult Function(BackupInProgress value)? backupInProgress,
    TResult Function(BackupFinished value)? backupFinished,
    TResult Function(BackupFailed value)? backupFailed,
    required TResult orElse(),
  }) {
    if (restoreFailed != null) {
      return restoreFailed(this);
    }
    return orElse();
  }
}

abstract class RestoreFailed implements BackupState {
  const factory RestoreFailed() = _$RestoreFailedImpl;
}

/// @nodoc
abstract class _$$BackupInProgressImplCopyWith<$Res> {
  factory _$$BackupInProgressImplCopyWith(_$BackupInProgressImpl value,
          $Res Function(_$BackupInProgressImpl) then) =
      __$$BackupInProgressImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$BackupInProgressImplCopyWithImpl<$Res>
    extends _$BackupStateCopyWithImpl<$Res, _$BackupInProgressImpl>
    implements _$$BackupInProgressImplCopyWith<$Res> {
  __$$BackupInProgressImplCopyWithImpl(_$BackupInProgressImpl _value,
      $Res Function(_$BackupInProgressImpl) _then)
      : super(_value, _then);

  /// Create a copy of BackupState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$BackupInProgressImpl implements BackupInProgress {
  const _$BackupInProgressImpl();

  @override
  String toString() {
    return 'BackupState.backupInProgress()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$BackupInProgressImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() restoreInProgress,
    required TResult Function() restoreDone,
    required TResult Function() restoreFailed,
    required TResult Function() backupInProgress,
    required TResult Function() backupFinished,
    required TResult Function() backupFailed,
  }) {
    return backupInProgress();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? restoreInProgress,
    TResult? Function()? restoreDone,
    TResult? Function()? restoreFailed,
    TResult? Function()? backupInProgress,
    TResult? Function()? backupFinished,
    TResult? Function()? backupFailed,
  }) {
    return backupInProgress?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? restoreInProgress,
    TResult Function()? restoreDone,
    TResult Function()? restoreFailed,
    TResult Function()? backupInProgress,
    TResult Function()? backupFinished,
    TResult Function()? backupFailed,
    required TResult orElse(),
  }) {
    if (backupInProgress != null) {
      return backupInProgress();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(RestoreInProgress value) restoreInProgress,
    required TResult Function(RestoreDone value) restoreDone,
    required TResult Function(RestoreFailed value) restoreFailed,
    required TResult Function(BackupInProgress value) backupInProgress,
    required TResult Function(BackupFinished value) backupFinished,
    required TResult Function(BackupFailed value) backupFailed,
  }) {
    return backupInProgress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(RestoreInProgress value)? restoreInProgress,
    TResult? Function(RestoreDone value)? restoreDone,
    TResult? Function(RestoreFailed value)? restoreFailed,
    TResult? Function(BackupInProgress value)? backupInProgress,
    TResult? Function(BackupFinished value)? backupFinished,
    TResult? Function(BackupFailed value)? backupFailed,
  }) {
    return backupInProgress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(RestoreInProgress value)? restoreInProgress,
    TResult Function(RestoreDone value)? restoreDone,
    TResult Function(RestoreFailed value)? restoreFailed,
    TResult Function(BackupInProgress value)? backupInProgress,
    TResult Function(BackupFinished value)? backupFinished,
    TResult Function(BackupFailed value)? backupFailed,
    required TResult orElse(),
  }) {
    if (backupInProgress != null) {
      return backupInProgress(this);
    }
    return orElse();
  }
}

abstract class BackupInProgress implements BackupState {
  const factory BackupInProgress() = _$BackupInProgressImpl;
}

/// @nodoc
abstract class _$$BackupFinishedImplCopyWith<$Res> {
  factory _$$BackupFinishedImplCopyWith(_$BackupFinishedImpl value,
          $Res Function(_$BackupFinishedImpl) then) =
      __$$BackupFinishedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$BackupFinishedImplCopyWithImpl<$Res>
    extends _$BackupStateCopyWithImpl<$Res, _$BackupFinishedImpl>
    implements _$$BackupFinishedImplCopyWith<$Res> {
  __$$BackupFinishedImplCopyWithImpl(
      _$BackupFinishedImpl _value, $Res Function(_$BackupFinishedImpl) _then)
      : super(_value, _then);

  /// Create a copy of BackupState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$BackupFinishedImpl implements BackupFinished {
  const _$BackupFinishedImpl();

  @override
  String toString() {
    return 'BackupState.backupFinished()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$BackupFinishedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() restoreInProgress,
    required TResult Function() restoreDone,
    required TResult Function() restoreFailed,
    required TResult Function() backupInProgress,
    required TResult Function() backupFinished,
    required TResult Function() backupFailed,
  }) {
    return backupFinished();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? restoreInProgress,
    TResult? Function()? restoreDone,
    TResult? Function()? restoreFailed,
    TResult? Function()? backupInProgress,
    TResult? Function()? backupFinished,
    TResult? Function()? backupFailed,
  }) {
    return backupFinished?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? restoreInProgress,
    TResult Function()? restoreDone,
    TResult Function()? restoreFailed,
    TResult Function()? backupInProgress,
    TResult Function()? backupFinished,
    TResult Function()? backupFailed,
    required TResult orElse(),
  }) {
    if (backupFinished != null) {
      return backupFinished();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(RestoreInProgress value) restoreInProgress,
    required TResult Function(RestoreDone value) restoreDone,
    required TResult Function(RestoreFailed value) restoreFailed,
    required TResult Function(BackupInProgress value) backupInProgress,
    required TResult Function(BackupFinished value) backupFinished,
    required TResult Function(BackupFailed value) backupFailed,
  }) {
    return backupFinished(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(RestoreInProgress value)? restoreInProgress,
    TResult? Function(RestoreDone value)? restoreDone,
    TResult? Function(RestoreFailed value)? restoreFailed,
    TResult? Function(BackupInProgress value)? backupInProgress,
    TResult? Function(BackupFinished value)? backupFinished,
    TResult? Function(BackupFailed value)? backupFailed,
  }) {
    return backupFinished?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(RestoreInProgress value)? restoreInProgress,
    TResult Function(RestoreDone value)? restoreDone,
    TResult Function(RestoreFailed value)? restoreFailed,
    TResult Function(BackupInProgress value)? backupInProgress,
    TResult Function(BackupFinished value)? backupFinished,
    TResult Function(BackupFailed value)? backupFailed,
    required TResult orElse(),
  }) {
    if (backupFinished != null) {
      return backupFinished(this);
    }
    return orElse();
  }
}

abstract class BackupFinished implements BackupState {
  const factory BackupFinished() = _$BackupFinishedImpl;
}

/// @nodoc
abstract class _$$BackupFailedImplCopyWith<$Res> {
  factory _$$BackupFailedImplCopyWith(
          _$BackupFailedImpl value, $Res Function(_$BackupFailedImpl) then) =
      __$$BackupFailedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$BackupFailedImplCopyWithImpl<$Res>
    extends _$BackupStateCopyWithImpl<$Res, _$BackupFailedImpl>
    implements _$$BackupFailedImplCopyWith<$Res> {
  __$$BackupFailedImplCopyWithImpl(
      _$BackupFailedImpl _value, $Res Function(_$BackupFailedImpl) _then)
      : super(_value, _then);

  /// Create a copy of BackupState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$BackupFailedImpl implements BackupFailed {
  const _$BackupFailedImpl();

  @override
  String toString() {
    return 'BackupState.backupFailed()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$BackupFailedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() restoreInProgress,
    required TResult Function() restoreDone,
    required TResult Function() restoreFailed,
    required TResult Function() backupInProgress,
    required TResult Function() backupFinished,
    required TResult Function() backupFailed,
  }) {
    return backupFailed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? restoreInProgress,
    TResult? Function()? restoreDone,
    TResult? Function()? restoreFailed,
    TResult? Function()? backupInProgress,
    TResult? Function()? backupFinished,
    TResult? Function()? backupFailed,
  }) {
    return backupFailed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? restoreInProgress,
    TResult Function()? restoreDone,
    TResult Function()? restoreFailed,
    TResult Function()? backupInProgress,
    TResult Function()? backupFinished,
    TResult Function()? backupFailed,
    required TResult orElse(),
  }) {
    if (backupFailed != null) {
      return backupFailed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(RestoreInProgress value) restoreInProgress,
    required TResult Function(RestoreDone value) restoreDone,
    required TResult Function(RestoreFailed value) restoreFailed,
    required TResult Function(BackupInProgress value) backupInProgress,
    required TResult Function(BackupFinished value) backupFinished,
    required TResult Function(BackupFailed value) backupFailed,
  }) {
    return backupFailed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(RestoreInProgress value)? restoreInProgress,
    TResult? Function(RestoreDone value)? restoreDone,
    TResult? Function(RestoreFailed value)? restoreFailed,
    TResult? Function(BackupInProgress value)? backupInProgress,
    TResult? Function(BackupFinished value)? backupFinished,
    TResult? Function(BackupFailed value)? backupFailed,
  }) {
    return backupFailed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(RestoreInProgress value)? restoreInProgress,
    TResult Function(RestoreDone value)? restoreDone,
    TResult Function(RestoreFailed value)? restoreFailed,
    TResult Function(BackupInProgress value)? backupInProgress,
    TResult Function(BackupFinished value)? backupFinished,
    TResult Function(BackupFailed value)? backupFailed,
    required TResult orElse(),
  }) {
    if (backupFailed != null) {
      return backupFailed(this);
    }
    return orElse();
  }
}

abstract class BackupFailed implements BackupState {
  const factory BackupFailed() = _$BackupFailedImpl;
}
