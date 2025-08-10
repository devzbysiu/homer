// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'books_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BooksEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            Book book, BookState bookState, List<Tag> selectedTags)
        saveBook,
    required TResult Function(Book book) bookSwipedRight,
    required TResult Function(Book book) bookSwipedLeft,
    required TResult Function() refreshBooksList,
    required TResult Function(Book book, Tag tag) tagToggled,
    required TResult Function(String query) booksFiltered,
    required TResult Function() bookSaved,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Book book, BookState bookState, List<Tag> selectedTags)?
        saveBook,
    TResult? Function(Book book)? bookSwipedRight,
    TResult? Function(Book book)? bookSwipedLeft,
    TResult? Function()? refreshBooksList,
    TResult? Function(Book book, Tag tag)? tagToggled,
    TResult? Function(String query)? booksFiltered,
    TResult? Function()? bookSaved,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Book book, BookState bookState, List<Tag> selectedTags)?
        saveBook,
    TResult Function(Book book)? bookSwipedRight,
    TResult Function(Book book)? bookSwipedLeft,
    TResult Function()? refreshBooksList,
    TResult Function(Book book, Tag tag)? tagToggled,
    TResult Function(String query)? booksFiltered,
    TResult Function()? bookSaved,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SaveBook value) saveBook,
    required TResult Function(BookSwipedRight value) bookSwipedRight,
    required TResult Function(BookSwipedLeft value) bookSwipedLeft,
    required TResult Function(RefreshBooksList value) refreshBooksList,
    required TResult Function(TagToggled value) tagToggled,
    required TResult Function(BooksFiltered value) booksFiltered,
    required TResult Function(BookSaved value) bookSaved,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SaveBook value)? saveBook,
    TResult? Function(BookSwipedRight value)? bookSwipedRight,
    TResult? Function(BookSwipedLeft value)? bookSwipedLeft,
    TResult? Function(RefreshBooksList value)? refreshBooksList,
    TResult? Function(TagToggled value)? tagToggled,
    TResult? Function(BooksFiltered value)? booksFiltered,
    TResult? Function(BookSaved value)? bookSaved,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SaveBook value)? saveBook,
    TResult Function(BookSwipedRight value)? bookSwipedRight,
    TResult Function(BookSwipedLeft value)? bookSwipedLeft,
    TResult Function(RefreshBooksList value)? refreshBooksList,
    TResult Function(TagToggled value)? tagToggled,
    TResult Function(BooksFiltered value)? booksFiltered,
    TResult Function(BookSaved value)? bookSaved,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BooksEventCopyWith<$Res> {
  factory $BooksEventCopyWith(
          BooksEvent value, $Res Function(BooksEvent) then) =
      _$BooksEventCopyWithImpl<$Res, BooksEvent>;
}

/// @nodoc
class _$BooksEventCopyWithImpl<$Res, $Val extends BooksEvent>
    implements $BooksEventCopyWith<$Res> {
  _$BooksEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BooksEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$SaveBookImplCopyWith<$Res> {
  factory _$$SaveBookImplCopyWith(
          _$SaveBookImpl value, $Res Function(_$SaveBookImpl) then) =
      __$$SaveBookImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Book book, BookState bookState, List<Tag> selectedTags});
}

/// @nodoc
class __$$SaveBookImplCopyWithImpl<$Res>
    extends _$BooksEventCopyWithImpl<$Res, _$SaveBookImpl>
    implements _$$SaveBookImplCopyWith<$Res> {
  __$$SaveBookImplCopyWithImpl(
      _$SaveBookImpl _value, $Res Function(_$SaveBookImpl) _then)
      : super(_value, _then);

  /// Create a copy of BooksEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? book = null,
    Object? bookState = null,
    Object? selectedTags = null,
  }) {
    return _then(_$SaveBookImpl(
      book: null == book
          ? _value.book
          : book // ignore: cast_nullable_to_non_nullable
              as Book,
      bookState: null == bookState
          ? _value.bookState
          : bookState // ignore: cast_nullable_to_non_nullable
              as BookState,
      selectedTags: null == selectedTags
          ? _value._selectedTags
          : selectedTags // ignore: cast_nullable_to_non_nullable
              as List<Tag>,
    ));
  }
}

/// @nodoc

class _$SaveBookImpl implements SaveBook {
  const _$SaveBookImpl(
      {required this.book,
      required this.bookState,
      required final List<Tag> selectedTags})
      : _selectedTags = selectedTags;

  @override
  final Book book;
  @override
  final BookState bookState;
  final List<Tag> _selectedTags;
  @override
  List<Tag> get selectedTags {
    if (_selectedTags is EqualUnmodifiableListView) return _selectedTags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectedTags);
  }

  @override
  String toString() {
    return 'BooksEvent.saveBook(book: $book, bookState: $bookState, selectedTags: $selectedTags)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SaveBookImpl &&
            (identical(other.book, book) || other.book == book) &&
            (identical(other.bookState, bookState) ||
                other.bookState == bookState) &&
            const DeepCollectionEquality()
                .equals(other._selectedTags, _selectedTags));
  }

  @override
  int get hashCode => Object.hash(runtimeType, book, bookState,
      const DeepCollectionEquality().hash(_selectedTags));

  /// Create a copy of BooksEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SaveBookImplCopyWith<_$SaveBookImpl> get copyWith =>
      __$$SaveBookImplCopyWithImpl<_$SaveBookImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            Book book, BookState bookState, List<Tag> selectedTags)
        saveBook,
    required TResult Function(Book book) bookSwipedRight,
    required TResult Function(Book book) bookSwipedLeft,
    required TResult Function() refreshBooksList,
    required TResult Function(Book book, Tag tag) tagToggled,
    required TResult Function(String query) booksFiltered,
    required TResult Function() bookSaved,
  }) {
    return saveBook(book, bookState, selectedTags);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Book book, BookState bookState, List<Tag> selectedTags)?
        saveBook,
    TResult? Function(Book book)? bookSwipedRight,
    TResult? Function(Book book)? bookSwipedLeft,
    TResult? Function()? refreshBooksList,
    TResult? Function(Book book, Tag tag)? tagToggled,
    TResult? Function(String query)? booksFiltered,
    TResult? Function()? bookSaved,
  }) {
    return saveBook?.call(book, bookState, selectedTags);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Book book, BookState bookState, List<Tag> selectedTags)?
        saveBook,
    TResult Function(Book book)? bookSwipedRight,
    TResult Function(Book book)? bookSwipedLeft,
    TResult Function()? refreshBooksList,
    TResult Function(Book book, Tag tag)? tagToggled,
    TResult Function(String query)? booksFiltered,
    TResult Function()? bookSaved,
    required TResult orElse(),
  }) {
    if (saveBook != null) {
      return saveBook(book, bookState, selectedTags);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SaveBook value) saveBook,
    required TResult Function(BookSwipedRight value) bookSwipedRight,
    required TResult Function(BookSwipedLeft value) bookSwipedLeft,
    required TResult Function(RefreshBooksList value) refreshBooksList,
    required TResult Function(TagToggled value) tagToggled,
    required TResult Function(BooksFiltered value) booksFiltered,
    required TResult Function(BookSaved value) bookSaved,
  }) {
    return saveBook(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SaveBook value)? saveBook,
    TResult? Function(BookSwipedRight value)? bookSwipedRight,
    TResult? Function(BookSwipedLeft value)? bookSwipedLeft,
    TResult? Function(RefreshBooksList value)? refreshBooksList,
    TResult? Function(TagToggled value)? tagToggled,
    TResult? Function(BooksFiltered value)? booksFiltered,
    TResult? Function(BookSaved value)? bookSaved,
  }) {
    return saveBook?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SaveBook value)? saveBook,
    TResult Function(BookSwipedRight value)? bookSwipedRight,
    TResult Function(BookSwipedLeft value)? bookSwipedLeft,
    TResult Function(RefreshBooksList value)? refreshBooksList,
    TResult Function(TagToggled value)? tagToggled,
    TResult Function(BooksFiltered value)? booksFiltered,
    TResult Function(BookSaved value)? bookSaved,
    required TResult orElse(),
  }) {
    if (saveBook != null) {
      return saveBook(this);
    }
    return orElse();
  }
}

abstract class SaveBook implements BooksEvent {
  const factory SaveBook(
      {required final Book book,
      required final BookState bookState,
      required final List<Tag> selectedTags}) = _$SaveBookImpl;

  Book get book;
  BookState get bookState;
  List<Tag> get selectedTags;

  /// Create a copy of BooksEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SaveBookImplCopyWith<_$SaveBookImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BookSwipedRightImplCopyWith<$Res> {
  factory _$$BookSwipedRightImplCopyWith(_$BookSwipedRightImpl value,
          $Res Function(_$BookSwipedRightImpl) then) =
      __$$BookSwipedRightImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Book book});
}

/// @nodoc
class __$$BookSwipedRightImplCopyWithImpl<$Res>
    extends _$BooksEventCopyWithImpl<$Res, _$BookSwipedRightImpl>
    implements _$$BookSwipedRightImplCopyWith<$Res> {
  __$$BookSwipedRightImplCopyWithImpl(
      _$BookSwipedRightImpl _value, $Res Function(_$BookSwipedRightImpl) _then)
      : super(_value, _then);

  /// Create a copy of BooksEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? book = null,
  }) {
    return _then(_$BookSwipedRightImpl(
      null == book
          ? _value.book
          : book // ignore: cast_nullable_to_non_nullable
              as Book,
    ));
  }
}

/// @nodoc

class _$BookSwipedRightImpl implements BookSwipedRight {
  const _$BookSwipedRightImpl(this.book);

  @override
  final Book book;

  @override
  String toString() {
    return 'BooksEvent.bookSwipedRight(book: $book)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookSwipedRightImpl &&
            (identical(other.book, book) || other.book == book));
  }

  @override
  int get hashCode => Object.hash(runtimeType, book);

  /// Create a copy of BooksEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BookSwipedRightImplCopyWith<_$BookSwipedRightImpl> get copyWith =>
      __$$BookSwipedRightImplCopyWithImpl<_$BookSwipedRightImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            Book book, BookState bookState, List<Tag> selectedTags)
        saveBook,
    required TResult Function(Book book) bookSwipedRight,
    required TResult Function(Book book) bookSwipedLeft,
    required TResult Function() refreshBooksList,
    required TResult Function(Book book, Tag tag) tagToggled,
    required TResult Function(String query) booksFiltered,
    required TResult Function() bookSaved,
  }) {
    return bookSwipedRight(book);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Book book, BookState bookState, List<Tag> selectedTags)?
        saveBook,
    TResult? Function(Book book)? bookSwipedRight,
    TResult? Function(Book book)? bookSwipedLeft,
    TResult? Function()? refreshBooksList,
    TResult? Function(Book book, Tag tag)? tagToggled,
    TResult? Function(String query)? booksFiltered,
    TResult? Function()? bookSaved,
  }) {
    return bookSwipedRight?.call(book);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Book book, BookState bookState, List<Tag> selectedTags)?
        saveBook,
    TResult Function(Book book)? bookSwipedRight,
    TResult Function(Book book)? bookSwipedLeft,
    TResult Function()? refreshBooksList,
    TResult Function(Book book, Tag tag)? tagToggled,
    TResult Function(String query)? booksFiltered,
    TResult Function()? bookSaved,
    required TResult orElse(),
  }) {
    if (bookSwipedRight != null) {
      return bookSwipedRight(book);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SaveBook value) saveBook,
    required TResult Function(BookSwipedRight value) bookSwipedRight,
    required TResult Function(BookSwipedLeft value) bookSwipedLeft,
    required TResult Function(RefreshBooksList value) refreshBooksList,
    required TResult Function(TagToggled value) tagToggled,
    required TResult Function(BooksFiltered value) booksFiltered,
    required TResult Function(BookSaved value) bookSaved,
  }) {
    return bookSwipedRight(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SaveBook value)? saveBook,
    TResult? Function(BookSwipedRight value)? bookSwipedRight,
    TResult? Function(BookSwipedLeft value)? bookSwipedLeft,
    TResult? Function(RefreshBooksList value)? refreshBooksList,
    TResult? Function(TagToggled value)? tagToggled,
    TResult? Function(BooksFiltered value)? booksFiltered,
    TResult? Function(BookSaved value)? bookSaved,
  }) {
    return bookSwipedRight?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SaveBook value)? saveBook,
    TResult Function(BookSwipedRight value)? bookSwipedRight,
    TResult Function(BookSwipedLeft value)? bookSwipedLeft,
    TResult Function(RefreshBooksList value)? refreshBooksList,
    TResult Function(TagToggled value)? tagToggled,
    TResult Function(BooksFiltered value)? booksFiltered,
    TResult Function(BookSaved value)? bookSaved,
    required TResult orElse(),
  }) {
    if (bookSwipedRight != null) {
      return bookSwipedRight(this);
    }
    return orElse();
  }
}

abstract class BookSwipedRight implements BooksEvent {
  const factory BookSwipedRight(final Book book) = _$BookSwipedRightImpl;

  Book get book;

  /// Create a copy of BooksEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BookSwipedRightImplCopyWith<_$BookSwipedRightImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BookSwipedLeftImplCopyWith<$Res> {
  factory _$$BookSwipedLeftImplCopyWith(_$BookSwipedLeftImpl value,
          $Res Function(_$BookSwipedLeftImpl) then) =
      __$$BookSwipedLeftImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Book book});
}

/// @nodoc
class __$$BookSwipedLeftImplCopyWithImpl<$Res>
    extends _$BooksEventCopyWithImpl<$Res, _$BookSwipedLeftImpl>
    implements _$$BookSwipedLeftImplCopyWith<$Res> {
  __$$BookSwipedLeftImplCopyWithImpl(
      _$BookSwipedLeftImpl _value, $Res Function(_$BookSwipedLeftImpl) _then)
      : super(_value, _then);

  /// Create a copy of BooksEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? book = null,
  }) {
    return _then(_$BookSwipedLeftImpl(
      null == book
          ? _value.book
          : book // ignore: cast_nullable_to_non_nullable
              as Book,
    ));
  }
}

/// @nodoc

class _$BookSwipedLeftImpl implements BookSwipedLeft {
  const _$BookSwipedLeftImpl(this.book);

  @override
  final Book book;

  @override
  String toString() {
    return 'BooksEvent.bookSwipedLeft(book: $book)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookSwipedLeftImpl &&
            (identical(other.book, book) || other.book == book));
  }

  @override
  int get hashCode => Object.hash(runtimeType, book);

  /// Create a copy of BooksEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BookSwipedLeftImplCopyWith<_$BookSwipedLeftImpl> get copyWith =>
      __$$BookSwipedLeftImplCopyWithImpl<_$BookSwipedLeftImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            Book book, BookState bookState, List<Tag> selectedTags)
        saveBook,
    required TResult Function(Book book) bookSwipedRight,
    required TResult Function(Book book) bookSwipedLeft,
    required TResult Function() refreshBooksList,
    required TResult Function(Book book, Tag tag) tagToggled,
    required TResult Function(String query) booksFiltered,
    required TResult Function() bookSaved,
  }) {
    return bookSwipedLeft(book);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Book book, BookState bookState, List<Tag> selectedTags)?
        saveBook,
    TResult? Function(Book book)? bookSwipedRight,
    TResult? Function(Book book)? bookSwipedLeft,
    TResult? Function()? refreshBooksList,
    TResult? Function(Book book, Tag tag)? tagToggled,
    TResult? Function(String query)? booksFiltered,
    TResult? Function()? bookSaved,
  }) {
    return bookSwipedLeft?.call(book);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Book book, BookState bookState, List<Tag> selectedTags)?
        saveBook,
    TResult Function(Book book)? bookSwipedRight,
    TResult Function(Book book)? bookSwipedLeft,
    TResult Function()? refreshBooksList,
    TResult Function(Book book, Tag tag)? tagToggled,
    TResult Function(String query)? booksFiltered,
    TResult Function()? bookSaved,
    required TResult orElse(),
  }) {
    if (bookSwipedLeft != null) {
      return bookSwipedLeft(book);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SaveBook value) saveBook,
    required TResult Function(BookSwipedRight value) bookSwipedRight,
    required TResult Function(BookSwipedLeft value) bookSwipedLeft,
    required TResult Function(RefreshBooksList value) refreshBooksList,
    required TResult Function(TagToggled value) tagToggled,
    required TResult Function(BooksFiltered value) booksFiltered,
    required TResult Function(BookSaved value) bookSaved,
  }) {
    return bookSwipedLeft(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SaveBook value)? saveBook,
    TResult? Function(BookSwipedRight value)? bookSwipedRight,
    TResult? Function(BookSwipedLeft value)? bookSwipedLeft,
    TResult? Function(RefreshBooksList value)? refreshBooksList,
    TResult? Function(TagToggled value)? tagToggled,
    TResult? Function(BooksFiltered value)? booksFiltered,
    TResult? Function(BookSaved value)? bookSaved,
  }) {
    return bookSwipedLeft?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SaveBook value)? saveBook,
    TResult Function(BookSwipedRight value)? bookSwipedRight,
    TResult Function(BookSwipedLeft value)? bookSwipedLeft,
    TResult Function(RefreshBooksList value)? refreshBooksList,
    TResult Function(TagToggled value)? tagToggled,
    TResult Function(BooksFiltered value)? booksFiltered,
    TResult Function(BookSaved value)? bookSaved,
    required TResult orElse(),
  }) {
    if (bookSwipedLeft != null) {
      return bookSwipedLeft(this);
    }
    return orElse();
  }
}

abstract class BookSwipedLeft implements BooksEvent {
  const factory BookSwipedLeft(final Book book) = _$BookSwipedLeftImpl;

  Book get book;

  /// Create a copy of BooksEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BookSwipedLeftImplCopyWith<_$BookSwipedLeftImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RefreshBooksListImplCopyWith<$Res> {
  factory _$$RefreshBooksListImplCopyWith(_$RefreshBooksListImpl value,
          $Res Function(_$RefreshBooksListImpl) then) =
      __$$RefreshBooksListImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RefreshBooksListImplCopyWithImpl<$Res>
    extends _$BooksEventCopyWithImpl<$Res, _$RefreshBooksListImpl>
    implements _$$RefreshBooksListImplCopyWith<$Res> {
  __$$RefreshBooksListImplCopyWithImpl(_$RefreshBooksListImpl _value,
      $Res Function(_$RefreshBooksListImpl) _then)
      : super(_value, _then);

  /// Create a copy of BooksEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$RefreshBooksListImpl implements RefreshBooksList {
  const _$RefreshBooksListImpl();

  @override
  String toString() {
    return 'BooksEvent.refreshBooksList()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RefreshBooksListImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            Book book, BookState bookState, List<Tag> selectedTags)
        saveBook,
    required TResult Function(Book book) bookSwipedRight,
    required TResult Function(Book book) bookSwipedLeft,
    required TResult Function() refreshBooksList,
    required TResult Function(Book book, Tag tag) tagToggled,
    required TResult Function(String query) booksFiltered,
    required TResult Function() bookSaved,
  }) {
    return refreshBooksList();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Book book, BookState bookState, List<Tag> selectedTags)?
        saveBook,
    TResult? Function(Book book)? bookSwipedRight,
    TResult? Function(Book book)? bookSwipedLeft,
    TResult? Function()? refreshBooksList,
    TResult? Function(Book book, Tag tag)? tagToggled,
    TResult? Function(String query)? booksFiltered,
    TResult? Function()? bookSaved,
  }) {
    return refreshBooksList?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Book book, BookState bookState, List<Tag> selectedTags)?
        saveBook,
    TResult Function(Book book)? bookSwipedRight,
    TResult Function(Book book)? bookSwipedLeft,
    TResult Function()? refreshBooksList,
    TResult Function(Book book, Tag tag)? tagToggled,
    TResult Function(String query)? booksFiltered,
    TResult Function()? bookSaved,
    required TResult orElse(),
  }) {
    if (refreshBooksList != null) {
      return refreshBooksList();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SaveBook value) saveBook,
    required TResult Function(BookSwipedRight value) bookSwipedRight,
    required TResult Function(BookSwipedLeft value) bookSwipedLeft,
    required TResult Function(RefreshBooksList value) refreshBooksList,
    required TResult Function(TagToggled value) tagToggled,
    required TResult Function(BooksFiltered value) booksFiltered,
    required TResult Function(BookSaved value) bookSaved,
  }) {
    return refreshBooksList(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SaveBook value)? saveBook,
    TResult? Function(BookSwipedRight value)? bookSwipedRight,
    TResult? Function(BookSwipedLeft value)? bookSwipedLeft,
    TResult? Function(RefreshBooksList value)? refreshBooksList,
    TResult? Function(TagToggled value)? tagToggled,
    TResult? Function(BooksFiltered value)? booksFiltered,
    TResult? Function(BookSaved value)? bookSaved,
  }) {
    return refreshBooksList?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SaveBook value)? saveBook,
    TResult Function(BookSwipedRight value)? bookSwipedRight,
    TResult Function(BookSwipedLeft value)? bookSwipedLeft,
    TResult Function(RefreshBooksList value)? refreshBooksList,
    TResult Function(TagToggled value)? tagToggled,
    TResult Function(BooksFiltered value)? booksFiltered,
    TResult Function(BookSaved value)? bookSaved,
    required TResult orElse(),
  }) {
    if (refreshBooksList != null) {
      return refreshBooksList(this);
    }
    return orElse();
  }
}

abstract class RefreshBooksList implements BooksEvent {
  const factory RefreshBooksList() = _$RefreshBooksListImpl;
}

/// @nodoc
abstract class _$$TagToggledImplCopyWith<$Res> {
  factory _$$TagToggledImplCopyWith(
          _$TagToggledImpl value, $Res Function(_$TagToggledImpl) then) =
      __$$TagToggledImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Book book, Tag tag});
}

/// @nodoc
class __$$TagToggledImplCopyWithImpl<$Res>
    extends _$BooksEventCopyWithImpl<$Res, _$TagToggledImpl>
    implements _$$TagToggledImplCopyWith<$Res> {
  __$$TagToggledImplCopyWithImpl(
      _$TagToggledImpl _value, $Res Function(_$TagToggledImpl) _then)
      : super(_value, _then);

  /// Create a copy of BooksEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? book = null,
    Object? tag = null,
  }) {
    return _then(_$TagToggledImpl(
      book: null == book
          ? _value.book
          : book // ignore: cast_nullable_to_non_nullable
              as Book,
      tag: null == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as Tag,
    ));
  }
}

/// @nodoc

class _$TagToggledImpl implements TagToggled {
  const _$TagToggledImpl({required this.book, required this.tag});

  @override
  final Book book;
  @override
  final Tag tag;

  @override
  String toString() {
    return 'BooksEvent.tagToggled(book: $book, tag: $tag)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TagToggledImpl &&
            (identical(other.book, book) || other.book == book) &&
            (identical(other.tag, tag) || other.tag == tag));
  }

  @override
  int get hashCode => Object.hash(runtimeType, book, tag);

  /// Create a copy of BooksEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TagToggledImplCopyWith<_$TagToggledImpl> get copyWith =>
      __$$TagToggledImplCopyWithImpl<_$TagToggledImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            Book book, BookState bookState, List<Tag> selectedTags)
        saveBook,
    required TResult Function(Book book) bookSwipedRight,
    required TResult Function(Book book) bookSwipedLeft,
    required TResult Function() refreshBooksList,
    required TResult Function(Book book, Tag tag) tagToggled,
    required TResult Function(String query) booksFiltered,
    required TResult Function() bookSaved,
  }) {
    return tagToggled(book, tag);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Book book, BookState bookState, List<Tag> selectedTags)?
        saveBook,
    TResult? Function(Book book)? bookSwipedRight,
    TResult? Function(Book book)? bookSwipedLeft,
    TResult? Function()? refreshBooksList,
    TResult? Function(Book book, Tag tag)? tagToggled,
    TResult? Function(String query)? booksFiltered,
    TResult? Function()? bookSaved,
  }) {
    return tagToggled?.call(book, tag);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Book book, BookState bookState, List<Tag> selectedTags)?
        saveBook,
    TResult Function(Book book)? bookSwipedRight,
    TResult Function(Book book)? bookSwipedLeft,
    TResult Function()? refreshBooksList,
    TResult Function(Book book, Tag tag)? tagToggled,
    TResult Function(String query)? booksFiltered,
    TResult Function()? bookSaved,
    required TResult orElse(),
  }) {
    if (tagToggled != null) {
      return tagToggled(book, tag);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SaveBook value) saveBook,
    required TResult Function(BookSwipedRight value) bookSwipedRight,
    required TResult Function(BookSwipedLeft value) bookSwipedLeft,
    required TResult Function(RefreshBooksList value) refreshBooksList,
    required TResult Function(TagToggled value) tagToggled,
    required TResult Function(BooksFiltered value) booksFiltered,
    required TResult Function(BookSaved value) bookSaved,
  }) {
    return tagToggled(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SaveBook value)? saveBook,
    TResult? Function(BookSwipedRight value)? bookSwipedRight,
    TResult? Function(BookSwipedLeft value)? bookSwipedLeft,
    TResult? Function(RefreshBooksList value)? refreshBooksList,
    TResult? Function(TagToggled value)? tagToggled,
    TResult? Function(BooksFiltered value)? booksFiltered,
    TResult? Function(BookSaved value)? bookSaved,
  }) {
    return tagToggled?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SaveBook value)? saveBook,
    TResult Function(BookSwipedRight value)? bookSwipedRight,
    TResult Function(BookSwipedLeft value)? bookSwipedLeft,
    TResult Function(RefreshBooksList value)? refreshBooksList,
    TResult Function(TagToggled value)? tagToggled,
    TResult Function(BooksFiltered value)? booksFiltered,
    TResult Function(BookSaved value)? bookSaved,
    required TResult orElse(),
  }) {
    if (tagToggled != null) {
      return tagToggled(this);
    }
    return orElse();
  }
}

abstract class TagToggled implements BooksEvent {
  const factory TagToggled({required final Book book, required final Tag tag}) =
      _$TagToggledImpl;

  Book get book;
  Tag get tag;

  /// Create a copy of BooksEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TagToggledImplCopyWith<_$TagToggledImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BooksFilteredImplCopyWith<$Res> {
  factory _$$BooksFilteredImplCopyWith(
          _$BooksFilteredImpl value, $Res Function(_$BooksFilteredImpl) then) =
      __$$BooksFilteredImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String query});
}

/// @nodoc
class __$$BooksFilteredImplCopyWithImpl<$Res>
    extends _$BooksEventCopyWithImpl<$Res, _$BooksFilteredImpl>
    implements _$$BooksFilteredImplCopyWith<$Res> {
  __$$BooksFilteredImplCopyWithImpl(
      _$BooksFilteredImpl _value, $Res Function(_$BooksFilteredImpl) _then)
      : super(_value, _then);

  /// Create a copy of BooksEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
  }) {
    return _then(_$BooksFilteredImpl(
      null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$BooksFilteredImpl implements BooksFiltered {
  const _$BooksFilteredImpl(this.query);

  @override
  final String query;

  @override
  String toString() {
    return 'BooksEvent.booksFiltered(query: $query)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BooksFilteredImpl &&
            (identical(other.query, query) || other.query == query));
  }

  @override
  int get hashCode => Object.hash(runtimeType, query);

  /// Create a copy of BooksEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BooksFilteredImplCopyWith<_$BooksFilteredImpl> get copyWith =>
      __$$BooksFilteredImplCopyWithImpl<_$BooksFilteredImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            Book book, BookState bookState, List<Tag> selectedTags)
        saveBook,
    required TResult Function(Book book) bookSwipedRight,
    required TResult Function(Book book) bookSwipedLeft,
    required TResult Function() refreshBooksList,
    required TResult Function(Book book, Tag tag) tagToggled,
    required TResult Function(String query) booksFiltered,
    required TResult Function() bookSaved,
  }) {
    return booksFiltered(query);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Book book, BookState bookState, List<Tag> selectedTags)?
        saveBook,
    TResult? Function(Book book)? bookSwipedRight,
    TResult? Function(Book book)? bookSwipedLeft,
    TResult? Function()? refreshBooksList,
    TResult? Function(Book book, Tag tag)? tagToggled,
    TResult? Function(String query)? booksFiltered,
    TResult? Function()? bookSaved,
  }) {
    return booksFiltered?.call(query);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Book book, BookState bookState, List<Tag> selectedTags)?
        saveBook,
    TResult Function(Book book)? bookSwipedRight,
    TResult Function(Book book)? bookSwipedLeft,
    TResult Function()? refreshBooksList,
    TResult Function(Book book, Tag tag)? tagToggled,
    TResult Function(String query)? booksFiltered,
    TResult Function()? bookSaved,
    required TResult orElse(),
  }) {
    if (booksFiltered != null) {
      return booksFiltered(query);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SaveBook value) saveBook,
    required TResult Function(BookSwipedRight value) bookSwipedRight,
    required TResult Function(BookSwipedLeft value) bookSwipedLeft,
    required TResult Function(RefreshBooksList value) refreshBooksList,
    required TResult Function(TagToggled value) tagToggled,
    required TResult Function(BooksFiltered value) booksFiltered,
    required TResult Function(BookSaved value) bookSaved,
  }) {
    return booksFiltered(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SaveBook value)? saveBook,
    TResult? Function(BookSwipedRight value)? bookSwipedRight,
    TResult? Function(BookSwipedLeft value)? bookSwipedLeft,
    TResult? Function(RefreshBooksList value)? refreshBooksList,
    TResult? Function(TagToggled value)? tagToggled,
    TResult? Function(BooksFiltered value)? booksFiltered,
    TResult? Function(BookSaved value)? bookSaved,
  }) {
    return booksFiltered?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SaveBook value)? saveBook,
    TResult Function(BookSwipedRight value)? bookSwipedRight,
    TResult Function(BookSwipedLeft value)? bookSwipedLeft,
    TResult Function(RefreshBooksList value)? refreshBooksList,
    TResult Function(TagToggled value)? tagToggled,
    TResult Function(BooksFiltered value)? booksFiltered,
    TResult Function(BookSaved value)? bookSaved,
    required TResult orElse(),
  }) {
    if (booksFiltered != null) {
      return booksFiltered(this);
    }
    return orElse();
  }
}

abstract class BooksFiltered implements BooksEvent {
  const factory BooksFiltered(final String query) = _$BooksFilteredImpl;

  String get query;

  /// Create a copy of BooksEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BooksFilteredImplCopyWith<_$BooksFilteredImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BookSavedImplCopyWith<$Res> {
  factory _$$BookSavedImplCopyWith(
          _$BookSavedImpl value, $Res Function(_$BookSavedImpl) then) =
      __$$BookSavedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$BookSavedImplCopyWithImpl<$Res>
    extends _$BooksEventCopyWithImpl<$Res, _$BookSavedImpl>
    implements _$$BookSavedImplCopyWith<$Res> {
  __$$BookSavedImplCopyWithImpl(
      _$BookSavedImpl _value, $Res Function(_$BookSavedImpl) _then)
      : super(_value, _then);

  /// Create a copy of BooksEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$BookSavedImpl implements BookSaved {
  const _$BookSavedImpl();

  @override
  String toString() {
    return 'BooksEvent.bookSaved()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$BookSavedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            Book book, BookState bookState, List<Tag> selectedTags)
        saveBook,
    required TResult Function(Book book) bookSwipedRight,
    required TResult Function(Book book) bookSwipedLeft,
    required TResult Function() refreshBooksList,
    required TResult Function(Book book, Tag tag) tagToggled,
    required TResult Function(String query) booksFiltered,
    required TResult Function() bookSaved,
  }) {
    return bookSaved();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Book book, BookState bookState, List<Tag> selectedTags)?
        saveBook,
    TResult? Function(Book book)? bookSwipedRight,
    TResult? Function(Book book)? bookSwipedLeft,
    TResult? Function()? refreshBooksList,
    TResult? Function(Book book, Tag tag)? tagToggled,
    TResult? Function(String query)? booksFiltered,
    TResult? Function()? bookSaved,
  }) {
    return bookSaved?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Book book, BookState bookState, List<Tag> selectedTags)?
        saveBook,
    TResult Function(Book book)? bookSwipedRight,
    TResult Function(Book book)? bookSwipedLeft,
    TResult Function()? refreshBooksList,
    TResult Function(Book book, Tag tag)? tagToggled,
    TResult Function(String query)? booksFiltered,
    TResult Function()? bookSaved,
    required TResult orElse(),
  }) {
    if (bookSaved != null) {
      return bookSaved();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SaveBook value) saveBook,
    required TResult Function(BookSwipedRight value) bookSwipedRight,
    required TResult Function(BookSwipedLeft value) bookSwipedLeft,
    required TResult Function(RefreshBooksList value) refreshBooksList,
    required TResult Function(TagToggled value) tagToggled,
    required TResult Function(BooksFiltered value) booksFiltered,
    required TResult Function(BookSaved value) bookSaved,
  }) {
    return bookSaved(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SaveBook value)? saveBook,
    TResult? Function(BookSwipedRight value)? bookSwipedRight,
    TResult? Function(BookSwipedLeft value)? bookSwipedLeft,
    TResult? Function(RefreshBooksList value)? refreshBooksList,
    TResult? Function(TagToggled value)? tagToggled,
    TResult? Function(BooksFiltered value)? booksFiltered,
    TResult? Function(BookSaved value)? bookSaved,
  }) {
    return bookSaved?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SaveBook value)? saveBook,
    TResult Function(BookSwipedRight value)? bookSwipedRight,
    TResult Function(BookSwipedLeft value)? bookSwipedLeft,
    TResult Function(RefreshBooksList value)? refreshBooksList,
    TResult Function(TagToggled value)? tagToggled,
    TResult Function(BooksFiltered value)? booksFiltered,
    TResult Function(BookSaved value)? bookSaved,
    required TResult orElse(),
  }) {
    if (bookSaved != null) {
      return bookSaved(this);
    }
    return orElse();
  }
}

abstract class BookSaved implements BooksEvent {
  const factory BookSaved() = _$BookSavedImpl;
}
