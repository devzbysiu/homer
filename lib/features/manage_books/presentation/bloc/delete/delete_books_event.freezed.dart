// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'delete_books_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DeleteBooksEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeleteBooksEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DeleteBooksEvent()';
}


}

/// @nodoc
class $DeleteBooksEventCopyWith<$Res>  {
$DeleteBooksEventCopyWith(DeleteBooksEvent _, $Res Function(DeleteBooksEvent) __);
}


/// Adds pattern-matching-related methods to [DeleteBooksEvent].
extension DeleteBooksEventPatterns on DeleteBooksEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( DeletePickedBooks value)?  deletePickedBooks,TResult Function( ClearDeletionList value)?  clearDeletionList,TResult Function( DeleteModeToggled value)?  deleteModeToggled,required TResult orElse(),}){
final _that = this;
switch (_that) {
case DeletePickedBooks() when deletePickedBooks != null:
return deletePickedBooks(_that);case ClearDeletionList() when clearDeletionList != null:
return clearDeletionList(_that);case DeleteModeToggled() when deleteModeToggled != null:
return deleteModeToggled(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( DeletePickedBooks value)  deletePickedBooks,required TResult Function( ClearDeletionList value)  clearDeletionList,required TResult Function( DeleteModeToggled value)  deleteModeToggled,}){
final _that = this;
switch (_that) {
case DeletePickedBooks():
return deletePickedBooks(_that);case ClearDeletionList():
return clearDeletionList(_that);case DeleteModeToggled():
return deleteModeToggled(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( DeletePickedBooks value)?  deletePickedBooks,TResult? Function( ClearDeletionList value)?  clearDeletionList,TResult? Function( DeleteModeToggled value)?  deleteModeToggled,}){
final _that = this;
switch (_that) {
case DeletePickedBooks() when deletePickedBooks != null:
return deletePickedBooks(_that);case ClearDeletionList() when clearDeletionList != null:
return clearDeletionList(_that);case DeleteModeToggled() when deleteModeToggled != null:
return deleteModeToggled(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  deletePickedBooks,TResult Function()?  clearDeletionList,TResult Function( Book book)?  deleteModeToggled,required TResult orElse(),}) {final _that = this;
switch (_that) {
case DeletePickedBooks() when deletePickedBooks != null:
return deletePickedBooks();case ClearDeletionList() when clearDeletionList != null:
return clearDeletionList();case DeleteModeToggled() when deleteModeToggled != null:
return deleteModeToggled(_that.book);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  deletePickedBooks,required TResult Function()  clearDeletionList,required TResult Function( Book book)  deleteModeToggled,}) {final _that = this;
switch (_that) {
case DeletePickedBooks():
return deletePickedBooks();case ClearDeletionList():
return clearDeletionList();case DeleteModeToggled():
return deleteModeToggled(_that.book);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  deletePickedBooks,TResult? Function()?  clearDeletionList,TResult? Function( Book book)?  deleteModeToggled,}) {final _that = this;
switch (_that) {
case DeletePickedBooks() when deletePickedBooks != null:
return deletePickedBooks();case ClearDeletionList() when clearDeletionList != null:
return clearDeletionList();case DeleteModeToggled() when deleteModeToggled != null:
return deleteModeToggled(_that.book);case _:
  return null;

}
}

}

/// @nodoc


class DeletePickedBooks implements DeleteBooksEvent {
  const DeletePickedBooks();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeletePickedBooks);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DeleteBooksEvent.deletePickedBooks()';
}


}




/// @nodoc


class ClearDeletionList implements DeleteBooksEvent {
  const ClearDeletionList();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClearDeletionList);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DeleteBooksEvent.clearDeletionList()';
}


}




/// @nodoc


class DeleteModeToggled implements DeleteBooksEvent {
  const DeleteModeToggled(this.book);
  

 final  Book book;

/// Create a copy of DeleteBooksEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeleteModeToggledCopyWith<DeleteModeToggled> get copyWith => _$DeleteModeToggledCopyWithImpl<DeleteModeToggled>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeleteModeToggled&&(identical(other.book, book) || other.book == book));
}


@override
int get hashCode => Object.hash(runtimeType,book);

@override
String toString() {
  return 'DeleteBooksEvent.deleteModeToggled(book: $book)';
}


}

/// @nodoc
abstract mixin class $DeleteModeToggledCopyWith<$Res> implements $DeleteBooksEventCopyWith<$Res> {
  factory $DeleteModeToggledCopyWith(DeleteModeToggled value, $Res Function(DeleteModeToggled) _then) = _$DeleteModeToggledCopyWithImpl;
@useResult
$Res call({
 Book book
});


$BookCopyWith<$Res> get book;

}
/// @nodoc
class _$DeleteModeToggledCopyWithImpl<$Res>
    implements $DeleteModeToggledCopyWith<$Res> {
  _$DeleteModeToggledCopyWithImpl(this._self, this._then);

  final DeleteModeToggled _self;
  final $Res Function(DeleteModeToggled) _then;

/// Create a copy of DeleteBooksEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? book = null,}) {
  return _then(DeleteModeToggled(
null == book ? _self.book : book // ignore: cast_nullable_to_non_nullable
as Book,
  ));
}

/// Create a copy of DeleteBooksEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BookCopyWith<$Res> get book {
  
  return $BookCopyWith<$Res>(_self.book, (value) {
    return _then(_self.copyWith(book: value));
  });
}
}

// dart format on
