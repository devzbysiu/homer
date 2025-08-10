// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'book_search_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SearchEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String query) searching,
    required TResult Function(Book pickedBook) suggestionPicked,
    required TResult Function() clearPickedBook,
    required TResult Function(String query) shareOffloaded,
    required TResult Function() resetShareOffloaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String query)? searching,
    TResult? Function(Book pickedBook)? suggestionPicked,
    TResult? Function()? clearPickedBook,
    TResult? Function(String query)? shareOffloaded,
    TResult? Function()? resetShareOffloaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String query)? searching,
    TResult Function(Book pickedBook)? suggestionPicked,
    TResult Function()? clearPickedBook,
    TResult Function(String query)? shareOffloaded,
    TResult Function()? resetShareOffloaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Searching value) searching,
    required TResult Function(SuggestionPicked value) suggestionPicked,
    required TResult Function(ClearPickedBook value) clearPickedBook,
    required TResult Function(ShareOffloaded value) shareOffloaded,
    required TResult Function(ResetShareOffload value) resetShareOffloaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Searching value)? searching,
    TResult? Function(SuggestionPicked value)? suggestionPicked,
    TResult? Function(ClearPickedBook value)? clearPickedBook,
    TResult? Function(ShareOffloaded value)? shareOffloaded,
    TResult? Function(ResetShareOffload value)? resetShareOffloaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Searching value)? searching,
    TResult Function(SuggestionPicked value)? suggestionPicked,
    TResult Function(ClearPickedBook value)? clearPickedBook,
    TResult Function(ShareOffloaded value)? shareOffloaded,
    TResult Function(ResetShareOffload value)? resetShareOffloaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchEventCopyWith<$Res> {
  factory $SearchEventCopyWith(
          SearchEvent value, $Res Function(SearchEvent) then) =
      _$SearchEventCopyWithImpl<$Res, SearchEvent>;
}

/// @nodoc
class _$SearchEventCopyWithImpl<$Res, $Val extends SearchEvent>
    implements $SearchEventCopyWith<$Res> {
  _$SearchEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SearchEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$SearchingImplCopyWith<$Res> {
  factory _$$SearchingImplCopyWith(
          _$SearchingImpl value, $Res Function(_$SearchingImpl) then) =
      __$$SearchingImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String query});
}

/// @nodoc
class __$$SearchingImplCopyWithImpl<$Res>
    extends _$SearchEventCopyWithImpl<$Res, _$SearchingImpl>
    implements _$$SearchingImplCopyWith<$Res> {
  __$$SearchingImplCopyWithImpl(
      _$SearchingImpl _value, $Res Function(_$SearchingImpl) _then)
      : super(_value, _then);

  /// Create a copy of SearchEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
  }) {
    return _then(_$SearchingImpl(
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SearchingImpl implements Searching {
  const _$SearchingImpl({required this.query});

  @override
  final String query;

  @override
  String toString() {
    return 'SearchEvent.searching(query: $query)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchingImpl &&
            (identical(other.query, query) || other.query == query));
  }

  @override
  int get hashCode => Object.hash(runtimeType, query);

  /// Create a copy of SearchEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchingImplCopyWith<_$SearchingImpl> get copyWith =>
      __$$SearchingImplCopyWithImpl<_$SearchingImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String query) searching,
    required TResult Function(Book pickedBook) suggestionPicked,
    required TResult Function() clearPickedBook,
    required TResult Function(String query) shareOffloaded,
    required TResult Function() resetShareOffloaded,
  }) {
    return searching(query);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String query)? searching,
    TResult? Function(Book pickedBook)? suggestionPicked,
    TResult? Function()? clearPickedBook,
    TResult? Function(String query)? shareOffloaded,
    TResult? Function()? resetShareOffloaded,
  }) {
    return searching?.call(query);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String query)? searching,
    TResult Function(Book pickedBook)? suggestionPicked,
    TResult Function()? clearPickedBook,
    TResult Function(String query)? shareOffloaded,
    TResult Function()? resetShareOffloaded,
    required TResult orElse(),
  }) {
    if (searching != null) {
      return searching(query);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Searching value) searching,
    required TResult Function(SuggestionPicked value) suggestionPicked,
    required TResult Function(ClearPickedBook value) clearPickedBook,
    required TResult Function(ShareOffloaded value) shareOffloaded,
    required TResult Function(ResetShareOffload value) resetShareOffloaded,
  }) {
    return searching(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Searching value)? searching,
    TResult? Function(SuggestionPicked value)? suggestionPicked,
    TResult? Function(ClearPickedBook value)? clearPickedBook,
    TResult? Function(ShareOffloaded value)? shareOffloaded,
    TResult? Function(ResetShareOffload value)? resetShareOffloaded,
  }) {
    return searching?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Searching value)? searching,
    TResult Function(SuggestionPicked value)? suggestionPicked,
    TResult Function(ClearPickedBook value)? clearPickedBook,
    TResult Function(ShareOffloaded value)? shareOffloaded,
    TResult Function(ResetShareOffload value)? resetShareOffloaded,
    required TResult orElse(),
  }) {
    if (searching != null) {
      return searching(this);
    }
    return orElse();
  }
}

abstract class Searching implements SearchEvent {
  const factory Searching({required final String query}) = _$SearchingImpl;

  String get query;

  /// Create a copy of SearchEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SearchingImplCopyWith<_$SearchingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SuggestionPickedImplCopyWith<$Res> {
  factory _$$SuggestionPickedImplCopyWith(_$SuggestionPickedImpl value,
          $Res Function(_$SuggestionPickedImpl) then) =
      __$$SuggestionPickedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Book pickedBook});
}

/// @nodoc
class __$$SuggestionPickedImplCopyWithImpl<$Res>
    extends _$SearchEventCopyWithImpl<$Res, _$SuggestionPickedImpl>
    implements _$$SuggestionPickedImplCopyWith<$Res> {
  __$$SuggestionPickedImplCopyWithImpl(_$SuggestionPickedImpl _value,
      $Res Function(_$SuggestionPickedImpl) _then)
      : super(_value, _then);

  /// Create a copy of SearchEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pickedBook = null,
  }) {
    return _then(_$SuggestionPickedImpl(
      pickedBook: null == pickedBook
          ? _value.pickedBook
          : pickedBook // ignore: cast_nullable_to_non_nullable
              as Book,
    ));
  }
}

/// @nodoc

class _$SuggestionPickedImpl implements SuggestionPicked {
  const _$SuggestionPickedImpl({required this.pickedBook});

  @override
  final Book pickedBook;

  @override
  String toString() {
    return 'SearchEvent.suggestionPicked(pickedBook: $pickedBook)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuggestionPickedImpl &&
            (identical(other.pickedBook, pickedBook) ||
                other.pickedBook == pickedBook));
  }

  @override
  int get hashCode => Object.hash(runtimeType, pickedBook);

  /// Create a copy of SearchEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SuggestionPickedImplCopyWith<_$SuggestionPickedImpl> get copyWith =>
      __$$SuggestionPickedImplCopyWithImpl<_$SuggestionPickedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String query) searching,
    required TResult Function(Book pickedBook) suggestionPicked,
    required TResult Function() clearPickedBook,
    required TResult Function(String query) shareOffloaded,
    required TResult Function() resetShareOffloaded,
  }) {
    return suggestionPicked(pickedBook);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String query)? searching,
    TResult? Function(Book pickedBook)? suggestionPicked,
    TResult? Function()? clearPickedBook,
    TResult? Function(String query)? shareOffloaded,
    TResult? Function()? resetShareOffloaded,
  }) {
    return suggestionPicked?.call(pickedBook);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String query)? searching,
    TResult Function(Book pickedBook)? suggestionPicked,
    TResult Function()? clearPickedBook,
    TResult Function(String query)? shareOffloaded,
    TResult Function()? resetShareOffloaded,
    required TResult orElse(),
  }) {
    if (suggestionPicked != null) {
      return suggestionPicked(pickedBook);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Searching value) searching,
    required TResult Function(SuggestionPicked value) suggestionPicked,
    required TResult Function(ClearPickedBook value) clearPickedBook,
    required TResult Function(ShareOffloaded value) shareOffloaded,
    required TResult Function(ResetShareOffload value) resetShareOffloaded,
  }) {
    return suggestionPicked(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Searching value)? searching,
    TResult? Function(SuggestionPicked value)? suggestionPicked,
    TResult? Function(ClearPickedBook value)? clearPickedBook,
    TResult? Function(ShareOffloaded value)? shareOffloaded,
    TResult? Function(ResetShareOffload value)? resetShareOffloaded,
  }) {
    return suggestionPicked?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Searching value)? searching,
    TResult Function(SuggestionPicked value)? suggestionPicked,
    TResult Function(ClearPickedBook value)? clearPickedBook,
    TResult Function(ShareOffloaded value)? shareOffloaded,
    TResult Function(ResetShareOffload value)? resetShareOffloaded,
    required TResult orElse(),
  }) {
    if (suggestionPicked != null) {
      return suggestionPicked(this);
    }
    return orElse();
  }
}

abstract class SuggestionPicked implements SearchEvent {
  const factory SuggestionPicked({required final Book pickedBook}) =
      _$SuggestionPickedImpl;

  Book get pickedBook;

  /// Create a copy of SearchEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SuggestionPickedImplCopyWith<_$SuggestionPickedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ClearPickedBookImplCopyWith<$Res> {
  factory _$$ClearPickedBookImplCopyWith(_$ClearPickedBookImpl value,
          $Res Function(_$ClearPickedBookImpl) then) =
      __$$ClearPickedBookImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ClearPickedBookImplCopyWithImpl<$Res>
    extends _$SearchEventCopyWithImpl<$Res, _$ClearPickedBookImpl>
    implements _$$ClearPickedBookImplCopyWith<$Res> {
  __$$ClearPickedBookImplCopyWithImpl(
      _$ClearPickedBookImpl _value, $Res Function(_$ClearPickedBookImpl) _then)
      : super(_value, _then);

  /// Create a copy of SearchEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ClearPickedBookImpl implements ClearPickedBook {
  const _$ClearPickedBookImpl();

  @override
  String toString() {
    return 'SearchEvent.clearPickedBook()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ClearPickedBookImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String query) searching,
    required TResult Function(Book pickedBook) suggestionPicked,
    required TResult Function() clearPickedBook,
    required TResult Function(String query) shareOffloaded,
    required TResult Function() resetShareOffloaded,
  }) {
    return clearPickedBook();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String query)? searching,
    TResult? Function(Book pickedBook)? suggestionPicked,
    TResult? Function()? clearPickedBook,
    TResult? Function(String query)? shareOffloaded,
    TResult? Function()? resetShareOffloaded,
  }) {
    return clearPickedBook?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String query)? searching,
    TResult Function(Book pickedBook)? suggestionPicked,
    TResult Function()? clearPickedBook,
    TResult Function(String query)? shareOffloaded,
    TResult Function()? resetShareOffloaded,
    required TResult orElse(),
  }) {
    if (clearPickedBook != null) {
      return clearPickedBook();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Searching value) searching,
    required TResult Function(SuggestionPicked value) suggestionPicked,
    required TResult Function(ClearPickedBook value) clearPickedBook,
    required TResult Function(ShareOffloaded value) shareOffloaded,
    required TResult Function(ResetShareOffload value) resetShareOffloaded,
  }) {
    return clearPickedBook(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Searching value)? searching,
    TResult? Function(SuggestionPicked value)? suggestionPicked,
    TResult? Function(ClearPickedBook value)? clearPickedBook,
    TResult? Function(ShareOffloaded value)? shareOffloaded,
    TResult? Function(ResetShareOffload value)? resetShareOffloaded,
  }) {
    return clearPickedBook?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Searching value)? searching,
    TResult Function(SuggestionPicked value)? suggestionPicked,
    TResult Function(ClearPickedBook value)? clearPickedBook,
    TResult Function(ShareOffloaded value)? shareOffloaded,
    TResult Function(ResetShareOffload value)? resetShareOffloaded,
    required TResult orElse(),
  }) {
    if (clearPickedBook != null) {
      return clearPickedBook(this);
    }
    return orElse();
  }
}

abstract class ClearPickedBook implements SearchEvent {
  const factory ClearPickedBook() = _$ClearPickedBookImpl;
}

/// @nodoc
abstract class _$$ShareOffloadedImplCopyWith<$Res> {
  factory _$$ShareOffloadedImplCopyWith(_$ShareOffloadedImpl value,
          $Res Function(_$ShareOffloadedImpl) then) =
      __$$ShareOffloadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String query});
}

/// @nodoc
class __$$ShareOffloadedImplCopyWithImpl<$Res>
    extends _$SearchEventCopyWithImpl<$Res, _$ShareOffloadedImpl>
    implements _$$ShareOffloadedImplCopyWith<$Res> {
  __$$ShareOffloadedImplCopyWithImpl(
      _$ShareOffloadedImpl _value, $Res Function(_$ShareOffloadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of SearchEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
  }) {
    return _then(_$ShareOffloadedImpl(
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ShareOffloadedImpl implements ShareOffloaded {
  const _$ShareOffloadedImpl({required this.query});

  @override
  final String query;

  @override
  String toString() {
    return 'SearchEvent.shareOffloaded(query: $query)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShareOffloadedImpl &&
            (identical(other.query, query) || other.query == query));
  }

  @override
  int get hashCode => Object.hash(runtimeType, query);

  /// Create a copy of SearchEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ShareOffloadedImplCopyWith<_$ShareOffloadedImpl> get copyWith =>
      __$$ShareOffloadedImplCopyWithImpl<_$ShareOffloadedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String query) searching,
    required TResult Function(Book pickedBook) suggestionPicked,
    required TResult Function() clearPickedBook,
    required TResult Function(String query) shareOffloaded,
    required TResult Function() resetShareOffloaded,
  }) {
    return shareOffloaded(query);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String query)? searching,
    TResult? Function(Book pickedBook)? suggestionPicked,
    TResult? Function()? clearPickedBook,
    TResult? Function(String query)? shareOffloaded,
    TResult? Function()? resetShareOffloaded,
  }) {
    return shareOffloaded?.call(query);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String query)? searching,
    TResult Function(Book pickedBook)? suggestionPicked,
    TResult Function()? clearPickedBook,
    TResult Function(String query)? shareOffloaded,
    TResult Function()? resetShareOffloaded,
    required TResult orElse(),
  }) {
    if (shareOffloaded != null) {
      return shareOffloaded(query);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Searching value) searching,
    required TResult Function(SuggestionPicked value) suggestionPicked,
    required TResult Function(ClearPickedBook value) clearPickedBook,
    required TResult Function(ShareOffloaded value) shareOffloaded,
    required TResult Function(ResetShareOffload value) resetShareOffloaded,
  }) {
    return shareOffloaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Searching value)? searching,
    TResult? Function(SuggestionPicked value)? suggestionPicked,
    TResult? Function(ClearPickedBook value)? clearPickedBook,
    TResult? Function(ShareOffloaded value)? shareOffloaded,
    TResult? Function(ResetShareOffload value)? resetShareOffloaded,
  }) {
    return shareOffloaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Searching value)? searching,
    TResult Function(SuggestionPicked value)? suggestionPicked,
    TResult Function(ClearPickedBook value)? clearPickedBook,
    TResult Function(ShareOffloaded value)? shareOffloaded,
    TResult Function(ResetShareOffload value)? resetShareOffloaded,
    required TResult orElse(),
  }) {
    if (shareOffloaded != null) {
      return shareOffloaded(this);
    }
    return orElse();
  }
}

abstract class ShareOffloaded implements SearchEvent {
  const factory ShareOffloaded({required final String query}) =
      _$ShareOffloadedImpl;

  String get query;

  /// Create a copy of SearchEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ShareOffloadedImplCopyWith<_$ShareOffloadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ResetShareOffloadImplCopyWith<$Res> {
  factory _$$ResetShareOffloadImplCopyWith(_$ResetShareOffloadImpl value,
          $Res Function(_$ResetShareOffloadImpl) then) =
      __$$ResetShareOffloadImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ResetShareOffloadImplCopyWithImpl<$Res>
    extends _$SearchEventCopyWithImpl<$Res, _$ResetShareOffloadImpl>
    implements _$$ResetShareOffloadImplCopyWith<$Res> {
  __$$ResetShareOffloadImplCopyWithImpl(_$ResetShareOffloadImpl _value,
      $Res Function(_$ResetShareOffloadImpl) _then)
      : super(_value, _then);

  /// Create a copy of SearchEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ResetShareOffloadImpl implements ResetShareOffload {
  const _$ResetShareOffloadImpl();

  @override
  String toString() {
    return 'SearchEvent.resetShareOffloaded()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ResetShareOffloadImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String query) searching,
    required TResult Function(Book pickedBook) suggestionPicked,
    required TResult Function() clearPickedBook,
    required TResult Function(String query) shareOffloaded,
    required TResult Function() resetShareOffloaded,
  }) {
    return resetShareOffloaded();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String query)? searching,
    TResult? Function(Book pickedBook)? suggestionPicked,
    TResult? Function()? clearPickedBook,
    TResult? Function(String query)? shareOffloaded,
    TResult? Function()? resetShareOffloaded,
  }) {
    return resetShareOffloaded?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String query)? searching,
    TResult Function(Book pickedBook)? suggestionPicked,
    TResult Function()? clearPickedBook,
    TResult Function(String query)? shareOffloaded,
    TResult Function()? resetShareOffloaded,
    required TResult orElse(),
  }) {
    if (resetShareOffloaded != null) {
      return resetShareOffloaded();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Searching value) searching,
    required TResult Function(SuggestionPicked value) suggestionPicked,
    required TResult Function(ClearPickedBook value) clearPickedBook,
    required TResult Function(ShareOffloaded value) shareOffloaded,
    required TResult Function(ResetShareOffload value) resetShareOffloaded,
  }) {
    return resetShareOffloaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Searching value)? searching,
    TResult? Function(SuggestionPicked value)? suggestionPicked,
    TResult? Function(ClearPickedBook value)? clearPickedBook,
    TResult? Function(ShareOffloaded value)? shareOffloaded,
    TResult? Function(ResetShareOffload value)? resetShareOffloaded,
  }) {
    return resetShareOffloaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Searching value)? searching,
    TResult Function(SuggestionPicked value)? suggestionPicked,
    TResult Function(ClearPickedBook value)? clearPickedBook,
    TResult Function(ShareOffloaded value)? shareOffloaded,
    TResult Function(ResetShareOffload value)? resetShareOffloaded,
    required TResult orElse(),
  }) {
    if (resetShareOffloaded != null) {
      return resetShareOffloaded(this);
    }
    return orElse();
  }
}

abstract class ResetShareOffload implements SearchEvent {
  const factory ResetShareOffload() = _$ResetShareOffloadImpl;
}
