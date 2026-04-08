// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'delete_books_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DeleteBooksState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeleteBooksState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DeleteBooksState()';
}


}

/// @nodoc
class $DeleteBooksStateCopyWith<$Res>  {
$DeleteBooksStateCopyWith(DeleteBooksState _, $Res Function(DeleteBooksState) __);
}


/// Adds pattern-matching-related methods to [DeleteBooksState].
extension DeleteBooksStatePatterns on DeleteBooksState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Initial value)?  initial,TResult Function( DeletionList value)?  deletionList,TResult Function( BooksRemoved value)?  booksRemoved,TResult Function( DeletionListCleared value)?  deletionListCleared,TResult Function( DeletionFailed value)?  deletionFailed,required TResult orElse(),}){
final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that);case DeletionList() when deletionList != null:
return deletionList(_that);case BooksRemoved() when booksRemoved != null:
return booksRemoved(_that);case DeletionListCleared() when deletionListCleared != null:
return deletionListCleared(_that);case DeletionFailed() when deletionFailed != null:
return deletionFailed(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Initial value)  initial,required TResult Function( DeletionList value)  deletionList,required TResult Function( BooksRemoved value)  booksRemoved,required TResult Function( DeletionListCleared value)  deletionListCleared,required TResult Function( DeletionFailed value)  deletionFailed,}){
final _that = this;
switch (_that) {
case Initial():
return initial(_that);case DeletionList():
return deletionList(_that);case BooksRemoved():
return booksRemoved(_that);case DeletionListCleared():
return deletionListCleared(_that);case DeletionFailed():
return deletionFailed(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Initial value)?  initial,TResult? Function( DeletionList value)?  deletionList,TResult? Function( BooksRemoved value)?  booksRemoved,TResult? Function( DeletionListCleared value)?  deletionListCleared,TResult? Function( DeletionFailed value)?  deletionFailed,}){
final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that);case DeletionList() when deletionList != null:
return deletionList(_that);case BooksRemoved() when booksRemoved != null:
return booksRemoved(_that);case DeletionListCleared() when deletionListCleared != null:
return deletionListCleared(_that);case DeletionFailed() when deletionFailed != null:
return deletionFailed(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( List<Book> deletionList)?  initial,TResult Function( List<Book> deletionList)?  deletionList,TResult Function()?  booksRemoved,TResult Function()?  deletionListCleared,TResult Function()?  deletionFailed,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that.deletionList);case DeletionList() when deletionList != null:
return deletionList(_that.deletionList);case BooksRemoved() when booksRemoved != null:
return booksRemoved();case DeletionListCleared() when deletionListCleared != null:
return deletionListCleared();case DeletionFailed() when deletionFailed != null:
return deletionFailed();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( List<Book> deletionList)  initial,required TResult Function( List<Book> deletionList)  deletionList,required TResult Function()  booksRemoved,required TResult Function()  deletionListCleared,required TResult Function()  deletionFailed,}) {final _that = this;
switch (_that) {
case Initial():
return initial(_that.deletionList);case DeletionList():
return deletionList(_that.deletionList);case BooksRemoved():
return booksRemoved();case DeletionListCleared():
return deletionListCleared();case DeletionFailed():
return deletionFailed();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( List<Book> deletionList)?  initial,TResult? Function( List<Book> deletionList)?  deletionList,TResult? Function()?  booksRemoved,TResult? Function()?  deletionListCleared,TResult? Function()?  deletionFailed,}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that.deletionList);case DeletionList() when deletionList != null:
return deletionList(_that.deletionList);case BooksRemoved() when booksRemoved != null:
return booksRemoved();case DeletionListCleared() when deletionListCleared != null:
return deletionListCleared();case DeletionFailed() when deletionFailed != null:
return deletionFailed();case _:
  return null;

}
}

}

/// @nodoc


class Initial extends DeleteBooksState {
  const Initial({final  List<Book> deletionList = const <Book>[]}): _deletionList = deletionList,super._();
  

 final  List<Book> _deletionList;
@JsonKey() List<Book> get deletionList {
  if (_deletionList is EqualUnmodifiableListView) return _deletionList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_deletionList);
}


/// Create a copy of DeleteBooksState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InitialCopyWith<Initial> get copyWith => _$InitialCopyWithImpl<Initial>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Initial&&const DeepCollectionEquality().equals(other._deletionList, _deletionList));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_deletionList));

@override
String toString() {
  return 'DeleteBooksState.initial(deletionList: $deletionList)';
}


}

/// @nodoc
abstract mixin class $InitialCopyWith<$Res> implements $DeleteBooksStateCopyWith<$Res> {
  factory $InitialCopyWith(Initial value, $Res Function(Initial) _then) = _$InitialCopyWithImpl;
@useResult
$Res call({
 List<Book> deletionList
});




}
/// @nodoc
class _$InitialCopyWithImpl<$Res>
    implements $InitialCopyWith<$Res> {
  _$InitialCopyWithImpl(this._self, this._then);

  final Initial _self;
  final $Res Function(Initial) _then;

/// Create a copy of DeleteBooksState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? deletionList = null,}) {
  return _then(Initial(
deletionList: null == deletionList ? _self._deletionList : deletionList // ignore: cast_nullable_to_non_nullable
as List<Book>,
  ));
}


}

/// @nodoc


class DeletionList extends DeleteBooksState {
  const DeletionList(final  List<Book> deletionList): _deletionList = deletionList,super._();
  

 final  List<Book> _deletionList;
 List<Book> get deletionList {
  if (_deletionList is EqualUnmodifiableListView) return _deletionList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_deletionList);
}


/// Create a copy of DeleteBooksState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeletionListCopyWith<DeletionList> get copyWith => _$DeletionListCopyWithImpl<DeletionList>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeletionList&&const DeepCollectionEquality().equals(other._deletionList, _deletionList));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_deletionList));

@override
String toString() {
  return 'DeleteBooksState.deletionList(deletionList: $deletionList)';
}


}

/// @nodoc
abstract mixin class $DeletionListCopyWith<$Res> implements $DeleteBooksStateCopyWith<$Res> {
  factory $DeletionListCopyWith(DeletionList value, $Res Function(DeletionList) _then) = _$DeletionListCopyWithImpl;
@useResult
$Res call({
 List<Book> deletionList
});




}
/// @nodoc
class _$DeletionListCopyWithImpl<$Res>
    implements $DeletionListCopyWith<$Res> {
  _$DeletionListCopyWithImpl(this._self, this._then);

  final DeletionList _self;
  final $Res Function(DeletionList) _then;

/// Create a copy of DeleteBooksState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? deletionList = null,}) {
  return _then(DeletionList(
null == deletionList ? _self._deletionList : deletionList // ignore: cast_nullable_to_non_nullable
as List<Book>,
  ));
}


}

/// @nodoc


class BooksRemoved extends DeleteBooksState {
  const BooksRemoved(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BooksRemoved);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DeleteBooksState.booksRemoved()';
}


}




/// @nodoc


class DeletionListCleared extends DeleteBooksState {
  const DeletionListCleared(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeletionListCleared);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DeleteBooksState.deletionListCleared()';
}


}




/// @nodoc


class DeletionFailed extends DeleteBooksState {
  const DeletionFailed(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeletionFailed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DeleteBooksState.deletionFailed()';
}


}




// dart format on
