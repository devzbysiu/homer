// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'import_export_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ImportExportState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ImportExportState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ImportExportState()';
}


}

/// @nodoc
class $ImportExportStateCopyWith<$Res>  {
$ImportExportStateCopyWith(ImportExportState _, $Res Function(ImportExportState) __);
}


/// Adds pattern-matching-related methods to [ImportExportState].
extension ImportExportStatePatterns on ImportExportState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Initial value)?  initial,TResult Function( ImportInProgress value)?  importInProgress,TResult Function( ImportDone value)?  importDone,TResult Function( ImportFailed value)?  importFailed,TResult Function( ExportInProgress value)?  exportInProgress,TResult Function( ExportFinished value)?  exportFinished,TResult Function( ExportFailed value)?  exportFailed,required TResult orElse(),}){
final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that);case ImportInProgress() when importInProgress != null:
return importInProgress(_that);case ImportDone() when importDone != null:
return importDone(_that);case ImportFailed() when importFailed != null:
return importFailed(_that);case ExportInProgress() when exportInProgress != null:
return exportInProgress(_that);case ExportFinished() when exportFinished != null:
return exportFinished(_that);case ExportFailed() when exportFailed != null:
return exportFailed(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Initial value)  initial,required TResult Function( ImportInProgress value)  importInProgress,required TResult Function( ImportDone value)  importDone,required TResult Function( ImportFailed value)  importFailed,required TResult Function( ExportInProgress value)  exportInProgress,required TResult Function( ExportFinished value)  exportFinished,required TResult Function( ExportFailed value)  exportFailed,}){
final _that = this;
switch (_that) {
case Initial():
return initial(_that);case ImportInProgress():
return importInProgress(_that);case ImportDone():
return importDone(_that);case ImportFailed():
return importFailed(_that);case ExportInProgress():
return exportInProgress(_that);case ExportFinished():
return exportFinished(_that);case ExportFailed():
return exportFailed(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Initial value)?  initial,TResult? Function( ImportInProgress value)?  importInProgress,TResult? Function( ImportDone value)?  importDone,TResult? Function( ImportFailed value)?  importFailed,TResult? Function( ExportInProgress value)?  exportInProgress,TResult? Function( ExportFinished value)?  exportFinished,TResult? Function( ExportFailed value)?  exportFailed,}){
final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that);case ImportInProgress() when importInProgress != null:
return importInProgress(_that);case ImportDone() when importDone != null:
return importDone(_that);case ImportFailed() when importFailed != null:
return importFailed(_that);case ExportInProgress() when exportInProgress != null:
return exportInProgress(_that);case ExportFinished() when exportFinished != null:
return exportFinished(_that);case ExportFailed() when exportFailed != null:
return exportFailed(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  importInProgress,TResult Function()?  importDone,TResult Function()?  importFailed,TResult Function()?  exportInProgress,TResult Function()?  exportFinished,TResult Function()?  exportFailed,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial();case ImportInProgress() when importInProgress != null:
return importInProgress();case ImportDone() when importDone != null:
return importDone();case ImportFailed() when importFailed != null:
return importFailed();case ExportInProgress() when exportInProgress != null:
return exportInProgress();case ExportFinished() when exportFinished != null:
return exportFinished();case ExportFailed() when exportFailed != null:
return exportFailed();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  importInProgress,required TResult Function()  importDone,required TResult Function()  importFailed,required TResult Function()  exportInProgress,required TResult Function()  exportFinished,required TResult Function()  exportFailed,}) {final _that = this;
switch (_that) {
case Initial():
return initial();case ImportInProgress():
return importInProgress();case ImportDone():
return importDone();case ImportFailed():
return importFailed();case ExportInProgress():
return exportInProgress();case ExportFinished():
return exportFinished();case ExportFailed():
return exportFailed();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  importInProgress,TResult? Function()?  importDone,TResult? Function()?  importFailed,TResult? Function()?  exportInProgress,TResult? Function()?  exportFinished,TResult? Function()?  exportFailed,}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial();case ImportInProgress() when importInProgress != null:
return importInProgress();case ImportDone() when importDone != null:
return importDone();case ImportFailed() when importFailed != null:
return importFailed();case ExportInProgress() when exportInProgress != null:
return exportInProgress();case ExportFinished() when exportFinished != null:
return exportFinished();case ExportFailed() when exportFailed != null:
return exportFailed();case _:
  return null;

}
}

}

/// @nodoc


class Initial implements ImportExportState {
  const Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ImportExportState.initial()';
}


}




/// @nodoc


class ImportInProgress implements ImportExportState {
  const ImportInProgress();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ImportInProgress);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ImportExportState.importInProgress()';
}


}




/// @nodoc


class ImportDone implements ImportExportState {
  const ImportDone();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ImportDone);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ImportExportState.importDone()';
}


}




/// @nodoc


class ImportFailed implements ImportExportState {
  const ImportFailed();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ImportFailed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ImportExportState.importFailed()';
}


}




/// @nodoc


class ExportInProgress implements ImportExportState {
  const ExportInProgress();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExportInProgress);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ImportExportState.exportInProgress()';
}


}




/// @nodoc


class ExportFinished implements ImportExportState {
  const ExportFinished();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExportFinished);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ImportExportState.exportFinished()';
}


}




/// @nodoc


class ExportFailed implements ImportExportState {
  const ExportFailed();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExportFailed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ImportExportState.exportFailed()';
}


}




// dart format on
