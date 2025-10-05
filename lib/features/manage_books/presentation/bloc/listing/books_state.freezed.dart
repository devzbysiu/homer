// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'books_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BooksState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BooksState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BooksState()';
}


}

/// @nodoc
class $BooksStateCopyWith<$Res>  {
$BooksStateCopyWith(BooksState _, $Res Function(BooksState) __);
}


/// Adds pattern-matching-related methods to [BooksState].
extension BooksStatePatterns on BooksState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Initial value)?  initial,TResult Function( BooksLoaded value)?  booksLoaded,TResult Function( LoadingFailed value)?  loadingFailed,TResult Function( AddingBookFailed value)?  addingBookFailed,TResult Function( UpdatingBookFailed value)?  updatingBookFailed,required TResult orElse(),}){
final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that);case BooksLoaded() when booksLoaded != null:
return booksLoaded(_that);case LoadingFailed() when loadingFailed != null:
return loadingFailed(_that);case AddingBookFailed() when addingBookFailed != null:
return addingBookFailed(_that);case UpdatingBookFailed() when updatingBookFailed != null:
return updatingBookFailed(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Initial value)  initial,required TResult Function( BooksLoaded value)  booksLoaded,required TResult Function( LoadingFailed value)  loadingFailed,required TResult Function( AddingBookFailed value)  addingBookFailed,required TResult Function( UpdatingBookFailed value)  updatingBookFailed,}){
final _that = this;
switch (_that) {
case Initial():
return initial(_that);case BooksLoaded():
return booksLoaded(_that);case LoadingFailed():
return loadingFailed(_that);case AddingBookFailed():
return addingBookFailed(_that);case UpdatingBookFailed():
return updatingBookFailed(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Initial value)?  initial,TResult? Function( BooksLoaded value)?  booksLoaded,TResult? Function( LoadingFailed value)?  loadingFailed,TResult? Function( AddingBookFailed value)?  addingBookFailed,TResult? Function( UpdatingBookFailed value)?  updatingBookFailed,}){
final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that);case BooksLoaded() when booksLoaded != null:
return booksLoaded(_that);case LoadingFailed() when loadingFailed != null:
return loadingFailed(_that);case AddingBookFailed() when addingBookFailed != null:
return addingBookFailed(_that);case UpdatingBookFailed() when updatingBookFailed != null:
return updatingBookFailed(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( List<Book> books)?  initial,TResult Function( List<Book> books)?  booksLoaded,TResult Function()?  loadingFailed,TResult Function()?  addingBookFailed,TResult Function()?  updatingBookFailed,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that.books);case BooksLoaded() when booksLoaded != null:
return booksLoaded(_that.books);case LoadingFailed() when loadingFailed != null:
return loadingFailed();case AddingBookFailed() when addingBookFailed != null:
return addingBookFailed();case UpdatingBookFailed() when updatingBookFailed != null:
return updatingBookFailed();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( List<Book> books)  initial,required TResult Function( List<Book> books)  booksLoaded,required TResult Function()  loadingFailed,required TResult Function()  addingBookFailed,required TResult Function()  updatingBookFailed,}) {final _that = this;
switch (_that) {
case Initial():
return initial(_that.books);case BooksLoaded():
return booksLoaded(_that.books);case LoadingFailed():
return loadingFailed();case AddingBookFailed():
return addingBookFailed();case UpdatingBookFailed():
return updatingBookFailed();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( List<Book> books)?  initial,TResult? Function( List<Book> books)?  booksLoaded,TResult? Function()?  loadingFailed,TResult? Function()?  addingBookFailed,TResult? Function()?  updatingBookFailed,}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that.books);case BooksLoaded() when booksLoaded != null:
return booksLoaded(_that.books);case LoadingFailed() when loadingFailed != null:
return loadingFailed();case AddingBookFailed() when addingBookFailed != null:
return addingBookFailed();case UpdatingBookFailed() when updatingBookFailed != null:
return updatingBookFailed();case _:
  return null;

}
}

}

/// @nodoc


class Initial extends BooksState {
  const Initial({final  List<Book> books = const <Book>[]}): _books = books,super._();
  

 final  List<Book> _books;
@JsonKey() List<Book> get books {
  if (_books is EqualUnmodifiableListView) return _books;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_books);
}


/// Create a copy of BooksState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InitialCopyWith<Initial> get copyWith => _$InitialCopyWithImpl<Initial>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Initial&&const DeepCollectionEquality().equals(other._books, _books));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_books));

@override
String toString() {
  return 'BooksState.initial(books: $books)';
}


}

/// @nodoc
abstract mixin class $InitialCopyWith<$Res> implements $BooksStateCopyWith<$Res> {
  factory $InitialCopyWith(Initial value, $Res Function(Initial) _then) = _$InitialCopyWithImpl;
@useResult
$Res call({
 List<Book> books
});




}
/// @nodoc
class _$InitialCopyWithImpl<$Res>
    implements $InitialCopyWith<$Res> {
  _$InitialCopyWithImpl(this._self, this._then);

  final Initial _self;
  final $Res Function(Initial) _then;

/// Create a copy of BooksState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? books = null,}) {
  return _then(Initial(
books: null == books ? _self._books : books // ignore: cast_nullable_to_non_nullable
as List<Book>,
  ));
}


}

/// @nodoc


class BooksLoaded extends BooksState {
  const BooksLoaded(final  List<Book> books): _books = books,super._();
  

 final  List<Book> _books;
 List<Book> get books {
  if (_books is EqualUnmodifiableListView) return _books;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_books);
}


/// Create a copy of BooksState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BooksLoadedCopyWith<BooksLoaded> get copyWith => _$BooksLoadedCopyWithImpl<BooksLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BooksLoaded&&const DeepCollectionEquality().equals(other._books, _books));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_books));

@override
String toString() {
  return 'BooksState.booksLoaded(books: $books)';
}


}

/// @nodoc
abstract mixin class $BooksLoadedCopyWith<$Res> implements $BooksStateCopyWith<$Res> {
  factory $BooksLoadedCopyWith(BooksLoaded value, $Res Function(BooksLoaded) _then) = _$BooksLoadedCopyWithImpl;
@useResult
$Res call({
 List<Book> books
});




}
/// @nodoc
class _$BooksLoadedCopyWithImpl<$Res>
    implements $BooksLoadedCopyWith<$Res> {
  _$BooksLoadedCopyWithImpl(this._self, this._then);

  final BooksLoaded _self;
  final $Res Function(BooksLoaded) _then;

/// Create a copy of BooksState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? books = null,}) {
  return _then(BooksLoaded(
null == books ? _self._books : books // ignore: cast_nullable_to_non_nullable
as List<Book>,
  ));
}


}

/// @nodoc


class LoadingFailed extends BooksState {
  const LoadingFailed(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadingFailed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BooksState.loadingFailed()';
}


}




/// @nodoc


class AddingBookFailed extends BooksState {
  const AddingBookFailed(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddingBookFailed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BooksState.addingBookFailed()';
}


}




/// @nodoc


class UpdatingBookFailed extends BooksState {
  const UpdatingBookFailed(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdatingBookFailed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BooksState.updatingBookFailed()';
}


}




// dart format on
