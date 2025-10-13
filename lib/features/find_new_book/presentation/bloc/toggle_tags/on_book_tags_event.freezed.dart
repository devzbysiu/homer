// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'on_book_tags_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BookTagsEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookTagsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BookTagsEvent()';
}


}

/// @nodoc
class $BookTagsEventCopyWith<$Res>  {
$BookTagsEventCopyWith(BookTagsEvent _, $Res Function(BookTagsEvent) __);
}


/// Adds pattern-matching-related methods to [BookTagsEvent].
extension BookTagsEventPatterns on BookTagsEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( TagSelected value)?  tagSelected,TResult Function( TagDeselected value)?  tagDeselected,TResult Function( ClearSelectedTags value)?  clearSelectedTags,required TResult orElse(),}){
final _that = this;
switch (_that) {
case TagSelected() when tagSelected != null:
return tagSelected(_that);case TagDeselected() when tagDeselected != null:
return tagDeselected(_that);case ClearSelectedTags() when clearSelectedTags != null:
return clearSelectedTags(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( TagSelected value)  tagSelected,required TResult Function( TagDeselected value)  tagDeselected,required TResult Function( ClearSelectedTags value)  clearSelectedTags,}){
final _that = this;
switch (_that) {
case TagSelected():
return tagSelected(_that);case TagDeselected():
return tagDeselected(_that);case ClearSelectedTags():
return clearSelectedTags(_that);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( TagSelected value)?  tagSelected,TResult? Function( TagDeselected value)?  tagDeselected,TResult? Function( ClearSelectedTags value)?  clearSelectedTags,}){
final _that = this;
switch (_that) {
case TagSelected() when tagSelected != null:
return tagSelected(_that);case TagDeselected() when tagDeselected != null:
return tagDeselected(_that);case ClearSelectedTags() when clearSelectedTags != null:
return clearSelectedTags(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( Tag tag)?  tagSelected,TResult Function( Tag tag)?  tagDeselected,TResult Function()?  clearSelectedTags,required TResult orElse(),}) {final _that = this;
switch (_that) {
case TagSelected() when tagSelected != null:
return tagSelected(_that.tag);case TagDeselected() when tagDeselected != null:
return tagDeselected(_that.tag);case ClearSelectedTags() when clearSelectedTags != null:
return clearSelectedTags();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( Tag tag)  tagSelected,required TResult Function( Tag tag)  tagDeselected,required TResult Function()  clearSelectedTags,}) {final _that = this;
switch (_that) {
case TagSelected():
return tagSelected(_that.tag);case TagDeselected():
return tagDeselected(_that.tag);case ClearSelectedTags():
return clearSelectedTags();case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( Tag tag)?  tagSelected,TResult? Function( Tag tag)?  tagDeselected,TResult? Function()?  clearSelectedTags,}) {final _that = this;
switch (_that) {
case TagSelected() when tagSelected != null:
return tagSelected(_that.tag);case TagDeselected() when tagDeselected != null:
return tagDeselected(_that.tag);case ClearSelectedTags() when clearSelectedTags != null:
return clearSelectedTags();case _:
  return null;

}
}

}

/// @nodoc


class TagSelected implements BookTagsEvent {
  const TagSelected(this.tag);
  

 final  Tag tag;

/// Create a copy of BookTagsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TagSelectedCopyWith<TagSelected> get copyWith => _$TagSelectedCopyWithImpl<TagSelected>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TagSelected&&(identical(other.tag, tag) || other.tag == tag));
}


@override
int get hashCode => Object.hash(runtimeType,tag);

@override
String toString() {
  return 'BookTagsEvent.tagSelected(tag: $tag)';
}


}

/// @nodoc
abstract mixin class $TagSelectedCopyWith<$Res> implements $BookTagsEventCopyWith<$Res> {
  factory $TagSelectedCopyWith(TagSelected value, $Res Function(TagSelected) _then) = _$TagSelectedCopyWithImpl;
@useResult
$Res call({
 Tag tag
});


$TagCopyWith<$Res> get tag;

}
/// @nodoc
class _$TagSelectedCopyWithImpl<$Res>
    implements $TagSelectedCopyWith<$Res> {
  _$TagSelectedCopyWithImpl(this._self, this._then);

  final TagSelected _self;
  final $Res Function(TagSelected) _then;

/// Create a copy of BookTagsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? tag = null,}) {
  return _then(TagSelected(
null == tag ? _self.tag : tag // ignore: cast_nullable_to_non_nullable
as Tag,
  ));
}

/// Create a copy of BookTagsEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TagCopyWith<$Res> get tag {
  
  return $TagCopyWith<$Res>(_self.tag, (value) {
    return _then(_self.copyWith(tag: value));
  });
}
}

/// @nodoc


class TagDeselected implements BookTagsEvent {
  const TagDeselected(this.tag);
  

 final  Tag tag;

/// Create a copy of BookTagsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TagDeselectedCopyWith<TagDeselected> get copyWith => _$TagDeselectedCopyWithImpl<TagDeselected>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TagDeselected&&(identical(other.tag, tag) || other.tag == tag));
}


@override
int get hashCode => Object.hash(runtimeType,tag);

@override
String toString() {
  return 'BookTagsEvent.tagDeselected(tag: $tag)';
}


}

/// @nodoc
abstract mixin class $TagDeselectedCopyWith<$Res> implements $BookTagsEventCopyWith<$Res> {
  factory $TagDeselectedCopyWith(TagDeselected value, $Res Function(TagDeselected) _then) = _$TagDeselectedCopyWithImpl;
@useResult
$Res call({
 Tag tag
});


$TagCopyWith<$Res> get tag;

}
/// @nodoc
class _$TagDeselectedCopyWithImpl<$Res>
    implements $TagDeselectedCopyWith<$Res> {
  _$TagDeselectedCopyWithImpl(this._self, this._then);

  final TagDeselected _self;
  final $Res Function(TagDeselected) _then;

/// Create a copy of BookTagsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? tag = null,}) {
  return _then(TagDeselected(
null == tag ? _self.tag : tag // ignore: cast_nullable_to_non_nullable
as Tag,
  ));
}

/// Create a copy of BookTagsEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TagCopyWith<$Res> get tag {
  
  return $TagCopyWith<$Res>(_self.tag, (value) {
    return _then(_self.copyWith(tag: value));
  });
}
}

/// @nodoc


class ClearSelectedTags implements BookTagsEvent {
  const ClearSelectedTags();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClearSelectedTags);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BookTagsEvent.clearSelectedTags()';
}


}




// dart format on
