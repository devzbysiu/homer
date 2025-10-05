// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'share_book_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ShareBookEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShareBookEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ShareBookEvent()';
}


}

/// @nodoc
class $ShareBookEventCopyWith<$Res>  {
$ShareBookEventCopyWith(ShareBookEvent _, $Res Function(ShareBookEvent) __);
}


/// Adds pattern-matching-related methods to [ShareBookEvent].
extension ShareBookEventPatterns on ShareBookEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( BookSharedFromOutside value)?  bookSharedFromOutside,TResult Function( ClearSharedBook value)?  clearSharedBook,required TResult orElse(),}){
final _that = this;
switch (_that) {
case BookSharedFromOutside() when bookSharedFromOutside != null:
return bookSharedFromOutside(_that);case ClearSharedBook() when clearSharedBook != null:
return clearSharedBook(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( BookSharedFromOutside value)  bookSharedFromOutside,required TResult Function( ClearSharedBook value)  clearSharedBook,}){
final _that = this;
switch (_that) {
case BookSharedFromOutside():
return bookSharedFromOutside(_that);case ClearSharedBook():
return clearSharedBook(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( BookSharedFromOutside value)?  bookSharedFromOutside,TResult? Function( ClearSharedBook value)?  clearSharedBook,}){
final _that = this;
switch (_that) {
case BookSharedFromOutside() when bookSharedFromOutside != null:
return bookSharedFromOutside(_that);case ClearSharedBook() when clearSharedBook != null:
return clearSharedBook(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String url)?  bookSharedFromOutside,TResult Function()?  clearSharedBook,required TResult orElse(),}) {final _that = this;
switch (_that) {
case BookSharedFromOutside() when bookSharedFromOutside != null:
return bookSharedFromOutside(_that.url);case ClearSharedBook() when clearSharedBook != null:
return clearSharedBook();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String url)  bookSharedFromOutside,required TResult Function()  clearSharedBook,}) {final _that = this;
switch (_that) {
case BookSharedFromOutside():
return bookSharedFromOutside(_that.url);case ClearSharedBook():
return clearSharedBook();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String url)?  bookSharedFromOutside,TResult? Function()?  clearSharedBook,}) {final _that = this;
switch (_that) {
case BookSharedFromOutside() when bookSharedFromOutside != null:
return bookSharedFromOutside(_that.url);case ClearSharedBook() when clearSharedBook != null:
return clearSharedBook();case _:
  return null;

}
}

}

/// @nodoc


class BookSharedFromOutside implements ShareBookEvent {
  const BookSharedFromOutside(this.url);
  

 final  String url;

/// Create a copy of ShareBookEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookSharedFromOutsideCopyWith<BookSharedFromOutside> get copyWith => _$BookSharedFromOutsideCopyWithImpl<BookSharedFromOutside>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookSharedFromOutside&&(identical(other.url, url) || other.url == url));
}


@override
int get hashCode => Object.hash(runtimeType,url);

@override
String toString() {
  return 'ShareBookEvent.bookSharedFromOutside(url: $url)';
}


}

/// @nodoc
abstract mixin class $BookSharedFromOutsideCopyWith<$Res> implements $ShareBookEventCopyWith<$Res> {
  factory $BookSharedFromOutsideCopyWith(BookSharedFromOutside value, $Res Function(BookSharedFromOutside) _then) = _$BookSharedFromOutsideCopyWithImpl;
@useResult
$Res call({
 String url
});




}
/// @nodoc
class _$BookSharedFromOutsideCopyWithImpl<$Res>
    implements $BookSharedFromOutsideCopyWith<$Res> {
  _$BookSharedFromOutsideCopyWithImpl(this._self, this._then);

  final BookSharedFromOutside _self;
  final $Res Function(BookSharedFromOutside) _then;

/// Create a copy of ShareBookEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? url = null,}) {
  return _then(BookSharedFromOutside(
null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ClearSharedBook implements ShareBookEvent {
  const ClearSharedBook();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClearSharedBook);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ShareBookEvent.clearSharedBook()';
}


}




// dart format on
