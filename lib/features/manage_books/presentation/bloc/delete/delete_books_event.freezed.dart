// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'delete_books_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DeleteBooksEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() deletePickedBooks,
    required TResult Function() clearDeletionList,
    required TResult Function(Book book) deleteModeToggled,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? deletePickedBooks,
    TResult? Function()? clearDeletionList,
    TResult? Function(Book book)? deleteModeToggled,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? deletePickedBooks,
    TResult Function()? clearDeletionList,
    TResult Function(Book book)? deleteModeToggled,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DeletePickedBooks value) deletePickedBooks,
    required TResult Function(ClearDeletionList value) clearDeletionList,
    required TResult Function(DeleteModeToggled value) deleteModeToggled,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DeletePickedBooks value)? deletePickedBooks,
    TResult? Function(ClearDeletionList value)? clearDeletionList,
    TResult? Function(DeleteModeToggled value)? deleteModeToggled,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeletePickedBooks value)? deletePickedBooks,
    TResult Function(ClearDeletionList value)? clearDeletionList,
    TResult Function(DeleteModeToggled value)? deleteModeToggled,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeleteBooksEventCopyWith<$Res> {
  factory $DeleteBooksEventCopyWith(
          DeleteBooksEvent value, $Res Function(DeleteBooksEvent) then) =
      _$DeleteBooksEventCopyWithImpl<$Res, DeleteBooksEvent>;
}

/// @nodoc
class _$DeleteBooksEventCopyWithImpl<$Res, $Val extends DeleteBooksEvent>
    implements $DeleteBooksEventCopyWith<$Res> {
  _$DeleteBooksEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DeleteBooksEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$DeletePickedBooksImplCopyWith<$Res> {
  factory _$$DeletePickedBooksImplCopyWith(_$DeletePickedBooksImpl value,
          $Res Function(_$DeletePickedBooksImpl) then) =
      __$$DeletePickedBooksImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DeletePickedBooksImplCopyWithImpl<$Res>
    extends _$DeleteBooksEventCopyWithImpl<$Res, _$DeletePickedBooksImpl>
    implements _$$DeletePickedBooksImplCopyWith<$Res> {
  __$$DeletePickedBooksImplCopyWithImpl(_$DeletePickedBooksImpl _value,
      $Res Function(_$DeletePickedBooksImpl) _then)
      : super(_value, _then);

  /// Create a copy of DeleteBooksEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$DeletePickedBooksImpl implements DeletePickedBooks {
  const _$DeletePickedBooksImpl();

  @override
  String toString() {
    return 'DeleteBooksEvent.deletePickedBooks()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$DeletePickedBooksImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() deletePickedBooks,
    required TResult Function() clearDeletionList,
    required TResult Function(Book book) deleteModeToggled,
  }) {
    return deletePickedBooks();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? deletePickedBooks,
    TResult? Function()? clearDeletionList,
    TResult? Function(Book book)? deleteModeToggled,
  }) {
    return deletePickedBooks?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? deletePickedBooks,
    TResult Function()? clearDeletionList,
    TResult Function(Book book)? deleteModeToggled,
    required TResult orElse(),
  }) {
    if (deletePickedBooks != null) {
      return deletePickedBooks();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DeletePickedBooks value) deletePickedBooks,
    required TResult Function(ClearDeletionList value) clearDeletionList,
    required TResult Function(DeleteModeToggled value) deleteModeToggled,
  }) {
    return deletePickedBooks(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DeletePickedBooks value)? deletePickedBooks,
    TResult? Function(ClearDeletionList value)? clearDeletionList,
    TResult? Function(DeleteModeToggled value)? deleteModeToggled,
  }) {
    return deletePickedBooks?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeletePickedBooks value)? deletePickedBooks,
    TResult Function(ClearDeletionList value)? clearDeletionList,
    TResult Function(DeleteModeToggled value)? deleteModeToggled,
    required TResult orElse(),
  }) {
    if (deletePickedBooks != null) {
      return deletePickedBooks(this);
    }
    return orElse();
  }
}

abstract class DeletePickedBooks implements DeleteBooksEvent {
  const factory DeletePickedBooks() = _$DeletePickedBooksImpl;
}

/// @nodoc
abstract class _$$ClearDeletionListImplCopyWith<$Res> {
  factory _$$ClearDeletionListImplCopyWith(_$ClearDeletionListImpl value,
          $Res Function(_$ClearDeletionListImpl) then) =
      __$$ClearDeletionListImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ClearDeletionListImplCopyWithImpl<$Res>
    extends _$DeleteBooksEventCopyWithImpl<$Res, _$ClearDeletionListImpl>
    implements _$$ClearDeletionListImplCopyWith<$Res> {
  __$$ClearDeletionListImplCopyWithImpl(_$ClearDeletionListImpl _value,
      $Res Function(_$ClearDeletionListImpl) _then)
      : super(_value, _then);

  /// Create a copy of DeleteBooksEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ClearDeletionListImpl implements ClearDeletionList {
  const _$ClearDeletionListImpl();

  @override
  String toString() {
    return 'DeleteBooksEvent.clearDeletionList()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ClearDeletionListImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() deletePickedBooks,
    required TResult Function() clearDeletionList,
    required TResult Function(Book book) deleteModeToggled,
  }) {
    return clearDeletionList();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? deletePickedBooks,
    TResult? Function()? clearDeletionList,
    TResult? Function(Book book)? deleteModeToggled,
  }) {
    return clearDeletionList?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? deletePickedBooks,
    TResult Function()? clearDeletionList,
    TResult Function(Book book)? deleteModeToggled,
    required TResult orElse(),
  }) {
    if (clearDeletionList != null) {
      return clearDeletionList();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DeletePickedBooks value) deletePickedBooks,
    required TResult Function(ClearDeletionList value) clearDeletionList,
    required TResult Function(DeleteModeToggled value) deleteModeToggled,
  }) {
    return clearDeletionList(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DeletePickedBooks value)? deletePickedBooks,
    TResult? Function(ClearDeletionList value)? clearDeletionList,
    TResult? Function(DeleteModeToggled value)? deleteModeToggled,
  }) {
    return clearDeletionList?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeletePickedBooks value)? deletePickedBooks,
    TResult Function(ClearDeletionList value)? clearDeletionList,
    TResult Function(DeleteModeToggled value)? deleteModeToggled,
    required TResult orElse(),
  }) {
    if (clearDeletionList != null) {
      return clearDeletionList(this);
    }
    return orElse();
  }
}

abstract class ClearDeletionList implements DeleteBooksEvent {
  const factory ClearDeletionList() = _$ClearDeletionListImpl;
}

/// @nodoc
abstract class _$$DeleteModeToggledImplCopyWith<$Res> {
  factory _$$DeleteModeToggledImplCopyWith(_$DeleteModeToggledImpl value,
          $Res Function(_$DeleteModeToggledImpl) then) =
      __$$DeleteModeToggledImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Book book});
}

/// @nodoc
class __$$DeleteModeToggledImplCopyWithImpl<$Res>
    extends _$DeleteBooksEventCopyWithImpl<$Res, _$DeleteModeToggledImpl>
    implements _$$DeleteModeToggledImplCopyWith<$Res> {
  __$$DeleteModeToggledImplCopyWithImpl(_$DeleteModeToggledImpl _value,
      $Res Function(_$DeleteModeToggledImpl) _then)
      : super(_value, _then);

  /// Create a copy of DeleteBooksEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? book = null,
  }) {
    return _then(_$DeleteModeToggledImpl(
      null == book
          ? _value.book
          : book // ignore: cast_nullable_to_non_nullable
              as Book,
    ));
  }
}

/// @nodoc

class _$DeleteModeToggledImpl implements DeleteModeToggled {
  const _$DeleteModeToggledImpl(this.book);

  @override
  final Book book;

  @override
  String toString() {
    return 'DeleteBooksEvent.deleteModeToggled(book: $book)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteModeToggledImpl &&
            (identical(other.book, book) || other.book == book));
  }

  @override
  int get hashCode => Object.hash(runtimeType, book);

  /// Create a copy of DeleteBooksEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteModeToggledImplCopyWith<_$DeleteModeToggledImpl> get copyWith =>
      __$$DeleteModeToggledImplCopyWithImpl<_$DeleteModeToggledImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() deletePickedBooks,
    required TResult Function() clearDeletionList,
    required TResult Function(Book book) deleteModeToggled,
  }) {
    return deleteModeToggled(book);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? deletePickedBooks,
    TResult? Function()? clearDeletionList,
    TResult? Function(Book book)? deleteModeToggled,
  }) {
    return deleteModeToggled?.call(book);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? deletePickedBooks,
    TResult Function()? clearDeletionList,
    TResult Function(Book book)? deleteModeToggled,
    required TResult orElse(),
  }) {
    if (deleteModeToggled != null) {
      return deleteModeToggled(book);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DeletePickedBooks value) deletePickedBooks,
    required TResult Function(ClearDeletionList value) clearDeletionList,
    required TResult Function(DeleteModeToggled value) deleteModeToggled,
  }) {
    return deleteModeToggled(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DeletePickedBooks value)? deletePickedBooks,
    TResult? Function(ClearDeletionList value)? clearDeletionList,
    TResult? Function(DeleteModeToggled value)? deleteModeToggled,
  }) {
    return deleteModeToggled?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeletePickedBooks value)? deletePickedBooks,
    TResult Function(ClearDeletionList value)? clearDeletionList,
    TResult Function(DeleteModeToggled value)? deleteModeToggled,
    required TResult orElse(),
  }) {
    if (deleteModeToggled != null) {
      return deleteModeToggled(this);
    }
    return orElse();
  }
}

abstract class DeleteModeToggled implements DeleteBooksEvent {
  const factory DeleteModeToggled(final Book book) = _$DeleteModeToggledImpl;

  Book get book;

  /// Create a copy of DeleteBooksEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeleteModeToggledImplCopyWith<_$DeleteModeToggledImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
