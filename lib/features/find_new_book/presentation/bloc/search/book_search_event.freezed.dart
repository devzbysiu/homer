// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'book_search_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SearchEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SearchEvent()';
}


}

/// @nodoc
class $SearchEventCopyWith<$Res>  {
$SearchEventCopyWith(SearchEvent _, $Res Function(SearchEvent) __);
}


/// Adds pattern-matching-related methods to [SearchEvent].
extension SearchEventPatterns on SearchEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Searching value)?  searching,TResult Function( SuggestionPicked value)?  suggestionPicked,TResult Function( ClearPickedBook value)?  clearPickedBook,TResult Function( ShareOffloaded value)?  shareOffloaded,TResult Function( ResetShareOffload value)?  resetShareOffloaded,required TResult orElse(),}){
final _that = this;
switch (_that) {
case Searching() when searching != null:
return searching(_that);case SuggestionPicked() when suggestionPicked != null:
return suggestionPicked(_that);case ClearPickedBook() when clearPickedBook != null:
return clearPickedBook(_that);case ShareOffloaded() when shareOffloaded != null:
return shareOffloaded(_that);case ResetShareOffload() when resetShareOffloaded != null:
return resetShareOffloaded(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Searching value)  searching,required TResult Function( SuggestionPicked value)  suggestionPicked,required TResult Function( ClearPickedBook value)  clearPickedBook,required TResult Function( ShareOffloaded value)  shareOffloaded,required TResult Function( ResetShareOffload value)  resetShareOffloaded,}){
final _that = this;
switch (_that) {
case Searching():
return searching(_that);case SuggestionPicked():
return suggestionPicked(_that);case ClearPickedBook():
return clearPickedBook(_that);case ShareOffloaded():
return shareOffloaded(_that);case ResetShareOffload():
return resetShareOffloaded(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Searching value)?  searching,TResult? Function( SuggestionPicked value)?  suggestionPicked,TResult? Function( ClearPickedBook value)?  clearPickedBook,TResult? Function( ShareOffloaded value)?  shareOffloaded,TResult? Function( ResetShareOffload value)?  resetShareOffloaded,}){
final _that = this;
switch (_that) {
case Searching() when searching != null:
return searching(_that);case SuggestionPicked() when suggestionPicked != null:
return suggestionPicked(_that);case ClearPickedBook() when clearPickedBook != null:
return clearPickedBook(_that);case ShareOffloaded() when shareOffloaded != null:
return shareOffloaded(_that);case ResetShareOffload() when resetShareOffloaded != null:
return resetShareOffloaded(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String query)?  searching,TResult Function( Book pickedBook)?  suggestionPicked,TResult Function()?  clearPickedBook,TResult Function( String query)?  shareOffloaded,TResult Function()?  resetShareOffloaded,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Searching() when searching != null:
return searching(_that.query);case SuggestionPicked() when suggestionPicked != null:
return suggestionPicked(_that.pickedBook);case ClearPickedBook() when clearPickedBook != null:
return clearPickedBook();case ShareOffloaded() when shareOffloaded != null:
return shareOffloaded(_that.query);case ResetShareOffload() when resetShareOffloaded != null:
return resetShareOffloaded();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String query)  searching,required TResult Function( Book pickedBook)  suggestionPicked,required TResult Function()  clearPickedBook,required TResult Function( String query)  shareOffloaded,required TResult Function()  resetShareOffloaded,}) {final _that = this;
switch (_that) {
case Searching():
return searching(_that.query);case SuggestionPicked():
return suggestionPicked(_that.pickedBook);case ClearPickedBook():
return clearPickedBook();case ShareOffloaded():
return shareOffloaded(_that.query);case ResetShareOffload():
return resetShareOffloaded();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String query)?  searching,TResult? Function( Book pickedBook)?  suggestionPicked,TResult? Function()?  clearPickedBook,TResult? Function( String query)?  shareOffloaded,TResult? Function()?  resetShareOffloaded,}) {final _that = this;
switch (_that) {
case Searching() when searching != null:
return searching(_that.query);case SuggestionPicked() when suggestionPicked != null:
return suggestionPicked(_that.pickedBook);case ClearPickedBook() when clearPickedBook != null:
return clearPickedBook();case ShareOffloaded() when shareOffloaded != null:
return shareOffloaded(_that.query);case ResetShareOffload() when resetShareOffloaded != null:
return resetShareOffloaded();case _:
  return null;

}
}

}

/// @nodoc


class Searching implements SearchEvent {
  const Searching({required this.query});
  

 final  String query;

/// Create a copy of SearchEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchingCopyWith<Searching> get copyWith => _$SearchingCopyWithImpl<Searching>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Searching&&(identical(other.query, query) || other.query == query));
}


@override
int get hashCode => Object.hash(runtimeType,query);

@override
String toString() {
  return 'SearchEvent.searching(query: $query)';
}


}

/// @nodoc
abstract mixin class $SearchingCopyWith<$Res> implements $SearchEventCopyWith<$Res> {
  factory $SearchingCopyWith(Searching value, $Res Function(Searching) _then) = _$SearchingCopyWithImpl;
@useResult
$Res call({
 String query
});




}
/// @nodoc
class _$SearchingCopyWithImpl<$Res>
    implements $SearchingCopyWith<$Res> {
  _$SearchingCopyWithImpl(this._self, this._then);

  final Searching _self;
  final $Res Function(Searching) _then;

/// Create a copy of SearchEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? query = null,}) {
  return _then(Searching(
query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class SuggestionPicked implements SearchEvent {
  const SuggestionPicked({required this.pickedBook});
  

 final  Book pickedBook;

/// Create a copy of SearchEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SuggestionPickedCopyWith<SuggestionPicked> get copyWith => _$SuggestionPickedCopyWithImpl<SuggestionPicked>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SuggestionPicked&&(identical(other.pickedBook, pickedBook) || other.pickedBook == pickedBook));
}


@override
int get hashCode => Object.hash(runtimeType,pickedBook);

@override
String toString() {
  return 'SearchEvent.suggestionPicked(pickedBook: $pickedBook)';
}


}

/// @nodoc
abstract mixin class $SuggestionPickedCopyWith<$Res> implements $SearchEventCopyWith<$Res> {
  factory $SuggestionPickedCopyWith(SuggestionPicked value, $Res Function(SuggestionPicked) _then) = _$SuggestionPickedCopyWithImpl;
@useResult
$Res call({
 Book pickedBook
});


$BookCopyWith<$Res> get pickedBook;

}
/// @nodoc
class _$SuggestionPickedCopyWithImpl<$Res>
    implements $SuggestionPickedCopyWith<$Res> {
  _$SuggestionPickedCopyWithImpl(this._self, this._then);

  final SuggestionPicked _self;
  final $Res Function(SuggestionPicked) _then;

/// Create a copy of SearchEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? pickedBook = null,}) {
  return _then(SuggestionPicked(
pickedBook: null == pickedBook ? _self.pickedBook : pickedBook // ignore: cast_nullable_to_non_nullable
as Book,
  ));
}

/// Create a copy of SearchEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BookCopyWith<$Res> get pickedBook {
  
  return $BookCopyWith<$Res>(_self.pickedBook, (value) {
    return _then(_self.copyWith(pickedBook: value));
  });
}
}

/// @nodoc


class ClearPickedBook implements SearchEvent {
  const ClearPickedBook();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClearPickedBook);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SearchEvent.clearPickedBook()';
}


}




/// @nodoc


class ShareOffloaded implements SearchEvent {
  const ShareOffloaded({required this.query});
  

 final  String query;

/// Create a copy of SearchEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShareOffloadedCopyWith<ShareOffloaded> get copyWith => _$ShareOffloadedCopyWithImpl<ShareOffloaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShareOffloaded&&(identical(other.query, query) || other.query == query));
}


@override
int get hashCode => Object.hash(runtimeType,query);

@override
String toString() {
  return 'SearchEvent.shareOffloaded(query: $query)';
}


}

/// @nodoc
abstract mixin class $ShareOffloadedCopyWith<$Res> implements $SearchEventCopyWith<$Res> {
  factory $ShareOffloadedCopyWith(ShareOffloaded value, $Res Function(ShareOffloaded) _then) = _$ShareOffloadedCopyWithImpl;
@useResult
$Res call({
 String query
});




}
/// @nodoc
class _$ShareOffloadedCopyWithImpl<$Res>
    implements $ShareOffloadedCopyWith<$Res> {
  _$ShareOffloadedCopyWithImpl(this._self, this._then);

  final ShareOffloaded _self;
  final $Res Function(ShareOffloaded) _then;

/// Create a copy of SearchEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? query = null,}) {
  return _then(ShareOffloaded(
query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ResetShareOffload implements SearchEvent {
  const ResetShareOffload();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResetShareOffload);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SearchEvent.resetShareOffloaded()';
}


}




// dart format on
