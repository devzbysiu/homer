// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_tab_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AppTabEvent {

 AppTab get selectedTab;
/// Create a copy of AppTabEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppTabEventCopyWith<AppTabEvent> get copyWith => _$AppTabEventCopyWithImpl<AppTabEvent>(this as AppTabEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppTabEvent&&(identical(other.selectedTab, selectedTab) || other.selectedTab == selectedTab));
}


@override
int get hashCode => Object.hash(runtimeType,selectedTab);

@override
String toString() {
  return 'AppTabEvent(selectedTab: $selectedTab)';
}


}

/// @nodoc
abstract mixin class $AppTabEventCopyWith<$Res>  {
  factory $AppTabEventCopyWith(AppTabEvent value, $Res Function(AppTabEvent) _then) = _$AppTabEventCopyWithImpl;
@useResult
$Res call({
 AppTab selectedTab
});




}
/// @nodoc
class _$AppTabEventCopyWithImpl<$Res>
    implements $AppTabEventCopyWith<$Res> {
  _$AppTabEventCopyWithImpl(this._self, this._then);

  final AppTabEvent _self;
  final $Res Function(AppTabEvent) _then;

/// Create a copy of AppTabEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? selectedTab = null,}) {
  return _then(_self.copyWith(
selectedTab: null == selectedTab ? _self.selectedTab : selectedTab // ignore: cast_nullable_to_non_nullable
as AppTab,
  ));
}

}


/// Adds pattern-matching-related methods to [AppTabEvent].
extension AppTabEventPatterns on AppTabEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( TabChanged value)?  tabChanged,required TResult orElse(),}){
final _that = this;
switch (_that) {
case TabChanged() when tabChanged != null:
return tabChanged(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( TabChanged value)  tabChanged,}){
final _that = this;
switch (_that) {
case TabChanged():
return tabChanged(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( TabChanged value)?  tabChanged,}){
final _that = this;
switch (_that) {
case TabChanged() when tabChanged != null:
return tabChanged(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( AppTab selectedTab)?  tabChanged,required TResult orElse(),}) {final _that = this;
switch (_that) {
case TabChanged() when tabChanged != null:
return tabChanged(_that.selectedTab);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( AppTab selectedTab)  tabChanged,}) {final _that = this;
switch (_that) {
case TabChanged():
return tabChanged(_that.selectedTab);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( AppTab selectedTab)?  tabChanged,}) {final _that = this;
switch (_that) {
case TabChanged() when tabChanged != null:
return tabChanged(_that.selectedTab);case _:
  return null;

}
}

}

/// @nodoc


class TabChanged implements AppTabEvent {
  const TabChanged(this.selectedTab);
  

@override final  AppTab selectedTab;

/// Create a copy of AppTabEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TabChangedCopyWith<TabChanged> get copyWith => _$TabChangedCopyWithImpl<TabChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TabChanged&&(identical(other.selectedTab, selectedTab) || other.selectedTab == selectedTab));
}


@override
int get hashCode => Object.hash(runtimeType,selectedTab);

@override
String toString() {
  return 'AppTabEvent.tabChanged(selectedTab: $selectedTab)';
}


}

/// @nodoc
abstract mixin class $TabChangedCopyWith<$Res> implements $AppTabEventCopyWith<$Res> {
  factory $TabChangedCopyWith(TabChanged value, $Res Function(TabChanged) _then) = _$TabChangedCopyWithImpl;
@override @useResult
$Res call({
 AppTab selectedTab
});




}
/// @nodoc
class _$TabChangedCopyWithImpl<$Res>
    implements $TabChangedCopyWith<$Res> {
  _$TabChangedCopyWithImpl(this._self, this._then);

  final TabChanged _self;
  final $Res Function(TabChanged) _then;

/// Create a copy of AppTabEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? selectedTab = null,}) {
  return _then(TabChanged(
null == selectedTab ? _self.selectedTab : selectedTab // ignore: cast_nullable_to_non_nullable
as AppTab,
  ));
}


}

// dart format on
