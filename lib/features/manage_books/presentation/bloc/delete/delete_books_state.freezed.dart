// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'delete_books_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DeleteBooksState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Book> deletionList) initial,
    required TResult Function(List<Book> deletionList) deletionList,
    required TResult Function() booksRemoved,
    required TResult Function() deletionListCleared,
    required TResult Function() deletionFailed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Book> deletionList)? initial,
    TResult? Function(List<Book> deletionList)? deletionList,
    TResult? Function()? booksRemoved,
    TResult? Function()? deletionListCleared,
    TResult? Function()? deletionFailed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Book> deletionList)? initial,
    TResult Function(List<Book> deletionList)? deletionList,
    TResult Function()? booksRemoved,
    TResult Function()? deletionListCleared,
    TResult Function()? deletionFailed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(DeletionList value) deletionList,
    required TResult Function(BooksRemoved value) booksRemoved,
    required TResult Function(DeletionListCleared value) deletionListCleared,
    required TResult Function(DeletionFailed value) deletionFailed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(DeletionList value)? deletionList,
    TResult? Function(BooksRemoved value)? booksRemoved,
    TResult? Function(DeletionListCleared value)? deletionListCleared,
    TResult? Function(DeletionFailed value)? deletionFailed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(DeletionList value)? deletionList,
    TResult Function(BooksRemoved value)? booksRemoved,
    TResult Function(DeletionListCleared value)? deletionListCleared,
    TResult Function(DeletionFailed value)? deletionFailed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeleteBooksStateCopyWith<$Res> {
  factory $DeleteBooksStateCopyWith(
          DeleteBooksState value, $Res Function(DeleteBooksState) then) =
      _$DeleteBooksStateCopyWithImpl<$Res, DeleteBooksState>;
}

/// @nodoc
class _$DeleteBooksStateCopyWithImpl<$Res, $Val extends DeleteBooksState>
    implements $DeleteBooksStateCopyWith<$Res> {
  _$DeleteBooksStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DeleteBooksState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Book> deletionList});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$DeleteBooksStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of DeleteBooksState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deletionList = null,
  }) {
    return _then(_$InitialImpl(
      deletionList: null == deletionList
          ? _value._deletionList
          : deletionList // ignore: cast_nullable_to_non_nullable
              as List<Book>,
    ));
  }
}

/// @nodoc

class _$InitialImpl extends Initial {
  const _$InitialImpl({final List<Book> deletionList = const <Book>[]})
      : _deletionList = deletionList,
        super._();

  final List<Book> _deletionList;
  @override
  @JsonKey()
  List<Book> get deletionList {
    if (_deletionList is EqualUnmodifiableListView) return _deletionList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_deletionList);
  }

  @override
  String toString() {
    return 'DeleteBooksState.initial(deletionList: $deletionList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            const DeepCollectionEquality()
                .equals(other._deletionList, _deletionList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_deletionList));

  /// Create a copy of DeleteBooksState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Book> deletionList) initial,
    required TResult Function(List<Book> deletionList) deletionList,
    required TResult Function() booksRemoved,
    required TResult Function() deletionListCleared,
    required TResult Function() deletionFailed,
  }) {
    return initial(this.deletionList);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Book> deletionList)? initial,
    TResult? Function(List<Book> deletionList)? deletionList,
    TResult? Function()? booksRemoved,
    TResult? Function()? deletionListCleared,
    TResult? Function()? deletionFailed,
  }) {
    return initial?.call(this.deletionList);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Book> deletionList)? initial,
    TResult Function(List<Book> deletionList)? deletionList,
    TResult Function()? booksRemoved,
    TResult Function()? deletionListCleared,
    TResult Function()? deletionFailed,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this.deletionList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(DeletionList value) deletionList,
    required TResult Function(BooksRemoved value) booksRemoved,
    required TResult Function(DeletionListCleared value) deletionListCleared,
    required TResult Function(DeletionFailed value) deletionFailed,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(DeletionList value)? deletionList,
    TResult? Function(BooksRemoved value)? booksRemoved,
    TResult? Function(DeletionListCleared value)? deletionListCleared,
    TResult? Function(DeletionFailed value)? deletionFailed,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(DeletionList value)? deletionList,
    TResult Function(BooksRemoved value)? booksRemoved,
    TResult Function(DeletionListCleared value)? deletionListCleared,
    TResult Function(DeletionFailed value)? deletionFailed,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class Initial extends DeleteBooksState {
  const factory Initial({final List<Book> deletionList}) = _$InitialImpl;
  const Initial._() : super._();

  List<Book> get deletionList;

  /// Create a copy of DeleteBooksState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeletionListImplCopyWith<$Res> {
  factory _$$DeletionListImplCopyWith(
          _$DeletionListImpl value, $Res Function(_$DeletionListImpl) then) =
      __$$DeletionListImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Book> deletionList});
}

/// @nodoc
class __$$DeletionListImplCopyWithImpl<$Res>
    extends _$DeleteBooksStateCopyWithImpl<$Res, _$DeletionListImpl>
    implements _$$DeletionListImplCopyWith<$Res> {
  __$$DeletionListImplCopyWithImpl(
      _$DeletionListImpl _value, $Res Function(_$DeletionListImpl) _then)
      : super(_value, _then);

  /// Create a copy of DeleteBooksState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deletionList = null,
  }) {
    return _then(_$DeletionListImpl(
      null == deletionList
          ? _value._deletionList
          : deletionList // ignore: cast_nullable_to_non_nullable
              as List<Book>,
    ));
  }
}

/// @nodoc

class _$DeletionListImpl extends DeletionList {
  const _$DeletionListImpl(final List<Book> deletionList)
      : _deletionList = deletionList,
        super._();

  final List<Book> _deletionList;
  @override
  List<Book> get deletionList {
    if (_deletionList is EqualUnmodifiableListView) return _deletionList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_deletionList);
  }

  @override
  String toString() {
    return 'DeleteBooksState.deletionList(deletionList: $deletionList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeletionListImpl &&
            const DeepCollectionEquality()
                .equals(other._deletionList, _deletionList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_deletionList));

  /// Create a copy of DeleteBooksState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeletionListImplCopyWith<_$DeletionListImpl> get copyWith =>
      __$$DeletionListImplCopyWithImpl<_$DeletionListImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Book> deletionList) initial,
    required TResult Function(List<Book> deletionList) deletionList,
    required TResult Function() booksRemoved,
    required TResult Function() deletionListCleared,
    required TResult Function() deletionFailed,
  }) {
    return deletionList(this.deletionList);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Book> deletionList)? initial,
    TResult? Function(List<Book> deletionList)? deletionList,
    TResult? Function()? booksRemoved,
    TResult? Function()? deletionListCleared,
    TResult? Function()? deletionFailed,
  }) {
    return deletionList?.call(this.deletionList);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Book> deletionList)? initial,
    TResult Function(List<Book> deletionList)? deletionList,
    TResult Function()? booksRemoved,
    TResult Function()? deletionListCleared,
    TResult Function()? deletionFailed,
    required TResult orElse(),
  }) {
    if (deletionList != null) {
      return deletionList(this.deletionList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(DeletionList value) deletionList,
    required TResult Function(BooksRemoved value) booksRemoved,
    required TResult Function(DeletionListCleared value) deletionListCleared,
    required TResult Function(DeletionFailed value) deletionFailed,
  }) {
    return deletionList(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(DeletionList value)? deletionList,
    TResult? Function(BooksRemoved value)? booksRemoved,
    TResult? Function(DeletionListCleared value)? deletionListCleared,
    TResult? Function(DeletionFailed value)? deletionFailed,
  }) {
    return deletionList?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(DeletionList value)? deletionList,
    TResult Function(BooksRemoved value)? booksRemoved,
    TResult Function(DeletionListCleared value)? deletionListCleared,
    TResult Function(DeletionFailed value)? deletionFailed,
    required TResult orElse(),
  }) {
    if (deletionList != null) {
      return deletionList(this);
    }
    return orElse();
  }
}

abstract class DeletionList extends DeleteBooksState {
  const factory DeletionList(final List<Book> deletionList) =
      _$DeletionListImpl;
  const DeletionList._() : super._();

  List<Book> get deletionList;

  /// Create a copy of DeleteBooksState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeletionListImplCopyWith<_$DeletionListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BooksRemovedImplCopyWith<$Res> {
  factory _$$BooksRemovedImplCopyWith(
          _$BooksRemovedImpl value, $Res Function(_$BooksRemovedImpl) then) =
      __$$BooksRemovedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$BooksRemovedImplCopyWithImpl<$Res>
    extends _$DeleteBooksStateCopyWithImpl<$Res, _$BooksRemovedImpl>
    implements _$$BooksRemovedImplCopyWith<$Res> {
  __$$BooksRemovedImplCopyWithImpl(
      _$BooksRemovedImpl _value, $Res Function(_$BooksRemovedImpl) _then)
      : super(_value, _then);

  /// Create a copy of DeleteBooksState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$BooksRemovedImpl extends BooksRemoved {
  const _$BooksRemovedImpl() : super._();

  @override
  String toString() {
    return 'DeleteBooksState.booksRemoved()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$BooksRemovedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Book> deletionList) initial,
    required TResult Function(List<Book> deletionList) deletionList,
    required TResult Function() booksRemoved,
    required TResult Function() deletionListCleared,
    required TResult Function() deletionFailed,
  }) {
    return booksRemoved();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Book> deletionList)? initial,
    TResult? Function(List<Book> deletionList)? deletionList,
    TResult? Function()? booksRemoved,
    TResult? Function()? deletionListCleared,
    TResult? Function()? deletionFailed,
  }) {
    return booksRemoved?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Book> deletionList)? initial,
    TResult Function(List<Book> deletionList)? deletionList,
    TResult Function()? booksRemoved,
    TResult Function()? deletionListCleared,
    TResult Function()? deletionFailed,
    required TResult orElse(),
  }) {
    if (booksRemoved != null) {
      return booksRemoved();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(DeletionList value) deletionList,
    required TResult Function(BooksRemoved value) booksRemoved,
    required TResult Function(DeletionListCleared value) deletionListCleared,
    required TResult Function(DeletionFailed value) deletionFailed,
  }) {
    return booksRemoved(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(DeletionList value)? deletionList,
    TResult? Function(BooksRemoved value)? booksRemoved,
    TResult? Function(DeletionListCleared value)? deletionListCleared,
    TResult? Function(DeletionFailed value)? deletionFailed,
  }) {
    return booksRemoved?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(DeletionList value)? deletionList,
    TResult Function(BooksRemoved value)? booksRemoved,
    TResult Function(DeletionListCleared value)? deletionListCleared,
    TResult Function(DeletionFailed value)? deletionFailed,
    required TResult orElse(),
  }) {
    if (booksRemoved != null) {
      return booksRemoved(this);
    }
    return orElse();
  }
}

abstract class BooksRemoved extends DeleteBooksState {
  const factory BooksRemoved() = _$BooksRemovedImpl;
  const BooksRemoved._() : super._();
}

/// @nodoc
abstract class _$$DeletionListClearedImplCopyWith<$Res> {
  factory _$$DeletionListClearedImplCopyWith(_$DeletionListClearedImpl value,
          $Res Function(_$DeletionListClearedImpl) then) =
      __$$DeletionListClearedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DeletionListClearedImplCopyWithImpl<$Res>
    extends _$DeleteBooksStateCopyWithImpl<$Res, _$DeletionListClearedImpl>
    implements _$$DeletionListClearedImplCopyWith<$Res> {
  __$$DeletionListClearedImplCopyWithImpl(_$DeletionListClearedImpl _value,
      $Res Function(_$DeletionListClearedImpl) _then)
      : super(_value, _then);

  /// Create a copy of DeleteBooksState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$DeletionListClearedImpl extends DeletionListCleared {
  const _$DeletionListClearedImpl() : super._();

  @override
  String toString() {
    return 'DeleteBooksState.deletionListCleared()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeletionListClearedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Book> deletionList) initial,
    required TResult Function(List<Book> deletionList) deletionList,
    required TResult Function() booksRemoved,
    required TResult Function() deletionListCleared,
    required TResult Function() deletionFailed,
  }) {
    return deletionListCleared();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Book> deletionList)? initial,
    TResult? Function(List<Book> deletionList)? deletionList,
    TResult? Function()? booksRemoved,
    TResult? Function()? deletionListCleared,
    TResult? Function()? deletionFailed,
  }) {
    return deletionListCleared?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Book> deletionList)? initial,
    TResult Function(List<Book> deletionList)? deletionList,
    TResult Function()? booksRemoved,
    TResult Function()? deletionListCleared,
    TResult Function()? deletionFailed,
    required TResult orElse(),
  }) {
    if (deletionListCleared != null) {
      return deletionListCleared();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(DeletionList value) deletionList,
    required TResult Function(BooksRemoved value) booksRemoved,
    required TResult Function(DeletionListCleared value) deletionListCleared,
    required TResult Function(DeletionFailed value) deletionFailed,
  }) {
    return deletionListCleared(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(DeletionList value)? deletionList,
    TResult? Function(BooksRemoved value)? booksRemoved,
    TResult? Function(DeletionListCleared value)? deletionListCleared,
    TResult? Function(DeletionFailed value)? deletionFailed,
  }) {
    return deletionListCleared?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(DeletionList value)? deletionList,
    TResult Function(BooksRemoved value)? booksRemoved,
    TResult Function(DeletionListCleared value)? deletionListCleared,
    TResult Function(DeletionFailed value)? deletionFailed,
    required TResult orElse(),
  }) {
    if (deletionListCleared != null) {
      return deletionListCleared(this);
    }
    return orElse();
  }
}

abstract class DeletionListCleared extends DeleteBooksState {
  const factory DeletionListCleared() = _$DeletionListClearedImpl;
  const DeletionListCleared._() : super._();
}

/// @nodoc
abstract class _$$DeletionFailedImplCopyWith<$Res> {
  factory _$$DeletionFailedImplCopyWith(_$DeletionFailedImpl value,
          $Res Function(_$DeletionFailedImpl) then) =
      __$$DeletionFailedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DeletionFailedImplCopyWithImpl<$Res>
    extends _$DeleteBooksStateCopyWithImpl<$Res, _$DeletionFailedImpl>
    implements _$$DeletionFailedImplCopyWith<$Res> {
  __$$DeletionFailedImplCopyWithImpl(
      _$DeletionFailedImpl _value, $Res Function(_$DeletionFailedImpl) _then)
      : super(_value, _then);

  /// Create a copy of DeleteBooksState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$DeletionFailedImpl extends DeletionFailed {
  const _$DeletionFailedImpl() : super._();

  @override
  String toString() {
    return 'DeleteBooksState.deletionFailed()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$DeletionFailedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Book> deletionList) initial,
    required TResult Function(List<Book> deletionList) deletionList,
    required TResult Function() booksRemoved,
    required TResult Function() deletionListCleared,
    required TResult Function() deletionFailed,
  }) {
    return deletionFailed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Book> deletionList)? initial,
    TResult? Function(List<Book> deletionList)? deletionList,
    TResult? Function()? booksRemoved,
    TResult? Function()? deletionListCleared,
    TResult? Function()? deletionFailed,
  }) {
    return deletionFailed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Book> deletionList)? initial,
    TResult Function(List<Book> deletionList)? deletionList,
    TResult Function()? booksRemoved,
    TResult Function()? deletionListCleared,
    TResult Function()? deletionFailed,
    required TResult orElse(),
  }) {
    if (deletionFailed != null) {
      return deletionFailed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(DeletionList value) deletionList,
    required TResult Function(BooksRemoved value) booksRemoved,
    required TResult Function(DeletionListCleared value) deletionListCleared,
    required TResult Function(DeletionFailed value) deletionFailed,
  }) {
    return deletionFailed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(DeletionList value)? deletionList,
    TResult? Function(BooksRemoved value)? booksRemoved,
    TResult? Function(DeletionListCleared value)? deletionListCleared,
    TResult? Function(DeletionFailed value)? deletionFailed,
  }) {
    return deletionFailed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(DeletionList value)? deletionList,
    TResult Function(BooksRemoved value)? booksRemoved,
    TResult Function(DeletionListCleared value)? deletionListCleared,
    TResult Function(DeletionFailed value)? deletionFailed,
    required TResult orElse(),
  }) {
    if (deletionFailed != null) {
      return deletionFailed(this);
    }
    return orElse();
  }
}

abstract class DeletionFailed extends DeleteBooksState {
  const factory DeletionFailed() = _$DeletionFailedImpl;
  const DeletionFailed._() : super._();
}
