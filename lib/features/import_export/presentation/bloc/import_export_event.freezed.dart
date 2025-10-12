// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'import_export_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ImportExportEvent {

 String get path;
/// Create a copy of ImportExportEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ImportExportEventCopyWith<ImportExportEvent> get copyWith => _$ImportExportEventCopyWithImpl<ImportExportEvent>(this as ImportExportEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ImportExportEvent&&(identical(other.path, path) || other.path == path));
}


@override
int get hashCode => Object.hash(runtimeType,path);

@override
String toString() {
  return 'ImportExportEvent(path: $path)';
}


}

/// @nodoc
abstract mixin class $ImportExportEventCopyWith<$Res>  {
  factory $ImportExportEventCopyWith(ImportExportEvent value, $Res Function(ImportExportEvent) _then) = _$ImportExportEventCopyWithImpl;
@useResult
$Res call({
 String path
});




}
/// @nodoc
class _$ImportExportEventCopyWithImpl<$Res>
    implements $ImportExportEventCopyWith<$Res> {
  _$ImportExportEventCopyWithImpl(this._self, this._then);

  final ImportExportEvent _self;
  final $Res Function(ImportExportEvent) _then;

/// Create a copy of ImportExportEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? path = null,}) {
  return _then(_self.copyWith(
path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ImportExportEvent].
extension ImportExportEventPatterns on ImportExportEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ImportTriggered value)?  importTriggered,TResult Function( ExportTriggered value)?  exportTriggered,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ImportTriggered() when importTriggered != null:
return importTriggered(_that);case ExportTriggered() when exportTriggered != null:
return exportTriggered(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ImportTriggered value)  importTriggered,required TResult Function( ExportTriggered value)  exportTriggered,}){
final _that = this;
switch (_that) {
case ImportTriggered():
return importTriggered(_that);case ExportTriggered():
return exportTriggered(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ImportTriggered value)?  importTriggered,TResult? Function( ExportTriggered value)?  exportTriggered,}){
final _that = this;
switch (_that) {
case ImportTriggered() when importTriggered != null:
return importTriggered(_that);case ExportTriggered() when exportTriggered != null:
return exportTriggered(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String path)?  importTriggered,TResult Function( String path)?  exportTriggered,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ImportTriggered() when importTriggered != null:
return importTriggered(_that.path);case ExportTriggered() when exportTriggered != null:
return exportTriggered(_that.path);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String path)  importTriggered,required TResult Function( String path)  exportTriggered,}) {final _that = this;
switch (_that) {
case ImportTriggered():
return importTriggered(_that.path);case ExportTriggered():
return exportTriggered(_that.path);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String path)?  importTriggered,TResult? Function( String path)?  exportTriggered,}) {final _that = this;
switch (_that) {
case ImportTriggered() when importTriggered != null:
return importTriggered(_that.path);case ExportTriggered() when exportTriggered != null:
return exportTriggered(_that.path);case _:
  return null;

}
}

}

/// @nodoc


class ImportTriggered implements ImportExportEvent {
  const ImportTriggered({required this.path});
  

@override final  String path;

/// Create a copy of ImportExportEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ImportTriggeredCopyWith<ImportTriggered> get copyWith => _$ImportTriggeredCopyWithImpl<ImportTriggered>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ImportTriggered&&(identical(other.path, path) || other.path == path));
}


@override
int get hashCode => Object.hash(runtimeType,path);

@override
String toString() {
  return 'ImportExportEvent.importTriggered(path: $path)';
}


}

/// @nodoc
abstract mixin class $ImportTriggeredCopyWith<$Res> implements $ImportExportEventCopyWith<$Res> {
  factory $ImportTriggeredCopyWith(ImportTriggered value, $Res Function(ImportTriggered) _then) = _$ImportTriggeredCopyWithImpl;
@override @useResult
$Res call({
 String path
});




}
/// @nodoc
class _$ImportTriggeredCopyWithImpl<$Res>
    implements $ImportTriggeredCopyWith<$Res> {
  _$ImportTriggeredCopyWithImpl(this._self, this._then);

  final ImportTriggered _self;
  final $Res Function(ImportTriggered) _then;

/// Create a copy of ImportExportEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? path = null,}) {
  return _then(ImportTriggered(
path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ExportTriggered implements ImportExportEvent {
  const ExportTriggered({required this.path});
  

@override final  String path;

/// Create a copy of ImportExportEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExportTriggeredCopyWith<ExportTriggered> get copyWith => _$ExportTriggeredCopyWithImpl<ExportTriggered>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExportTriggered&&(identical(other.path, path) || other.path == path));
}


@override
int get hashCode => Object.hash(runtimeType,path);

@override
String toString() {
  return 'ImportExportEvent.exportTriggered(path: $path)';
}


}

/// @nodoc
abstract mixin class $ExportTriggeredCopyWith<$Res> implements $ImportExportEventCopyWith<$Res> {
  factory $ExportTriggeredCopyWith(ExportTriggered value, $Res Function(ExportTriggered) _then) = _$ExportTriggeredCopyWithImpl;
@override @useResult
$Res call({
 String path
});




}
/// @nodoc
class _$ExportTriggeredCopyWithImpl<$Res>
    implements $ExportTriggeredCopyWith<$Res> {
  _$ExportTriggeredCopyWithImpl(this._self, this._then);

  final ExportTriggered _self;
  final $Res Function(ExportTriggered) _then;

/// Create a copy of ImportExportEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? path = null,}) {
  return _then(ExportTriggered(
path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
