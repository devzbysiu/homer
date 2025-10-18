// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'books_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BooksEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BooksEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BooksEvent()';
}


}

/// @nodoc
class $BooksEventCopyWith<$Res>  {
$BooksEventCopyWith(BooksEvent _, $Res Function(BooksEvent) __);
}


/// Adds pattern-matching-related methods to [BooksEvent].
extension BooksEventPatterns on BooksEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( SaveBook value)?  saveBook,TResult Function( BookSwiped value)?  bookSwiped,TResult Function( RefreshBooksList value)?  refreshBooksList,TResult Function( TagToggled value)?  tagToggled,TResult Function( BooksFiltered value)?  booksFiltered,TResult Function( BookSaved value)?  bookSaved,required TResult orElse(),}){
final _that = this;
switch (_that) {
case SaveBook() when saveBook != null:
return saveBook(_that);case BookSwiped() when bookSwiped != null:
return bookSwiped(_that);case RefreshBooksList() when refreshBooksList != null:
return refreshBooksList(_that);case TagToggled() when tagToggled != null:
return tagToggled(_that);case BooksFiltered() when booksFiltered != null:
return booksFiltered(_that);case BookSaved() when bookSaved != null:
return bookSaved(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( SaveBook value)  saveBook,required TResult Function( BookSwiped value)  bookSwiped,required TResult Function( RefreshBooksList value)  refreshBooksList,required TResult Function( TagToggled value)  tagToggled,required TResult Function( BooksFiltered value)  booksFiltered,required TResult Function( BookSaved value)  bookSaved,}){
final _that = this;
switch (_that) {
case SaveBook():
return saveBook(_that);case BookSwiped():
return bookSwiped(_that);case RefreshBooksList():
return refreshBooksList(_that);case TagToggled():
return tagToggled(_that);case BooksFiltered():
return booksFiltered(_that);case BookSaved():
return bookSaved(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( SaveBook value)?  saveBook,TResult? Function( BookSwiped value)?  bookSwiped,TResult? Function( RefreshBooksList value)?  refreshBooksList,TResult? Function( TagToggled value)?  tagToggled,TResult? Function( BooksFiltered value)?  booksFiltered,TResult? Function( BookSaved value)?  bookSaved,}){
final _that = this;
switch (_that) {
case SaveBook() when saveBook != null:
return saveBook(_that);case BookSwiped() when bookSwiped != null:
return bookSwiped(_that);case RefreshBooksList() when refreshBooksList != null:
return refreshBooksList(_that);case TagToggled() when tagToggled != null:
return tagToggled(_that);case BooksFiltered() when booksFiltered != null:
return booksFiltered(_that);case BookSaved() when bookSaved != null:
return bookSaved(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( Book book,  BookState bookState,  List<Tag> selectedTags)?  saveBook,TResult Function( Book book,  Swiped dir)?  bookSwiped,TResult Function()?  refreshBooksList,TResult Function( Book book,  Tag tag)?  tagToggled,TResult Function( String query)?  booksFiltered,TResult Function()?  bookSaved,required TResult orElse(),}) {final _that = this;
switch (_that) {
case SaveBook() when saveBook != null:
return saveBook(_that.book,_that.bookState,_that.selectedTags);case BookSwiped() when bookSwiped != null:
return bookSwiped(_that.book,_that.dir);case RefreshBooksList() when refreshBooksList != null:
return refreshBooksList();case TagToggled() when tagToggled != null:
return tagToggled(_that.book,_that.tag);case BooksFiltered() when booksFiltered != null:
return booksFiltered(_that.query);case BookSaved() when bookSaved != null:
return bookSaved();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( Book book,  BookState bookState,  List<Tag> selectedTags)  saveBook,required TResult Function( Book book,  Swiped dir)  bookSwiped,required TResult Function()  refreshBooksList,required TResult Function( Book book,  Tag tag)  tagToggled,required TResult Function( String query)  booksFiltered,required TResult Function()  bookSaved,}) {final _that = this;
switch (_that) {
case SaveBook():
return saveBook(_that.book,_that.bookState,_that.selectedTags);case BookSwiped():
return bookSwiped(_that.book,_that.dir);case RefreshBooksList():
return refreshBooksList();case TagToggled():
return tagToggled(_that.book,_that.tag);case BooksFiltered():
return booksFiltered(_that.query);case BookSaved():
return bookSaved();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( Book book,  BookState bookState,  List<Tag> selectedTags)?  saveBook,TResult? Function( Book book,  Swiped dir)?  bookSwiped,TResult? Function()?  refreshBooksList,TResult? Function( Book book,  Tag tag)?  tagToggled,TResult? Function( String query)?  booksFiltered,TResult? Function()?  bookSaved,}) {final _that = this;
switch (_that) {
case SaveBook() when saveBook != null:
return saveBook(_that.book,_that.bookState,_that.selectedTags);case BookSwiped() when bookSwiped != null:
return bookSwiped(_that.book,_that.dir);case RefreshBooksList() when refreshBooksList != null:
return refreshBooksList();case TagToggled() when tagToggled != null:
return tagToggled(_that.book,_that.tag);case BooksFiltered() when booksFiltered != null:
return booksFiltered(_that.query);case BookSaved() when bookSaved != null:
return bookSaved();case _:
  return null;

}
}

}

/// @nodoc


class SaveBook implements BooksEvent {
  const SaveBook({required this.book, required this.bookState, required final  List<Tag> selectedTags}): _selectedTags = selectedTags;
  

 final  Book book;
 final  BookState bookState;
 final  List<Tag> _selectedTags;
 List<Tag> get selectedTags {
  if (_selectedTags is EqualUnmodifiableListView) return _selectedTags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_selectedTags);
}


/// Create a copy of BooksEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SaveBookCopyWith<SaveBook> get copyWith => _$SaveBookCopyWithImpl<SaveBook>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SaveBook&&(identical(other.book, book) || other.book == book)&&(identical(other.bookState, bookState) || other.bookState == bookState)&&const DeepCollectionEquality().equals(other._selectedTags, _selectedTags));
}


@override
int get hashCode => Object.hash(runtimeType,book,bookState,const DeepCollectionEquality().hash(_selectedTags));

@override
String toString() {
  return 'BooksEvent.saveBook(book: $book, bookState: $bookState, selectedTags: $selectedTags)';
}


}

/// @nodoc
abstract mixin class $SaveBookCopyWith<$Res> implements $BooksEventCopyWith<$Res> {
  factory $SaveBookCopyWith(SaveBook value, $Res Function(SaveBook) _then) = _$SaveBookCopyWithImpl;
@useResult
$Res call({
 Book book, BookState bookState, List<Tag> selectedTags
});


$BookCopyWith<$Res> get book;

}
/// @nodoc
class _$SaveBookCopyWithImpl<$Res>
    implements $SaveBookCopyWith<$Res> {
  _$SaveBookCopyWithImpl(this._self, this._then);

  final SaveBook _self;
  final $Res Function(SaveBook) _then;

/// Create a copy of BooksEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? book = null,Object? bookState = null,Object? selectedTags = null,}) {
  return _then(SaveBook(
book: null == book ? _self.book : book // ignore: cast_nullable_to_non_nullable
as Book,bookState: null == bookState ? _self.bookState : bookState // ignore: cast_nullable_to_non_nullable
as BookState,selectedTags: null == selectedTags ? _self._selectedTags : selectedTags // ignore: cast_nullable_to_non_nullable
as List<Tag>,
  ));
}

/// Create a copy of BooksEvent
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


class BookSwiped implements BooksEvent {
  const BookSwiped(this.book, this.dir);
  

 final  Book book;
 final  Swiped dir;

/// Create a copy of BooksEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookSwipedCopyWith<BookSwiped> get copyWith => _$BookSwipedCopyWithImpl<BookSwiped>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookSwiped&&(identical(other.book, book) || other.book == book)&&(identical(other.dir, dir) || other.dir == dir));
}


@override
int get hashCode => Object.hash(runtimeType,book,dir);

@override
String toString() {
  return 'BooksEvent.bookSwiped(book: $book, dir: $dir)';
}


}

/// @nodoc
abstract mixin class $BookSwipedCopyWith<$Res> implements $BooksEventCopyWith<$Res> {
  factory $BookSwipedCopyWith(BookSwiped value, $Res Function(BookSwiped) _then) = _$BookSwipedCopyWithImpl;
@useResult
$Res call({
 Book book, Swiped dir
});


$BookCopyWith<$Res> get book;

}
/// @nodoc
class _$BookSwipedCopyWithImpl<$Res>
    implements $BookSwipedCopyWith<$Res> {
  _$BookSwipedCopyWithImpl(this._self, this._then);

  final BookSwiped _self;
  final $Res Function(BookSwiped) _then;

/// Create a copy of BooksEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? book = null,Object? dir = null,}) {
  return _then(BookSwiped(
null == book ? _self.book : book // ignore: cast_nullable_to_non_nullable
as Book,null == dir ? _self.dir : dir // ignore: cast_nullable_to_non_nullable
as Swiped,
  ));
}

/// Create a copy of BooksEvent
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


class RefreshBooksList implements BooksEvent {
  const RefreshBooksList();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RefreshBooksList);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BooksEvent.refreshBooksList()';
}


}




/// @nodoc


class TagToggled implements BooksEvent {
  const TagToggled({required this.book, required this.tag});
  

 final  Book book;
 final  Tag tag;

/// Create a copy of BooksEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TagToggledCopyWith<TagToggled> get copyWith => _$TagToggledCopyWithImpl<TagToggled>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TagToggled&&(identical(other.book, book) || other.book == book)&&(identical(other.tag, tag) || other.tag == tag));
}


@override
int get hashCode => Object.hash(runtimeType,book,tag);

@override
String toString() {
  return 'BooksEvent.tagToggled(book: $book, tag: $tag)';
}


}

/// @nodoc
abstract mixin class $TagToggledCopyWith<$Res> implements $BooksEventCopyWith<$Res> {
  factory $TagToggledCopyWith(TagToggled value, $Res Function(TagToggled) _then) = _$TagToggledCopyWithImpl;
@useResult
$Res call({
 Book book, Tag tag
});


$BookCopyWith<$Res> get book;$TagCopyWith<$Res> get tag;

}
/// @nodoc
class _$TagToggledCopyWithImpl<$Res>
    implements $TagToggledCopyWith<$Res> {
  _$TagToggledCopyWithImpl(this._self, this._then);

  final TagToggled _self;
  final $Res Function(TagToggled) _then;

/// Create a copy of BooksEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? book = null,Object? tag = null,}) {
  return _then(TagToggled(
book: null == book ? _self.book : book // ignore: cast_nullable_to_non_nullable
as Book,tag: null == tag ? _self.tag : tag // ignore: cast_nullable_to_non_nullable
as Tag,
  ));
}

/// Create a copy of BooksEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BookCopyWith<$Res> get book {
  
  return $BookCopyWith<$Res>(_self.book, (value) {
    return _then(_self.copyWith(book: value));
  });
}/// Create a copy of BooksEvent
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


class BooksFiltered implements BooksEvent {
  const BooksFiltered(this.query);
  

 final  String query;

/// Create a copy of BooksEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BooksFilteredCopyWith<BooksFiltered> get copyWith => _$BooksFilteredCopyWithImpl<BooksFiltered>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BooksFiltered&&(identical(other.query, query) || other.query == query));
}


@override
int get hashCode => Object.hash(runtimeType,query);

@override
String toString() {
  return 'BooksEvent.booksFiltered(query: $query)';
}


}

/// @nodoc
abstract mixin class $BooksFilteredCopyWith<$Res> implements $BooksEventCopyWith<$Res> {
  factory $BooksFilteredCopyWith(BooksFiltered value, $Res Function(BooksFiltered) _then) = _$BooksFilteredCopyWithImpl;
@useResult
$Res call({
 String query
});




}
/// @nodoc
class _$BooksFilteredCopyWithImpl<$Res>
    implements $BooksFilteredCopyWith<$Res> {
  _$BooksFilteredCopyWithImpl(this._self, this._then);

  final BooksFiltered _self;
  final $Res Function(BooksFiltered) _then;

/// Create a copy of BooksEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? query = null,}) {
  return _then(BooksFiltered(
null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class BookSaved implements BooksEvent {
  const BookSaved();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookSaved);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BooksEvent.bookSaved()';
}


}




// dart format on
