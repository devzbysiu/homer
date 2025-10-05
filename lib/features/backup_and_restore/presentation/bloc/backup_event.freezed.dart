// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'backup_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BackupEvent {

 String get path;
/// Create a copy of BackupEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BackupEventCopyWith<BackupEvent> get copyWith => _$BackupEventCopyWithImpl<BackupEvent>(this as BackupEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BackupEvent&&(identical(other.path, path) || other.path == path));
}


@override
int get hashCode => Object.hash(runtimeType,path);

@override
String toString() {
  return 'BackupEvent(path: $path)';
}


}

/// @nodoc
abstract mixin class $BackupEventCopyWith<$Res>  {
  factory $BackupEventCopyWith(BackupEvent value, $Res Function(BackupEvent) _then) = _$BackupEventCopyWithImpl;
@useResult
$Res call({
 String path
});




}
/// @nodoc
class _$BackupEventCopyWithImpl<$Res>
    implements $BackupEventCopyWith<$Res> {
  _$BackupEventCopyWithImpl(this._self, this._then);

  final BackupEvent _self;
  final $Res Function(BackupEvent) _then;

/// Create a copy of BackupEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? path = null,}) {
  return _then(_self.copyWith(
path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [BackupEvent].
extension BackupEventPatterns on BackupEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( RestoreTriggered value)?  restoreTriggered,TResult Function( BackupTriggered value)?  backupTriggered,required TResult orElse(),}){
final _that = this;
switch (_that) {
case RestoreTriggered() when restoreTriggered != null:
return restoreTriggered(_that);case BackupTriggered() when backupTriggered != null:
return backupTriggered(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( RestoreTriggered value)  restoreTriggered,required TResult Function( BackupTriggered value)  backupTriggered,}){
final _that = this;
switch (_that) {
case RestoreTriggered():
return restoreTriggered(_that);case BackupTriggered():
return backupTriggered(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( RestoreTriggered value)?  restoreTriggered,TResult? Function( BackupTriggered value)?  backupTriggered,}){
final _that = this;
switch (_that) {
case RestoreTriggered() when restoreTriggered != null:
return restoreTriggered(_that);case BackupTriggered() when backupTriggered != null:
return backupTriggered(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String path)?  restoreTriggered,TResult Function( String path)?  backupTriggered,required TResult orElse(),}) {final _that = this;
switch (_that) {
case RestoreTriggered() when restoreTriggered != null:
return restoreTriggered(_that.path);case BackupTriggered() when backupTriggered != null:
return backupTriggered(_that.path);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String path)  restoreTriggered,required TResult Function( String path)  backupTriggered,}) {final _that = this;
switch (_that) {
case RestoreTriggered():
return restoreTriggered(_that.path);case BackupTriggered():
return backupTriggered(_that.path);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String path)?  restoreTriggered,TResult? Function( String path)?  backupTriggered,}) {final _that = this;
switch (_that) {
case RestoreTriggered() when restoreTriggered != null:
return restoreTriggered(_that.path);case BackupTriggered() when backupTriggered != null:
return backupTriggered(_that.path);case _:
  return null;

}
}

}

/// @nodoc


class RestoreTriggered implements BackupEvent {
  const RestoreTriggered({required this.path});
  

@override final  String path;

/// Create a copy of BackupEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RestoreTriggeredCopyWith<RestoreTriggered> get copyWith => _$RestoreTriggeredCopyWithImpl<RestoreTriggered>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RestoreTriggered&&(identical(other.path, path) || other.path == path));
}


@override
int get hashCode => Object.hash(runtimeType,path);

@override
String toString() {
  return 'BackupEvent.restoreTriggered(path: $path)';
}


}

/// @nodoc
abstract mixin class $RestoreTriggeredCopyWith<$Res> implements $BackupEventCopyWith<$Res> {
  factory $RestoreTriggeredCopyWith(RestoreTriggered value, $Res Function(RestoreTriggered) _then) = _$RestoreTriggeredCopyWithImpl;
@override @useResult
$Res call({
 String path
});




}
/// @nodoc
class _$RestoreTriggeredCopyWithImpl<$Res>
    implements $RestoreTriggeredCopyWith<$Res> {
  _$RestoreTriggeredCopyWithImpl(this._self, this._then);

  final RestoreTriggered _self;
  final $Res Function(RestoreTriggered) _then;

/// Create a copy of BackupEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? path = null,}) {
  return _then(RestoreTriggered(
path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class BackupTriggered implements BackupEvent {
  const BackupTriggered({required this.path});
  

@override final  String path;

/// Create a copy of BackupEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BackupTriggeredCopyWith<BackupTriggered> get copyWith => _$BackupTriggeredCopyWithImpl<BackupTriggered>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BackupTriggered&&(identical(other.path, path) || other.path == path));
}


@override
int get hashCode => Object.hash(runtimeType,path);

@override
String toString() {
  return 'BackupEvent.backupTriggered(path: $path)';
}


}

/// @nodoc
abstract mixin class $BackupTriggeredCopyWith<$Res> implements $BackupEventCopyWith<$Res> {
  factory $BackupTriggeredCopyWith(BackupTriggered value, $Res Function(BackupTriggered) _then) = _$BackupTriggeredCopyWithImpl;
@override @useResult
$Res call({
 String path
});




}
/// @nodoc
class _$BackupTriggeredCopyWithImpl<$Res>
    implements $BackupTriggeredCopyWith<$Res> {
  _$BackupTriggeredCopyWithImpl(this._self, this._then);

  final BackupTriggered _self;
  final $Res Function(BackupTriggered) _then;

/// Create a copy of BackupEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? path = null,}) {
  return _then(BackupTriggered(
path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
