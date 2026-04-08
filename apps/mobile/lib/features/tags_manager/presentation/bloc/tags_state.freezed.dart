// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tags_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TagsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TagsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TagsState()';
}


}

/// @nodoc
class $TagsStateCopyWith<$Res>  {
$TagsStateCopyWith(TagsState _, $Res Function(TagsState) __);
}


/// Adds pattern-matching-related methods to [TagsState].
extension TagsStatePatterns on TagsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Initial value)?  initial,TResult Function( Loaded value)?  loaded,TResult Function( FailedToLoad value)?  failedToLoad,required TResult orElse(),}){
final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that);case Loaded() when loaded != null:
return loaded(_that);case FailedToLoad() when failedToLoad != null:
return failedToLoad(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Initial value)  initial,required TResult Function( Loaded value)  loaded,required TResult Function( FailedToLoad value)  failedToLoad,}){
final _that = this;
switch (_that) {
case Initial():
return initial(_that);case Loaded():
return loaded(_that);case FailedToLoad():
return failedToLoad(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Initial value)?  initial,TResult? Function( Loaded value)?  loaded,TResult? Function( FailedToLoad value)?  failedToLoad,}){
final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that);case Loaded() when loaded != null:
return loaded(_that);case FailedToLoad() when failedToLoad != null:
return failedToLoad(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( List<Tag> tags)?  initial,TResult Function( List<Tag> tags)?  loaded,TResult Function()?  failedToLoad,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that.tags);case Loaded() when loaded != null:
return loaded(_that.tags);case FailedToLoad() when failedToLoad != null:
return failedToLoad();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( List<Tag> tags)  initial,required TResult Function( List<Tag> tags)  loaded,required TResult Function()  failedToLoad,}) {final _that = this;
switch (_that) {
case Initial():
return initial(_that.tags);case Loaded():
return loaded(_that.tags);case FailedToLoad():
return failedToLoad();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( List<Tag> tags)?  initial,TResult? Function( List<Tag> tags)?  loaded,TResult? Function()?  failedToLoad,}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that.tags);case Loaded() when loaded != null:
return loaded(_that.tags);case FailedToLoad() when failedToLoad != null:
return failedToLoad();case _:
  return null;

}
}

}

/// @nodoc


class Initial extends TagsState {
  const Initial({final  List<Tag> tags = const <Tag>[]}): _tags = tags,super._();
  

 final  List<Tag> _tags;
@JsonKey() List<Tag> get tags {
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tags);
}


/// Create a copy of TagsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InitialCopyWith<Initial> get copyWith => _$InitialCopyWithImpl<Initial>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Initial&&const DeepCollectionEquality().equals(other._tags, _tags));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_tags));

@override
String toString() {
  return 'TagsState.initial(tags: $tags)';
}


}

/// @nodoc
abstract mixin class $InitialCopyWith<$Res> implements $TagsStateCopyWith<$Res> {
  factory $InitialCopyWith(Initial value, $Res Function(Initial) _then) = _$InitialCopyWithImpl;
@useResult
$Res call({
 List<Tag> tags
});




}
/// @nodoc
class _$InitialCopyWithImpl<$Res>
    implements $InitialCopyWith<$Res> {
  _$InitialCopyWithImpl(this._self, this._then);

  final Initial _self;
  final $Res Function(Initial) _then;

/// Create a copy of TagsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? tags = null,}) {
  return _then(Initial(
tags: null == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<Tag>,
  ));
}


}

/// @nodoc


class Loaded extends TagsState {
  const Loaded(final  List<Tag> tags): _tags = tags,super._();
  

 final  List<Tag> _tags;
 List<Tag> get tags {
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tags);
}


/// Create a copy of TagsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadedCopyWith<Loaded> get copyWith => _$LoadedCopyWithImpl<Loaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Loaded&&const DeepCollectionEquality().equals(other._tags, _tags));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_tags));

@override
String toString() {
  return 'TagsState.loaded(tags: $tags)';
}


}

/// @nodoc
abstract mixin class $LoadedCopyWith<$Res> implements $TagsStateCopyWith<$Res> {
  factory $LoadedCopyWith(Loaded value, $Res Function(Loaded) _then) = _$LoadedCopyWithImpl;
@useResult
$Res call({
 List<Tag> tags
});




}
/// @nodoc
class _$LoadedCopyWithImpl<$Res>
    implements $LoadedCopyWith<$Res> {
  _$LoadedCopyWithImpl(this._self, this._then);

  final Loaded _self;
  final $Res Function(Loaded) _then;

/// Create a copy of TagsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? tags = null,}) {
  return _then(Loaded(
null == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<Tag>,
  ));
}


}

/// @nodoc


class FailedToLoad extends TagsState {
  const FailedToLoad(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FailedToLoad);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TagsState.failedToLoad()';
}


}




// dart format on
