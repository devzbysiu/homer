// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_tab_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AppTabState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppTabState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppTabState()';
}


}

/// @nodoc
class $AppTabStateCopyWith<$Res>  {
$AppTabStateCopyWith(AppTabState _, $Res Function(AppTabState) __);
}


/// Adds pattern-matching-related methods to [AppTabState].
extension AppTabStatePatterns on AppTabState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ReadLater value)?  readLater,TResult Function( Reading value)?  reading,TResult Function( Read value)?  read,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ReadLater() when readLater != null:
return readLater(_that);case Reading() when reading != null:
return reading(_that);case Read() when read != null:
return read(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ReadLater value)  readLater,required TResult Function( Reading value)  reading,required TResult Function( Read value)  read,}){
final _that = this;
switch (_that) {
case ReadLater():
return readLater(_that);case Reading():
return reading(_that);case Read():
return read(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ReadLater value)?  readLater,TResult? Function( Reading value)?  reading,TResult? Function( Read value)?  read,}){
final _that = this;
switch (_that) {
case ReadLater() when readLater != null:
return readLater(_that);case Reading() when reading != null:
return reading(_that);case Read() when read != null:
return read(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  readLater,TResult Function()?  reading,TResult Function()?  read,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ReadLater() when readLater != null:
return readLater();case Reading() when reading != null:
return reading();case Read() when read != null:
return read();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  readLater,required TResult Function()  reading,required TResult Function()  read,}) {final _that = this;
switch (_that) {
case ReadLater():
return readLater();case Reading():
return reading();case Read():
return read();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  readLater,TResult? Function()?  reading,TResult? Function()?  read,}) {final _that = this;
switch (_that) {
case ReadLater() when readLater != null:
return readLater();case Reading() when reading != null:
return reading();case Read() when read != null:
return read();case _:
  return null;

}
}

}

/// @nodoc


class ReadLater extends AppTabState {
  const ReadLater(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReadLater);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppTabState.readLater()';
}


}




/// @nodoc


class Reading extends AppTabState {
  const Reading(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Reading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppTabState.reading()';
}


}




/// @nodoc


class Read extends AppTabState {
  const Read(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Read);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppTabState.read()';
}


}




// dart format on
