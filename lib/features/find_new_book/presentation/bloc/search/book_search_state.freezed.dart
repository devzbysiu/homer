// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'book_search_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BookSearchState {

 List<Book> get foundBooks; Option<Book> get pickedBook; BookSearchMode get mode; Option<String> get searchFailureCause;
/// Create a copy of BookSearchState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookSearchStateCopyWith<BookSearchState> get copyWith => _$BookSearchStateCopyWithImpl<BookSearchState>(this as BookSearchState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookSearchState&&const DeepCollectionEquality().equals(other.foundBooks, foundBooks)&&(identical(other.pickedBook, pickedBook) || other.pickedBook == pickedBook)&&(identical(other.mode, mode) || other.mode == mode)&&(identical(other.searchFailureCause, searchFailureCause) || other.searchFailureCause == searchFailureCause));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(foundBooks),pickedBook,mode,searchFailureCause);

@override
String toString() {
  return 'BookSearchState(foundBooks: $foundBooks, pickedBook: $pickedBook, mode: $mode, searchFailureCause: $searchFailureCause)';
}


}

/// @nodoc
abstract mixin class $BookSearchStateCopyWith<$Res>  {
  factory $BookSearchStateCopyWith(BookSearchState value, $Res Function(BookSearchState) _then) = _$BookSearchStateCopyWithImpl;
@useResult
$Res call({
 List<Book> foundBooks, Option<Book> pickedBook, BookSearchMode mode, Option<String> searchFailureCause
});




}
/// @nodoc
class _$BookSearchStateCopyWithImpl<$Res>
    implements $BookSearchStateCopyWith<$Res> {
  _$BookSearchStateCopyWithImpl(this._self, this._then);

  final BookSearchState _self;
  final $Res Function(BookSearchState) _then;

/// Create a copy of BookSearchState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? foundBooks = null,Object? pickedBook = null,Object? mode = null,Object? searchFailureCause = null,}) {
  return _then(_self.copyWith(
foundBooks: null == foundBooks ? _self.foundBooks : foundBooks // ignore: cast_nullable_to_non_nullable
as List<Book>,pickedBook: null == pickedBook ? _self.pickedBook : pickedBook // ignore: cast_nullable_to_non_nullable
as Option<Book>,mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as BookSearchMode,searchFailureCause: null == searchFailureCause ? _self.searchFailureCause : searchFailureCause // ignore: cast_nullable_to_non_nullable
as Option<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [BookSearchState].
extension BookSearchStatePatterns on BookSearchState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BookSearchState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BookSearchState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BookSearchState value)  $default,){
final _that = this;
switch (_that) {
case _BookSearchState():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BookSearchState value)?  $default,){
final _that = this;
switch (_that) {
case _BookSearchState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Book> foundBooks,  Option<Book> pickedBook,  BookSearchMode mode,  Option<String> searchFailureCause)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BookSearchState() when $default != null:
return $default(_that.foundBooks,_that.pickedBook,_that.mode,_that.searchFailureCause);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Book> foundBooks,  Option<Book> pickedBook,  BookSearchMode mode,  Option<String> searchFailureCause)  $default,) {final _that = this;
switch (_that) {
case _BookSearchState():
return $default(_that.foundBooks,_that.pickedBook,_that.mode,_that.searchFailureCause);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Book> foundBooks,  Option<Book> pickedBook,  BookSearchMode mode,  Option<String> searchFailureCause)?  $default,) {final _that = this;
switch (_that) {
case _BookSearchState() when $default != null:
return $default(_that.foundBooks,_that.pickedBook,_that.mode,_that.searchFailureCause);case _:
  return null;

}
}

}

/// @nodoc


class _BookSearchState extends BookSearchState {
  const _BookSearchState({final  List<Book> foundBooks = const <Book>[], this.pickedBook = const None<Book>(), this.mode = BookSearchMode.initial, this.searchFailureCause = const None<String>()}): _foundBooks = foundBooks,super._();
  

 final  List<Book> _foundBooks;
@override@JsonKey() List<Book> get foundBooks {
  if (_foundBooks is EqualUnmodifiableListView) return _foundBooks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_foundBooks);
}

@override@JsonKey() final  Option<Book> pickedBook;
@override@JsonKey() final  BookSearchMode mode;
@override@JsonKey() final  Option<String> searchFailureCause;

/// Create a copy of BookSearchState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookSearchStateCopyWith<_BookSearchState> get copyWith => __$BookSearchStateCopyWithImpl<_BookSearchState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookSearchState&&const DeepCollectionEquality().equals(other._foundBooks, _foundBooks)&&(identical(other.pickedBook, pickedBook) || other.pickedBook == pickedBook)&&(identical(other.mode, mode) || other.mode == mode)&&(identical(other.searchFailureCause, searchFailureCause) || other.searchFailureCause == searchFailureCause));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_foundBooks),pickedBook,mode,searchFailureCause);

@override
String toString() {
  return 'BookSearchState(foundBooks: $foundBooks, pickedBook: $pickedBook, mode: $mode, searchFailureCause: $searchFailureCause)';
}


}

/// @nodoc
abstract mixin class _$BookSearchStateCopyWith<$Res> implements $BookSearchStateCopyWith<$Res> {
  factory _$BookSearchStateCopyWith(_BookSearchState value, $Res Function(_BookSearchState) _then) = __$BookSearchStateCopyWithImpl;
@override @useResult
$Res call({
 List<Book> foundBooks, Option<Book> pickedBook, BookSearchMode mode, Option<String> searchFailureCause
});




}
/// @nodoc
class __$BookSearchStateCopyWithImpl<$Res>
    implements _$BookSearchStateCopyWith<$Res> {
  __$BookSearchStateCopyWithImpl(this._self, this._then);

  final _BookSearchState _self;
  final $Res Function(_BookSearchState) _then;

/// Create a copy of BookSearchState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? foundBooks = null,Object? pickedBook = null,Object? mode = null,Object? searchFailureCause = null,}) {
  return _then(_BookSearchState(
foundBooks: null == foundBooks ? _self._foundBooks : foundBooks // ignore: cast_nullable_to_non_nullable
as List<Book>,pickedBook: null == pickedBook ? _self.pickedBook : pickedBook // ignore: cast_nullable_to_non_nullable
as Option<Book>,mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as BookSearchMode,searchFailureCause: null == searchFailureCause ? _self.searchFailureCause : searchFailureCause // ignore: cast_nullable_to_non_nullable
as Option<String>,
  ));
}


}

// dart format on
