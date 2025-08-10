// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'book_search_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BookSearchState {
  List<Book> get foundBooks => throw _privateConstructorUsedError;
  Option<Book> get pickedBook => throw _privateConstructorUsedError;
  BookSearchMode get mode => throw _privateConstructorUsedError;
  Option<String> get searchFailureCause => throw _privateConstructorUsedError;

  /// Create a copy of BookSearchState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BookSearchStateCopyWith<BookSearchState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookSearchStateCopyWith<$Res> {
  factory $BookSearchStateCopyWith(
          BookSearchState value, $Res Function(BookSearchState) then) =
      _$BookSearchStateCopyWithImpl<$Res, BookSearchState>;
  @useResult
  $Res call(
      {List<Book> foundBooks,
      Option<Book> pickedBook,
      BookSearchMode mode,
      Option<String> searchFailureCause});
}

/// @nodoc
class _$BookSearchStateCopyWithImpl<$Res, $Val extends BookSearchState>
    implements $BookSearchStateCopyWith<$Res> {
  _$BookSearchStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BookSearchState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? foundBooks = null,
    Object? pickedBook = null,
    Object? mode = null,
    Object? searchFailureCause = null,
  }) {
    return _then(_value.copyWith(
      foundBooks: null == foundBooks
          ? _value.foundBooks
          : foundBooks // ignore: cast_nullable_to_non_nullable
              as List<Book>,
      pickedBook: null == pickedBook
          ? _value.pickedBook
          : pickedBook // ignore: cast_nullable_to_non_nullable
              as Option<Book>,
      mode: null == mode
          ? _value.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as BookSearchMode,
      searchFailureCause: null == searchFailureCause
          ? _value.searchFailureCause
          : searchFailureCause // ignore: cast_nullable_to_non_nullable
              as Option<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BookSearchStateImplCopyWith<$Res>
    implements $BookSearchStateCopyWith<$Res> {
  factory _$$BookSearchStateImplCopyWith(_$BookSearchStateImpl value,
          $Res Function(_$BookSearchStateImpl) then) =
      __$$BookSearchStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Book> foundBooks,
      Option<Book> pickedBook,
      BookSearchMode mode,
      Option<String> searchFailureCause});
}

/// @nodoc
class __$$BookSearchStateImplCopyWithImpl<$Res>
    extends _$BookSearchStateCopyWithImpl<$Res, _$BookSearchStateImpl>
    implements _$$BookSearchStateImplCopyWith<$Res> {
  __$$BookSearchStateImplCopyWithImpl(
      _$BookSearchStateImpl _value, $Res Function(_$BookSearchStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of BookSearchState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? foundBooks = null,
    Object? pickedBook = null,
    Object? mode = null,
    Object? searchFailureCause = null,
  }) {
    return _then(_$BookSearchStateImpl(
      foundBooks: null == foundBooks
          ? _value._foundBooks
          : foundBooks // ignore: cast_nullable_to_non_nullable
              as List<Book>,
      pickedBook: null == pickedBook
          ? _value.pickedBook
          : pickedBook // ignore: cast_nullable_to_non_nullable
              as Option<Book>,
      mode: null == mode
          ? _value.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as BookSearchMode,
      searchFailureCause: null == searchFailureCause
          ? _value.searchFailureCause
          : searchFailureCause // ignore: cast_nullable_to_non_nullable
              as Option<String>,
    ));
  }
}

/// @nodoc

class _$BookSearchStateImpl extends _BookSearchState {
  const _$BookSearchStateImpl(
      {final List<Book> foundBooks = const <Book>[],
      this.pickedBook = const None<Book>(),
      this.mode = BookSearchMode.initial,
      this.searchFailureCause = const None<String>()})
      : _foundBooks = foundBooks,
        super._();

  final List<Book> _foundBooks;
  @override
  @JsonKey()
  List<Book> get foundBooks {
    if (_foundBooks is EqualUnmodifiableListView) return _foundBooks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_foundBooks);
  }

  @override
  @JsonKey()
  final Option<Book> pickedBook;
  @override
  @JsonKey()
  final BookSearchMode mode;
  @override
  @JsonKey()
  final Option<String> searchFailureCause;

  @override
  String toString() {
    return 'BookSearchState(foundBooks: $foundBooks, pickedBook: $pickedBook, mode: $mode, searchFailureCause: $searchFailureCause)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookSearchStateImpl &&
            const DeepCollectionEquality()
                .equals(other._foundBooks, _foundBooks) &&
            (identical(other.pickedBook, pickedBook) ||
                other.pickedBook == pickedBook) &&
            (identical(other.mode, mode) || other.mode == mode) &&
            (identical(other.searchFailureCause, searchFailureCause) ||
                other.searchFailureCause == searchFailureCause));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_foundBooks),
      pickedBook,
      mode,
      searchFailureCause);

  /// Create a copy of BookSearchState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BookSearchStateImplCopyWith<_$BookSearchStateImpl> get copyWith =>
      __$$BookSearchStateImplCopyWithImpl<_$BookSearchStateImpl>(
          this, _$identity);
}

abstract class _BookSearchState extends BookSearchState {
  const factory _BookSearchState(
      {final List<Book> foundBooks,
      final Option<Book> pickedBook,
      final BookSearchMode mode,
      final Option<String> searchFailureCause}) = _$BookSearchStateImpl;
  const _BookSearchState._() : super._();

  @override
  List<Book> get foundBooks;
  @override
  Option<Book> get pickedBook;
  @override
  BookSearchMode get mode;
  @override
  Option<String> get searchFailureCause;

  /// Create a copy of BookSearchState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BookSearchStateImplCopyWith<_$BookSearchStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
