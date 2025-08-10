// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'books_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BooksState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Book> books) initial,
    required TResult Function(List<Book> books) booksLoaded,
    required TResult Function() loadingFailed,
    required TResult Function() addingBookFailed,
    required TResult Function() updatingBookFailed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Book> books)? initial,
    TResult? Function(List<Book> books)? booksLoaded,
    TResult? Function()? loadingFailed,
    TResult? Function()? addingBookFailed,
    TResult? Function()? updatingBookFailed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Book> books)? initial,
    TResult Function(List<Book> books)? booksLoaded,
    TResult Function()? loadingFailed,
    TResult Function()? addingBookFailed,
    TResult Function()? updatingBookFailed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(BooksLoaded value) booksLoaded,
    required TResult Function(LoadingFailed value) loadingFailed,
    required TResult Function(AddingBookFailed value) addingBookFailed,
    required TResult Function(UpdatingBookFailed value) updatingBookFailed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(BooksLoaded value)? booksLoaded,
    TResult? Function(LoadingFailed value)? loadingFailed,
    TResult? Function(AddingBookFailed value)? addingBookFailed,
    TResult? Function(UpdatingBookFailed value)? updatingBookFailed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(BooksLoaded value)? booksLoaded,
    TResult Function(LoadingFailed value)? loadingFailed,
    TResult Function(AddingBookFailed value)? addingBookFailed,
    TResult Function(UpdatingBookFailed value)? updatingBookFailed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BooksStateCopyWith<$Res> {
  factory $BooksStateCopyWith(
          BooksState value, $Res Function(BooksState) then) =
      _$BooksStateCopyWithImpl<$Res, BooksState>;
}

/// @nodoc
class _$BooksStateCopyWithImpl<$Res, $Val extends BooksState>
    implements $BooksStateCopyWith<$Res> {
  _$BooksStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BooksState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Book> books});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$BooksStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of BooksState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? books = null,
  }) {
    return _then(_$InitialImpl(
      books: null == books
          ? _value._books
          : books // ignore: cast_nullable_to_non_nullable
              as List<Book>,
    ));
  }
}

/// @nodoc

class _$InitialImpl extends Initial {
  const _$InitialImpl({final List<Book> books = const <Book>[]})
      : _books = books,
        super._();

  final List<Book> _books;
  @override
  @JsonKey()
  List<Book> get books {
    if (_books is EqualUnmodifiableListView) return _books;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_books);
  }

  @override
  String toString() {
    return 'BooksState.initial(books: $books)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            const DeepCollectionEquality().equals(other._books, _books));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_books));

  /// Create a copy of BooksState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Book> books) initial,
    required TResult Function(List<Book> books) booksLoaded,
    required TResult Function() loadingFailed,
    required TResult Function() addingBookFailed,
    required TResult Function() updatingBookFailed,
  }) {
    return initial(books);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Book> books)? initial,
    TResult? Function(List<Book> books)? booksLoaded,
    TResult? Function()? loadingFailed,
    TResult? Function()? addingBookFailed,
    TResult? Function()? updatingBookFailed,
  }) {
    return initial?.call(books);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Book> books)? initial,
    TResult Function(List<Book> books)? booksLoaded,
    TResult Function()? loadingFailed,
    TResult Function()? addingBookFailed,
    TResult Function()? updatingBookFailed,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(books);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(BooksLoaded value) booksLoaded,
    required TResult Function(LoadingFailed value) loadingFailed,
    required TResult Function(AddingBookFailed value) addingBookFailed,
    required TResult Function(UpdatingBookFailed value) updatingBookFailed,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(BooksLoaded value)? booksLoaded,
    TResult? Function(LoadingFailed value)? loadingFailed,
    TResult? Function(AddingBookFailed value)? addingBookFailed,
    TResult? Function(UpdatingBookFailed value)? updatingBookFailed,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(BooksLoaded value)? booksLoaded,
    TResult Function(LoadingFailed value)? loadingFailed,
    TResult Function(AddingBookFailed value)? addingBookFailed,
    TResult Function(UpdatingBookFailed value)? updatingBookFailed,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class Initial extends BooksState {
  const factory Initial({final List<Book> books}) = _$InitialImpl;
  const Initial._() : super._();

  List<Book> get books;

  /// Create a copy of BooksState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BooksLoadedImplCopyWith<$Res> {
  factory _$$BooksLoadedImplCopyWith(
          _$BooksLoadedImpl value, $Res Function(_$BooksLoadedImpl) then) =
      __$$BooksLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Book> books});
}

/// @nodoc
class __$$BooksLoadedImplCopyWithImpl<$Res>
    extends _$BooksStateCopyWithImpl<$Res, _$BooksLoadedImpl>
    implements _$$BooksLoadedImplCopyWith<$Res> {
  __$$BooksLoadedImplCopyWithImpl(
      _$BooksLoadedImpl _value, $Res Function(_$BooksLoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of BooksState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? books = null,
  }) {
    return _then(_$BooksLoadedImpl(
      null == books
          ? _value._books
          : books // ignore: cast_nullable_to_non_nullable
              as List<Book>,
    ));
  }
}

/// @nodoc

class _$BooksLoadedImpl extends BooksLoaded {
  const _$BooksLoadedImpl(final List<Book> books)
      : _books = books,
        super._();

  final List<Book> _books;
  @override
  List<Book> get books {
    if (_books is EqualUnmodifiableListView) return _books;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_books);
  }

  @override
  String toString() {
    return 'BooksState.booksLoaded(books: $books)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BooksLoadedImpl &&
            const DeepCollectionEquality().equals(other._books, _books));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_books));

  /// Create a copy of BooksState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BooksLoadedImplCopyWith<_$BooksLoadedImpl> get copyWith =>
      __$$BooksLoadedImplCopyWithImpl<_$BooksLoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Book> books) initial,
    required TResult Function(List<Book> books) booksLoaded,
    required TResult Function() loadingFailed,
    required TResult Function() addingBookFailed,
    required TResult Function() updatingBookFailed,
  }) {
    return booksLoaded(books);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Book> books)? initial,
    TResult? Function(List<Book> books)? booksLoaded,
    TResult? Function()? loadingFailed,
    TResult? Function()? addingBookFailed,
    TResult? Function()? updatingBookFailed,
  }) {
    return booksLoaded?.call(books);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Book> books)? initial,
    TResult Function(List<Book> books)? booksLoaded,
    TResult Function()? loadingFailed,
    TResult Function()? addingBookFailed,
    TResult Function()? updatingBookFailed,
    required TResult orElse(),
  }) {
    if (booksLoaded != null) {
      return booksLoaded(books);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(BooksLoaded value) booksLoaded,
    required TResult Function(LoadingFailed value) loadingFailed,
    required TResult Function(AddingBookFailed value) addingBookFailed,
    required TResult Function(UpdatingBookFailed value) updatingBookFailed,
  }) {
    return booksLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(BooksLoaded value)? booksLoaded,
    TResult? Function(LoadingFailed value)? loadingFailed,
    TResult? Function(AddingBookFailed value)? addingBookFailed,
    TResult? Function(UpdatingBookFailed value)? updatingBookFailed,
  }) {
    return booksLoaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(BooksLoaded value)? booksLoaded,
    TResult Function(LoadingFailed value)? loadingFailed,
    TResult Function(AddingBookFailed value)? addingBookFailed,
    TResult Function(UpdatingBookFailed value)? updatingBookFailed,
    required TResult orElse(),
  }) {
    if (booksLoaded != null) {
      return booksLoaded(this);
    }
    return orElse();
  }
}

abstract class BooksLoaded extends BooksState {
  const factory BooksLoaded(final List<Book> books) = _$BooksLoadedImpl;
  const BooksLoaded._() : super._();

  List<Book> get books;

  /// Create a copy of BooksState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BooksLoadedImplCopyWith<_$BooksLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadingFailedImplCopyWith<$Res> {
  factory _$$LoadingFailedImplCopyWith(
          _$LoadingFailedImpl value, $Res Function(_$LoadingFailedImpl) then) =
      __$$LoadingFailedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingFailedImplCopyWithImpl<$Res>
    extends _$BooksStateCopyWithImpl<$Res, _$LoadingFailedImpl>
    implements _$$LoadingFailedImplCopyWith<$Res> {
  __$$LoadingFailedImplCopyWithImpl(
      _$LoadingFailedImpl _value, $Res Function(_$LoadingFailedImpl) _then)
      : super(_value, _then);

  /// Create a copy of BooksState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingFailedImpl extends LoadingFailed {
  const _$LoadingFailedImpl() : super._();

  @override
  String toString() {
    return 'BooksState.loadingFailed()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingFailedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Book> books) initial,
    required TResult Function(List<Book> books) booksLoaded,
    required TResult Function() loadingFailed,
    required TResult Function() addingBookFailed,
    required TResult Function() updatingBookFailed,
  }) {
    return loadingFailed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Book> books)? initial,
    TResult? Function(List<Book> books)? booksLoaded,
    TResult? Function()? loadingFailed,
    TResult? Function()? addingBookFailed,
    TResult? Function()? updatingBookFailed,
  }) {
    return loadingFailed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Book> books)? initial,
    TResult Function(List<Book> books)? booksLoaded,
    TResult Function()? loadingFailed,
    TResult Function()? addingBookFailed,
    TResult Function()? updatingBookFailed,
    required TResult orElse(),
  }) {
    if (loadingFailed != null) {
      return loadingFailed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(BooksLoaded value) booksLoaded,
    required TResult Function(LoadingFailed value) loadingFailed,
    required TResult Function(AddingBookFailed value) addingBookFailed,
    required TResult Function(UpdatingBookFailed value) updatingBookFailed,
  }) {
    return loadingFailed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(BooksLoaded value)? booksLoaded,
    TResult? Function(LoadingFailed value)? loadingFailed,
    TResult? Function(AddingBookFailed value)? addingBookFailed,
    TResult? Function(UpdatingBookFailed value)? updatingBookFailed,
  }) {
    return loadingFailed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(BooksLoaded value)? booksLoaded,
    TResult Function(LoadingFailed value)? loadingFailed,
    TResult Function(AddingBookFailed value)? addingBookFailed,
    TResult Function(UpdatingBookFailed value)? updatingBookFailed,
    required TResult orElse(),
  }) {
    if (loadingFailed != null) {
      return loadingFailed(this);
    }
    return orElse();
  }
}

abstract class LoadingFailed extends BooksState {
  const factory LoadingFailed() = _$LoadingFailedImpl;
  const LoadingFailed._() : super._();
}

/// @nodoc
abstract class _$$AddingBookFailedImplCopyWith<$Res> {
  factory _$$AddingBookFailedImplCopyWith(_$AddingBookFailedImpl value,
          $Res Function(_$AddingBookFailedImpl) then) =
      __$$AddingBookFailedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AddingBookFailedImplCopyWithImpl<$Res>
    extends _$BooksStateCopyWithImpl<$Res, _$AddingBookFailedImpl>
    implements _$$AddingBookFailedImplCopyWith<$Res> {
  __$$AddingBookFailedImplCopyWithImpl(_$AddingBookFailedImpl _value,
      $Res Function(_$AddingBookFailedImpl) _then)
      : super(_value, _then);

  /// Create a copy of BooksState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$AddingBookFailedImpl extends AddingBookFailed {
  const _$AddingBookFailedImpl() : super._();

  @override
  String toString() {
    return 'BooksState.addingBookFailed()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AddingBookFailedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Book> books) initial,
    required TResult Function(List<Book> books) booksLoaded,
    required TResult Function() loadingFailed,
    required TResult Function() addingBookFailed,
    required TResult Function() updatingBookFailed,
  }) {
    return addingBookFailed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Book> books)? initial,
    TResult? Function(List<Book> books)? booksLoaded,
    TResult? Function()? loadingFailed,
    TResult? Function()? addingBookFailed,
    TResult? Function()? updatingBookFailed,
  }) {
    return addingBookFailed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Book> books)? initial,
    TResult Function(List<Book> books)? booksLoaded,
    TResult Function()? loadingFailed,
    TResult Function()? addingBookFailed,
    TResult Function()? updatingBookFailed,
    required TResult orElse(),
  }) {
    if (addingBookFailed != null) {
      return addingBookFailed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(BooksLoaded value) booksLoaded,
    required TResult Function(LoadingFailed value) loadingFailed,
    required TResult Function(AddingBookFailed value) addingBookFailed,
    required TResult Function(UpdatingBookFailed value) updatingBookFailed,
  }) {
    return addingBookFailed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(BooksLoaded value)? booksLoaded,
    TResult? Function(LoadingFailed value)? loadingFailed,
    TResult? Function(AddingBookFailed value)? addingBookFailed,
    TResult? Function(UpdatingBookFailed value)? updatingBookFailed,
  }) {
    return addingBookFailed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(BooksLoaded value)? booksLoaded,
    TResult Function(LoadingFailed value)? loadingFailed,
    TResult Function(AddingBookFailed value)? addingBookFailed,
    TResult Function(UpdatingBookFailed value)? updatingBookFailed,
    required TResult orElse(),
  }) {
    if (addingBookFailed != null) {
      return addingBookFailed(this);
    }
    return orElse();
  }
}

abstract class AddingBookFailed extends BooksState {
  const factory AddingBookFailed() = _$AddingBookFailedImpl;
  const AddingBookFailed._() : super._();
}

/// @nodoc
abstract class _$$UpdatingBookFailedImplCopyWith<$Res> {
  factory _$$UpdatingBookFailedImplCopyWith(_$UpdatingBookFailedImpl value,
          $Res Function(_$UpdatingBookFailedImpl) then) =
      __$$UpdatingBookFailedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UpdatingBookFailedImplCopyWithImpl<$Res>
    extends _$BooksStateCopyWithImpl<$Res, _$UpdatingBookFailedImpl>
    implements _$$UpdatingBookFailedImplCopyWith<$Res> {
  __$$UpdatingBookFailedImplCopyWithImpl(_$UpdatingBookFailedImpl _value,
      $Res Function(_$UpdatingBookFailedImpl) _then)
      : super(_value, _then);

  /// Create a copy of BooksState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$UpdatingBookFailedImpl extends UpdatingBookFailed {
  const _$UpdatingBookFailedImpl() : super._();

  @override
  String toString() {
    return 'BooksState.updatingBookFailed()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UpdatingBookFailedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Book> books) initial,
    required TResult Function(List<Book> books) booksLoaded,
    required TResult Function() loadingFailed,
    required TResult Function() addingBookFailed,
    required TResult Function() updatingBookFailed,
  }) {
    return updatingBookFailed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Book> books)? initial,
    TResult? Function(List<Book> books)? booksLoaded,
    TResult? Function()? loadingFailed,
    TResult? Function()? addingBookFailed,
    TResult? Function()? updatingBookFailed,
  }) {
    return updatingBookFailed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Book> books)? initial,
    TResult Function(List<Book> books)? booksLoaded,
    TResult Function()? loadingFailed,
    TResult Function()? addingBookFailed,
    TResult Function()? updatingBookFailed,
    required TResult orElse(),
  }) {
    if (updatingBookFailed != null) {
      return updatingBookFailed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(BooksLoaded value) booksLoaded,
    required TResult Function(LoadingFailed value) loadingFailed,
    required TResult Function(AddingBookFailed value) addingBookFailed,
    required TResult Function(UpdatingBookFailed value) updatingBookFailed,
  }) {
    return updatingBookFailed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(BooksLoaded value)? booksLoaded,
    TResult? Function(LoadingFailed value)? loadingFailed,
    TResult? Function(AddingBookFailed value)? addingBookFailed,
    TResult? Function(UpdatingBookFailed value)? updatingBookFailed,
  }) {
    return updatingBookFailed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(BooksLoaded value)? booksLoaded,
    TResult Function(LoadingFailed value)? loadingFailed,
    TResult Function(AddingBookFailed value)? addingBookFailed,
    TResult Function(UpdatingBookFailed value)? updatingBookFailed,
    required TResult orElse(),
  }) {
    if (updatingBookFailed != null) {
      return updatingBookFailed(this);
    }
    return orElse();
  }
}

abstract class UpdatingBookFailed extends BooksState {
  const factory UpdatingBookFailed() = _$UpdatingBookFailedImpl;
  const UpdatingBookFailed._() : super._();
}
