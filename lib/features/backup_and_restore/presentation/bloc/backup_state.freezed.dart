// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'backup_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BackupState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BackupState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BackupState()';
}


}

/// @nodoc
class $BackupStateCopyWith<$Res>  {
$BackupStateCopyWith(BackupState _, $Res Function(BackupState) __);
}


/// Adds pattern-matching-related methods to [BackupState].
extension BackupStatePatterns on BackupState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Initial value)?  initial,TResult Function( RestoreInProgress value)?  restoreInProgress,TResult Function( RestoreDone value)?  restoreDone,TResult Function( RestoreFailed value)?  restoreFailed,TResult Function( BackupInProgress value)?  backupInProgress,TResult Function( BackupFinished value)?  backupFinished,TResult Function( BackupFailed value)?  backupFailed,required TResult orElse(),}){
final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that);case RestoreInProgress() when restoreInProgress != null:
return restoreInProgress(_that);case RestoreDone() when restoreDone != null:
return restoreDone(_that);case RestoreFailed() when restoreFailed != null:
return restoreFailed(_that);case BackupInProgress() when backupInProgress != null:
return backupInProgress(_that);case BackupFinished() when backupFinished != null:
return backupFinished(_that);case BackupFailed() when backupFailed != null:
return backupFailed(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Initial value)  initial,required TResult Function( RestoreInProgress value)  restoreInProgress,required TResult Function( RestoreDone value)  restoreDone,required TResult Function( RestoreFailed value)  restoreFailed,required TResult Function( BackupInProgress value)  backupInProgress,required TResult Function( BackupFinished value)  backupFinished,required TResult Function( BackupFailed value)  backupFailed,}){
final _that = this;
switch (_that) {
case Initial():
return initial(_that);case RestoreInProgress():
return restoreInProgress(_that);case RestoreDone():
return restoreDone(_that);case RestoreFailed():
return restoreFailed(_that);case BackupInProgress():
return backupInProgress(_that);case BackupFinished():
return backupFinished(_that);case BackupFailed():
return backupFailed(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Initial value)?  initial,TResult? Function( RestoreInProgress value)?  restoreInProgress,TResult? Function( RestoreDone value)?  restoreDone,TResult? Function( RestoreFailed value)?  restoreFailed,TResult? Function( BackupInProgress value)?  backupInProgress,TResult? Function( BackupFinished value)?  backupFinished,TResult? Function( BackupFailed value)?  backupFailed,}){
final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that);case RestoreInProgress() when restoreInProgress != null:
return restoreInProgress(_that);case RestoreDone() when restoreDone != null:
return restoreDone(_that);case RestoreFailed() when restoreFailed != null:
return restoreFailed(_that);case BackupInProgress() when backupInProgress != null:
return backupInProgress(_that);case BackupFinished() when backupFinished != null:
return backupFinished(_that);case BackupFailed() when backupFailed != null:
return backupFailed(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  restoreInProgress,TResult Function()?  restoreDone,TResult Function()?  restoreFailed,TResult Function()?  backupInProgress,TResult Function()?  backupFinished,TResult Function()?  backupFailed,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial();case RestoreInProgress() when restoreInProgress != null:
return restoreInProgress();case RestoreDone() when restoreDone != null:
return restoreDone();case RestoreFailed() when restoreFailed != null:
return restoreFailed();case BackupInProgress() when backupInProgress != null:
return backupInProgress();case BackupFinished() when backupFinished != null:
return backupFinished();case BackupFailed() when backupFailed != null:
return backupFailed();case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  restoreInProgress,required TResult Function()  restoreDone,required TResult Function()  restoreFailed,required TResult Function()  backupInProgress,required TResult Function()  backupFinished,required TResult Function()  backupFailed,}) {final _that = this;
switch (_that) {
case Initial():
return initial();case RestoreInProgress():
return restoreInProgress();case RestoreDone():
return restoreDone();case RestoreFailed():
return restoreFailed();case BackupInProgress():
return backupInProgress();case BackupFinished():
return backupFinished();case BackupFailed():
return backupFailed();}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  restoreInProgress,TResult? Function()?  restoreDone,TResult? Function()?  restoreFailed,TResult? Function()?  backupInProgress,TResult? Function()?  backupFinished,TResult? Function()?  backupFailed,}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial();case RestoreInProgress() when restoreInProgress != null:
return restoreInProgress();case RestoreDone() when restoreDone != null:
return restoreDone();case RestoreFailed() when restoreFailed != null:
return restoreFailed();case BackupInProgress() when backupInProgress != null:
return backupInProgress();case BackupFinished() when backupFinished != null:
return backupFinished();case BackupFailed() when backupFailed != null:
return backupFailed();case _:
  return null;

}
}

}

/// @nodoc


class Initial implements BackupState {
  const Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BackupState.initial()';
}


}




/// @nodoc


class RestoreInProgress implements BackupState {
  const RestoreInProgress();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RestoreInProgress);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BackupState.restoreInProgress()';
}


}




/// @nodoc


class RestoreDone implements BackupState {
  const RestoreDone();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RestoreDone);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BackupState.restoreDone()';
}


}




/// @nodoc


class RestoreFailed implements BackupState {
  const RestoreFailed();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RestoreFailed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BackupState.restoreFailed()';
}


}




/// @nodoc


class BackupInProgress implements BackupState {
  const BackupInProgress();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BackupInProgress);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BackupState.backupInProgress()';
}


}




/// @nodoc


class BackupFinished implements BackupState {
  const BackupFinished();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BackupFinished);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BackupState.backupFinished()';
}


}




/// @nodoc


class BackupFailed implements BackupState {
  const BackupFailed();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BackupFailed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BackupState.backupFailed()';
}


}




// dart format on
