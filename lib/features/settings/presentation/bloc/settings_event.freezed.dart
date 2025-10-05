// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'settings_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SettingsEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SettingsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SettingsEvent()';
}


}

/// @nodoc
class $SettingsEventCopyWith<$Res>  {
$SettingsEventCopyWith(SettingsEvent _, $Res Function(SettingsEvent) __);
}


/// Adds pattern-matching-related methods to [SettingsEvent].
extension SettingsEventPatterns on SettingsEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( SettingsLoaded value)?  settingsLoaded,TResult Function( ThemeToggled value)?  themeToggled,TResult Function( SystemThemeToggled value)?  systemThemeToggled,TResult Function( BackupsDirPicked value)?  backupsDirPicked,TResult Function( SizeLimitsChanged value)?  sizeLimitsChanged,TResult Function( ReadingGoalChanged value)?  readingGoalChanged,required TResult orElse(),}){
final _that = this;
switch (_that) {
case SettingsLoaded() when settingsLoaded != null:
return settingsLoaded(_that);case ThemeToggled() when themeToggled != null:
return themeToggled(_that);case SystemThemeToggled() when systemThemeToggled != null:
return systemThemeToggled(_that);case BackupsDirPicked() when backupsDirPicked != null:
return backupsDirPicked(_that);case SizeLimitsChanged() when sizeLimitsChanged != null:
return sizeLimitsChanged(_that);case ReadingGoalChanged() when readingGoalChanged != null:
return readingGoalChanged(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( SettingsLoaded value)  settingsLoaded,required TResult Function( ThemeToggled value)  themeToggled,required TResult Function( SystemThemeToggled value)  systemThemeToggled,required TResult Function( BackupsDirPicked value)  backupsDirPicked,required TResult Function( SizeLimitsChanged value)  sizeLimitsChanged,required TResult Function( ReadingGoalChanged value)  readingGoalChanged,}){
final _that = this;
switch (_that) {
case SettingsLoaded():
return settingsLoaded(_that);case ThemeToggled():
return themeToggled(_that);case SystemThemeToggled():
return systemThemeToggled(_that);case BackupsDirPicked():
return backupsDirPicked(_that);case SizeLimitsChanged():
return sizeLimitsChanged(_that);case ReadingGoalChanged():
return readingGoalChanged(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( SettingsLoaded value)?  settingsLoaded,TResult? Function( ThemeToggled value)?  themeToggled,TResult? Function( SystemThemeToggled value)?  systemThemeToggled,TResult? Function( BackupsDirPicked value)?  backupsDirPicked,TResult? Function( SizeLimitsChanged value)?  sizeLimitsChanged,TResult? Function( ReadingGoalChanged value)?  readingGoalChanged,}){
final _that = this;
switch (_that) {
case SettingsLoaded() when settingsLoaded != null:
return settingsLoaded(_that);case ThemeToggled() when themeToggled != null:
return themeToggled(_that);case SystemThemeToggled() when systemThemeToggled != null:
return systemThemeToggled(_that);case BackupsDirPicked() when backupsDirPicked != null:
return backupsDirPicked(_that);case SizeLimitsChanged() when sizeLimitsChanged != null:
return sizeLimitsChanged(_that);case ReadingGoalChanged() when readingGoalChanged != null:
return readingGoalChanged(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  settingsLoaded,TResult Function()?  themeToggled,TResult Function()?  systemThemeToggled,TResult Function( Directory directory)?  backupsDirPicked,TResult Function( BookSizeLimits limits)?  sizeLimitsChanged,TResult Function( ReadingGoal goal)?  readingGoalChanged,required TResult orElse(),}) {final _that = this;
switch (_that) {
case SettingsLoaded() when settingsLoaded != null:
return settingsLoaded();case ThemeToggled() when themeToggled != null:
return themeToggled();case SystemThemeToggled() when systemThemeToggled != null:
return systemThemeToggled();case BackupsDirPicked() when backupsDirPicked != null:
return backupsDirPicked(_that.directory);case SizeLimitsChanged() when sizeLimitsChanged != null:
return sizeLimitsChanged(_that.limits);case ReadingGoalChanged() when readingGoalChanged != null:
return readingGoalChanged(_that.goal);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  settingsLoaded,required TResult Function()  themeToggled,required TResult Function()  systemThemeToggled,required TResult Function( Directory directory)  backupsDirPicked,required TResult Function( BookSizeLimits limits)  sizeLimitsChanged,required TResult Function( ReadingGoal goal)  readingGoalChanged,}) {final _that = this;
switch (_that) {
case SettingsLoaded():
return settingsLoaded();case ThemeToggled():
return themeToggled();case SystemThemeToggled():
return systemThemeToggled();case BackupsDirPicked():
return backupsDirPicked(_that.directory);case SizeLimitsChanged():
return sizeLimitsChanged(_that.limits);case ReadingGoalChanged():
return readingGoalChanged(_that.goal);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  settingsLoaded,TResult? Function()?  themeToggled,TResult? Function()?  systemThemeToggled,TResult? Function( Directory directory)?  backupsDirPicked,TResult? Function( BookSizeLimits limits)?  sizeLimitsChanged,TResult? Function( ReadingGoal goal)?  readingGoalChanged,}) {final _that = this;
switch (_that) {
case SettingsLoaded() when settingsLoaded != null:
return settingsLoaded();case ThemeToggled() when themeToggled != null:
return themeToggled();case SystemThemeToggled() when systemThemeToggled != null:
return systemThemeToggled();case BackupsDirPicked() when backupsDirPicked != null:
return backupsDirPicked(_that.directory);case SizeLimitsChanged() when sizeLimitsChanged != null:
return sizeLimitsChanged(_that.limits);case ReadingGoalChanged() when readingGoalChanged != null:
return readingGoalChanged(_that.goal);case _:
  return null;

}
}

}

/// @nodoc


class SettingsLoaded implements SettingsEvent {
  const SettingsLoaded();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SettingsLoaded);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SettingsEvent.settingsLoaded()';
}


}




/// @nodoc


class ThemeToggled implements SettingsEvent {
  const ThemeToggled();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ThemeToggled);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SettingsEvent.themeToggled()';
}


}




/// @nodoc


class SystemThemeToggled implements SettingsEvent {
  const SystemThemeToggled();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SystemThemeToggled);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SettingsEvent.systemThemeToggled()';
}


}




/// @nodoc


class BackupsDirPicked implements SettingsEvent {
  const BackupsDirPicked(this.directory);
  

 final  Directory directory;

/// Create a copy of SettingsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BackupsDirPickedCopyWith<BackupsDirPicked> get copyWith => _$BackupsDirPickedCopyWithImpl<BackupsDirPicked>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BackupsDirPicked&&(identical(other.directory, directory) || other.directory == directory));
}


@override
int get hashCode => Object.hash(runtimeType,directory);

@override
String toString() {
  return 'SettingsEvent.backupsDirPicked(directory: $directory)';
}


}

/// @nodoc
abstract mixin class $BackupsDirPickedCopyWith<$Res> implements $SettingsEventCopyWith<$Res> {
  factory $BackupsDirPickedCopyWith(BackupsDirPicked value, $Res Function(BackupsDirPicked) _then) = _$BackupsDirPickedCopyWithImpl;
@useResult
$Res call({
 Directory directory
});




}
/// @nodoc
class _$BackupsDirPickedCopyWithImpl<$Res>
    implements $BackupsDirPickedCopyWith<$Res> {
  _$BackupsDirPickedCopyWithImpl(this._self, this._then);

  final BackupsDirPicked _self;
  final $Res Function(BackupsDirPicked) _then;

/// Create a copy of SettingsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? directory = null,}) {
  return _then(BackupsDirPicked(
null == directory ? _self.directory : directory // ignore: cast_nullable_to_non_nullable
as Directory,
  ));
}


}

/// @nodoc


class SizeLimitsChanged implements SettingsEvent {
  const SizeLimitsChanged(this.limits);
  

 final  BookSizeLimits limits;

/// Create a copy of SettingsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SizeLimitsChangedCopyWith<SizeLimitsChanged> get copyWith => _$SizeLimitsChangedCopyWithImpl<SizeLimitsChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SizeLimitsChanged&&(identical(other.limits, limits) || other.limits == limits));
}


@override
int get hashCode => Object.hash(runtimeType,limits);

@override
String toString() {
  return 'SettingsEvent.sizeLimitsChanged(limits: $limits)';
}


}

/// @nodoc
abstract mixin class $SizeLimitsChangedCopyWith<$Res> implements $SettingsEventCopyWith<$Res> {
  factory $SizeLimitsChangedCopyWith(SizeLimitsChanged value, $Res Function(SizeLimitsChanged) _then) = _$SizeLimitsChangedCopyWithImpl;
@useResult
$Res call({
 BookSizeLimits limits
});




}
/// @nodoc
class _$SizeLimitsChangedCopyWithImpl<$Res>
    implements $SizeLimitsChangedCopyWith<$Res> {
  _$SizeLimitsChangedCopyWithImpl(this._self, this._then);

  final SizeLimitsChanged _self;
  final $Res Function(SizeLimitsChanged) _then;

/// Create a copy of SettingsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? limits = null,}) {
  return _then(SizeLimitsChanged(
null == limits ? _self.limits : limits // ignore: cast_nullable_to_non_nullable
as BookSizeLimits,
  ));
}


}

/// @nodoc


class ReadingGoalChanged implements SettingsEvent {
  const ReadingGoalChanged(this.goal);
  

 final  ReadingGoal goal;

/// Create a copy of SettingsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReadingGoalChangedCopyWith<ReadingGoalChanged> get copyWith => _$ReadingGoalChangedCopyWithImpl<ReadingGoalChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReadingGoalChanged&&(identical(other.goal, goal) || other.goal == goal));
}


@override
int get hashCode => Object.hash(runtimeType,goal);

@override
String toString() {
  return 'SettingsEvent.readingGoalChanged(goal: $goal)';
}


}

/// @nodoc
abstract mixin class $ReadingGoalChangedCopyWith<$Res> implements $SettingsEventCopyWith<$Res> {
  factory $ReadingGoalChangedCopyWith(ReadingGoalChanged value, $Res Function(ReadingGoalChanged) _then) = _$ReadingGoalChangedCopyWithImpl;
@useResult
$Res call({
 ReadingGoal goal
});




}
/// @nodoc
class _$ReadingGoalChangedCopyWithImpl<$Res>
    implements $ReadingGoalChangedCopyWith<$Res> {
  _$ReadingGoalChangedCopyWithImpl(this._self, this._then);

  final ReadingGoalChanged _self;
  final $Res Function(ReadingGoalChanged) _then;

/// Create a copy of SettingsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? goal = null,}) {
  return _then(ReadingGoalChanged(
null == goal ? _self.goal : goal // ignore: cast_nullable_to_non_nullable
as ReadingGoal,
  ));
}


}

// dart format on
