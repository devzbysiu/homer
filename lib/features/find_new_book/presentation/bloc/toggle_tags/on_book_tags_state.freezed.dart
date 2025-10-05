// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'on_book_tags_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BookTagsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookTagsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BookTagsState()';
}


}

/// @nodoc
class $BookTagsStateCopyWith<$Res>  {
$BookTagsStateCopyWith(BookTagsState _, $Res Function(BookTagsState) __);
}


/// Adds pattern-matching-related methods to [BookTagsState].
extension BookTagsStatePatterns on BookTagsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Initial value)?  initial,TResult Function( TagsSelected value)?  tagsSelected,TResult Function( Empty value)?  empty,required TResult orElse(),}){
final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that);case TagsSelected() when tagsSelected != null:
return tagsSelected(_that);case Empty() when empty != null:
return empty(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Initial value)  initial,required TResult Function( TagsSelected value)  tagsSelected,required TResult Function( Empty value)  empty,}){
final _that = this;
switch (_that) {
case Initial():
return initial(_that);case TagsSelected():
return tagsSelected(_that);case Empty():
return empty(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Initial value)?  initial,TResult? Function( TagsSelected value)?  tagsSelected,TResult? Function( Empty value)?  empty,}){
final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that);case TagsSelected() when tagsSelected != null:
return tagsSelected(_that);case Empty() when empty != null:
return empty(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function( List<Tag> selectedTags)?  tagsSelected,TResult Function()?  empty,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial();case TagsSelected() when tagsSelected != null:
return tagsSelected(_that.selectedTags);case Empty() when empty != null:
return empty();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function( List<Tag> selectedTags)  tagsSelected,required TResult Function()  empty,}) {final _that = this;
switch (_that) {
case Initial():
return initial();case TagsSelected():
return tagsSelected(_that.selectedTags);case Empty():
return empty();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function( List<Tag> selectedTags)?  tagsSelected,TResult? Function()?  empty,}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial();case TagsSelected() when tagsSelected != null:
return tagsSelected(_that.selectedTags);case Empty() when empty != null:
return empty();case _:
  return null;

}
}

}

/// @nodoc


class Initial extends BookTagsState {
  const Initial(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BookTagsState.initial()';
}


}




/// @nodoc


class TagsSelected extends BookTagsState {
  const TagsSelected(final  List<Tag> selectedTags): _selectedTags = selectedTags,super._();
  

 final  List<Tag> _selectedTags;
 List<Tag> get selectedTags {
  if (_selectedTags is EqualUnmodifiableListView) return _selectedTags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_selectedTags);
}


/// Create a copy of BookTagsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TagsSelectedCopyWith<TagsSelected> get copyWith => _$TagsSelectedCopyWithImpl<TagsSelected>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TagsSelected&&const DeepCollectionEquality().equals(other._selectedTags, _selectedTags));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_selectedTags));

@override
String toString() {
  return 'BookTagsState.tagsSelected(selectedTags: $selectedTags)';
}


}

/// @nodoc
abstract mixin class $TagsSelectedCopyWith<$Res> implements $BookTagsStateCopyWith<$Res> {
  factory $TagsSelectedCopyWith(TagsSelected value, $Res Function(TagsSelected) _then) = _$TagsSelectedCopyWithImpl;
@useResult
$Res call({
 List<Tag> selectedTags
});




}
/// @nodoc
class _$TagsSelectedCopyWithImpl<$Res>
    implements $TagsSelectedCopyWith<$Res> {
  _$TagsSelectedCopyWithImpl(this._self, this._then);

  final TagsSelected _self;
  final $Res Function(TagsSelected) _then;

/// Create a copy of BookTagsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? selectedTags = null,}) {
  return _then(TagsSelected(
null == selectedTags ? _self._selectedTags : selectedTags // ignore: cast_nullable_to_non_nullable
as List<Tag>,
  ));
}


}

/// @nodoc


class Empty extends BookTagsState {
  const Empty(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Empty);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BookTagsState.empty()';
}


}




// dart format on
