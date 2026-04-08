// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'share_book_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ShareBookState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShareBookState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ShareBookState()';
}


}

/// @nodoc
class $ShareBookStateCopyWith<$Res>  {
$ShareBookStateCopyWith(ShareBookState _, $Res Function(ShareBookState) __);
}


/// Adds pattern-matching-related methods to [ShareBookState].
extension ShareBookStatePatterns on ShareBookState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Initial value)?  initial,TResult Function( BookShared value)?  bookShared,TResult Function( BookNotShared value)?  bookNotShared,TResult Function( FetchingSharedBookDetails value)?  fetchingSharedBookDetails,TResult Function( FetchingDetailsFailed value)?  fetchingDetailsFailed,required TResult orElse(),}){
final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that);case BookShared() when bookShared != null:
return bookShared(_that);case BookNotShared() when bookNotShared != null:
return bookNotShared(_that);case FetchingSharedBookDetails() when fetchingSharedBookDetails != null:
return fetchingSharedBookDetails(_that);case FetchingDetailsFailed() when fetchingDetailsFailed != null:
return fetchingDetailsFailed(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Initial value)  initial,required TResult Function( BookShared value)  bookShared,required TResult Function( BookNotShared value)  bookNotShared,required TResult Function( FetchingSharedBookDetails value)  fetchingSharedBookDetails,required TResult Function( FetchingDetailsFailed value)  fetchingDetailsFailed,}){
final _that = this;
switch (_that) {
case Initial():
return initial(_that);case BookShared():
return bookShared(_that);case BookNotShared():
return bookNotShared(_that);case FetchingSharedBookDetails():
return fetchingSharedBookDetails(_that);case FetchingDetailsFailed():
return fetchingDetailsFailed(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Initial value)?  initial,TResult? Function( BookShared value)?  bookShared,TResult? Function( BookNotShared value)?  bookNotShared,TResult? Function( FetchingSharedBookDetails value)?  fetchingSharedBookDetails,TResult? Function( FetchingDetailsFailed value)?  fetchingDetailsFailed,}){
final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that);case BookShared() when bookShared != null:
return bookShared(_that);case BookNotShared() when bookNotShared != null:
return bookNotShared(_that);case FetchingSharedBookDetails() when fetchingSharedBookDetails != null:
return fetchingSharedBookDetails(_that);case FetchingDetailsFailed() when fetchingDetailsFailed != null:
return fetchingDetailsFailed(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function( Book book)?  bookShared,TResult Function()?  bookNotShared,TResult Function()?  fetchingSharedBookDetails,TResult Function( String cause)?  fetchingDetailsFailed,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial();case BookShared() when bookShared != null:
return bookShared(_that.book);case BookNotShared() when bookNotShared != null:
return bookNotShared();case FetchingSharedBookDetails() when fetchingSharedBookDetails != null:
return fetchingSharedBookDetails();case FetchingDetailsFailed() when fetchingDetailsFailed != null:
return fetchingDetailsFailed(_that.cause);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function( Book book)  bookShared,required TResult Function()  bookNotShared,required TResult Function()  fetchingSharedBookDetails,required TResult Function( String cause)  fetchingDetailsFailed,}) {final _that = this;
switch (_that) {
case Initial():
return initial();case BookShared():
return bookShared(_that.book);case BookNotShared():
return bookNotShared();case FetchingSharedBookDetails():
return fetchingSharedBookDetails();case FetchingDetailsFailed():
return fetchingDetailsFailed(_that.cause);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function( Book book)?  bookShared,TResult? Function()?  bookNotShared,TResult? Function()?  fetchingSharedBookDetails,TResult? Function( String cause)?  fetchingDetailsFailed,}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial();case BookShared() when bookShared != null:
return bookShared(_that.book);case BookNotShared() when bookNotShared != null:
return bookNotShared();case FetchingSharedBookDetails() when fetchingSharedBookDetails != null:
return fetchingSharedBookDetails();case FetchingDetailsFailed() when fetchingDetailsFailed != null:
return fetchingDetailsFailed(_that.cause);case _:
  return null;

}
}

}

/// @nodoc


class Initial extends ShareBookState {
  const Initial(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ShareBookState.initial()';
}


}




/// @nodoc


class BookShared extends ShareBookState {
  const BookShared({required this.book}): super._();
  

 final  Book book;

/// Create a copy of ShareBookState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookSharedCopyWith<BookShared> get copyWith => _$BookSharedCopyWithImpl<BookShared>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookShared&&(identical(other.book, book) || other.book == book));
}


@override
int get hashCode => Object.hash(runtimeType,book);

@override
String toString() {
  return 'ShareBookState.bookShared(book: $book)';
}


}

/// @nodoc
abstract mixin class $BookSharedCopyWith<$Res> implements $ShareBookStateCopyWith<$Res> {
  factory $BookSharedCopyWith(BookShared value, $Res Function(BookShared) _then) = _$BookSharedCopyWithImpl;
@useResult
$Res call({
 Book book
});


$BookCopyWith<$Res> get book;

}
/// @nodoc
class _$BookSharedCopyWithImpl<$Res>
    implements $BookSharedCopyWith<$Res> {
  _$BookSharedCopyWithImpl(this._self, this._then);

  final BookShared _self;
  final $Res Function(BookShared) _then;

/// Create a copy of ShareBookState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? book = null,}) {
  return _then(BookShared(
book: null == book ? _self.book : book // ignore: cast_nullable_to_non_nullable
as Book,
  ));
}

/// Create a copy of ShareBookState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BookCopyWith<$Res> get book {
  
  return $BookCopyWith<$Res>(_self.book, (value) {
    return _then(_self.copyWith(book: value));
  });
}
}

/// @nodoc


class BookNotShared extends ShareBookState {
  const BookNotShared(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookNotShared);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ShareBookState.bookNotShared()';
}


}




/// @nodoc


class FetchingSharedBookDetails extends ShareBookState {
  const FetchingSharedBookDetails(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FetchingSharedBookDetails);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ShareBookState.fetchingSharedBookDetails()';
}


}




/// @nodoc


class FetchingDetailsFailed extends ShareBookState {
  const FetchingDetailsFailed({required this.cause}): super._();
  

 final  String cause;

/// Create a copy of ShareBookState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FetchingDetailsFailedCopyWith<FetchingDetailsFailed> get copyWith => _$FetchingDetailsFailedCopyWithImpl<FetchingDetailsFailed>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FetchingDetailsFailed&&(identical(other.cause, cause) || other.cause == cause));
}


@override
int get hashCode => Object.hash(runtimeType,cause);

@override
String toString() {
  return 'ShareBookState.fetchingDetailsFailed(cause: $cause)';
}


}

/// @nodoc
abstract mixin class $FetchingDetailsFailedCopyWith<$Res> implements $ShareBookStateCopyWith<$Res> {
  factory $FetchingDetailsFailedCopyWith(FetchingDetailsFailed value, $Res Function(FetchingDetailsFailed) _then) = _$FetchingDetailsFailedCopyWithImpl;
@useResult
$Res call({
 String cause
});




}
/// @nodoc
class _$FetchingDetailsFailedCopyWithImpl<$Res>
    implements $FetchingDetailsFailedCopyWith<$Res> {
  _$FetchingDetailsFailedCopyWithImpl(this._self, this._then);

  final FetchingDetailsFailed _self;
  final $Res Function(FetchingDetailsFailed) _then;

/// Create a copy of ShareBookState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? cause = null,}) {
  return _then(FetchingDetailsFailed(
cause: null == cause ? _self.cause : cause // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
