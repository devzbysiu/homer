// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'book.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Book {

 int? get id; String get title; String get subtitle; List<String> get authors; BookState get state; int get pageCount; String get isbn; Option<String> get thumbnailAddress; double get rating; Option<String> get summary; List<Tag> get tags; Option<DateTime> get startDate; Option<DateTime> get endDate; bool get alreadySaved;
/// Create a copy of Book
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookCopyWith<Book> get copyWith => _$BookCopyWithImpl<Book>(this as Book, _$identity);







}

/// @nodoc
abstract mixin class $BookCopyWith<$Res>  {
  factory $BookCopyWith(Book value, $Res Function(Book) _then) = _$BookCopyWithImpl;
@useResult
$Res call({
 int? id, String title, String subtitle, List<String> authors, BookState state, int pageCount, String isbn, Option<String> thumbnailAddress, double rating, Option<String> summary, List<Tag> tags, Option<DateTime> startDate, Option<DateTime> endDate, bool alreadySaved
});




}
/// @nodoc
class _$BookCopyWithImpl<$Res>
    implements $BookCopyWith<$Res> {
  _$BookCopyWithImpl(this._self, this._then);

  final Book _self;
  final $Res Function(Book) _then;

/// Create a copy of Book
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? title = null,Object? subtitle = null,Object? authors = null,Object? state = null,Object? pageCount = null,Object? isbn = null,Object? thumbnailAddress = null,Object? rating = null,Object? summary = null,Object? tags = null,Object? startDate = null,Object? endDate = null,Object? alreadySaved = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,subtitle: null == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as String,authors: null == authors ? _self.authors : authors // ignore: cast_nullable_to_non_nullable
as List<String>,state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as BookState,pageCount: null == pageCount ? _self.pageCount : pageCount // ignore: cast_nullable_to_non_nullable
as int,isbn: null == isbn ? _self.isbn : isbn // ignore: cast_nullable_to_non_nullable
as String,thumbnailAddress: null == thumbnailAddress ? _self.thumbnailAddress : thumbnailAddress // ignore: cast_nullable_to_non_nullable
as Option<String>,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double,summary: null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as Option<String>,tags: null == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<Tag>,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as Option<DateTime>,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as Option<DateTime>,alreadySaved: null == alreadySaved ? _self.alreadySaved : alreadySaved // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [Book].
extension BookPatterns on Book {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Book value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Book() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Book value)  $default,){
final _that = this;
switch (_that) {
case _Book():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Book value)?  $default,){
final _that = this;
switch (_that) {
case _Book() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  String title,  String subtitle,  List<String> authors,  BookState state,  int pageCount,  String isbn,  Option<String> thumbnailAddress,  double rating,  Option<String> summary,  List<Tag> tags,  Option<DateTime> startDate,  Option<DateTime> endDate,  bool alreadySaved)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Book() when $default != null:
return $default(_that.id,_that.title,_that.subtitle,_that.authors,_that.state,_that.pageCount,_that.isbn,_that.thumbnailAddress,_that.rating,_that.summary,_that.tags,_that.startDate,_that.endDate,_that.alreadySaved);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  String title,  String subtitle,  List<String> authors,  BookState state,  int pageCount,  String isbn,  Option<String> thumbnailAddress,  double rating,  Option<String> summary,  List<Tag> tags,  Option<DateTime> startDate,  Option<DateTime> endDate,  bool alreadySaved)  $default,) {final _that = this;
switch (_that) {
case _Book():
return $default(_that.id,_that.title,_that.subtitle,_that.authors,_that.state,_that.pageCount,_that.isbn,_that.thumbnailAddress,_that.rating,_that.summary,_that.tags,_that.startDate,_that.endDate,_that.alreadySaved);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  String title,  String subtitle,  List<String> authors,  BookState state,  int pageCount,  String isbn,  Option<String> thumbnailAddress,  double rating,  Option<String> summary,  List<Tag> tags,  Option<DateTime> startDate,  Option<DateTime> endDate,  bool alreadySaved)?  $default,) {final _that = this;
switch (_that) {
case _Book() when $default != null:
return $default(_that.id,_that.title,_that.subtitle,_that.authors,_that.state,_that.pageCount,_that.isbn,_that.thumbnailAddress,_that.rating,_that.summary,_that.tags,_that.startDate,_that.endDate,_that.alreadySaved);case _:
  return null;

}
}

}

/// @nodoc


class _Book extends Book {
  const _Book({this.id, required this.title, required this.subtitle, required final  List<String> authors, required this.state, required this.pageCount, required this.isbn, required this.thumbnailAddress, required this.rating, required this.summary, required final  List<Tag> tags, required this.startDate, required this.endDate, required this.alreadySaved}): _authors = authors,_tags = tags,super._();
  

@override final  int? id;
@override final  String title;
@override final  String subtitle;
 final  List<String> _authors;
@override List<String> get authors {
  if (_authors is EqualUnmodifiableListView) return _authors;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_authors);
}

@override final  BookState state;
@override final  int pageCount;
@override final  String isbn;
@override final  Option<String> thumbnailAddress;
@override final  double rating;
@override final  Option<String> summary;
 final  List<Tag> _tags;
@override List<Tag> get tags {
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tags);
}

@override final  Option<DateTime> startDate;
@override final  Option<DateTime> endDate;
@override final  bool alreadySaved;

/// Create a copy of Book
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookCopyWith<_Book> get copyWith => __$BookCopyWithImpl<_Book>(this, _$identity);







}

/// @nodoc
abstract mixin class _$BookCopyWith<$Res> implements $BookCopyWith<$Res> {
  factory _$BookCopyWith(_Book value, $Res Function(_Book) _then) = __$BookCopyWithImpl;
@override @useResult
$Res call({
 int? id, String title, String subtitle, List<String> authors, BookState state, int pageCount, String isbn, Option<String> thumbnailAddress, double rating, Option<String> summary, List<Tag> tags, Option<DateTime> startDate, Option<DateTime> endDate, bool alreadySaved
});




}
/// @nodoc
class __$BookCopyWithImpl<$Res>
    implements _$BookCopyWith<$Res> {
  __$BookCopyWithImpl(this._self, this._then);

  final _Book _self;
  final $Res Function(_Book) _then;

/// Create a copy of Book
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? title = null,Object? subtitle = null,Object? authors = null,Object? state = null,Object? pageCount = null,Object? isbn = null,Object? thumbnailAddress = null,Object? rating = null,Object? summary = null,Object? tags = null,Object? startDate = null,Object? endDate = null,Object? alreadySaved = null,}) {
  return _then(_Book(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,subtitle: null == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as String,authors: null == authors ? _self._authors : authors // ignore: cast_nullable_to_non_nullable
as List<String>,state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as BookState,pageCount: null == pageCount ? _self.pageCount : pageCount // ignore: cast_nullable_to_non_nullable
as int,isbn: null == isbn ? _self.isbn : isbn // ignore: cast_nullable_to_non_nullable
as String,thumbnailAddress: null == thumbnailAddress ? _self.thumbnailAddress : thumbnailAddress // ignore: cast_nullable_to_non_nullable
as Option<String>,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double,summary: null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as Option<String>,tags: null == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<Tag>,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as Option<DateTime>,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as Option<DateTime>,alreadySaved: null == alreadySaved ? _self.alreadySaved : alreadySaved // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
mixin _$ComparableBookState {

 BookState get state;
/// Create a copy of ComparableBookState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ComparableBookStateCopyWith<ComparableBookState> get copyWith => _$ComparableBookStateCopyWithImpl<ComparableBookState>(this as ComparableBookState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ComparableBookState&&(identical(other.state, state) || other.state == state));
}


@override
int get hashCode => Object.hash(runtimeType,state);

@override
String toString() {
  return 'ComparableBookState(state: $state)';
}


}

/// @nodoc
abstract mixin class $ComparableBookStateCopyWith<$Res>  {
  factory $ComparableBookStateCopyWith(ComparableBookState value, $Res Function(ComparableBookState) _then) = _$ComparableBookStateCopyWithImpl;
@useResult
$Res call({
 BookState state
});




}
/// @nodoc
class _$ComparableBookStateCopyWithImpl<$Res>
    implements $ComparableBookStateCopyWith<$Res> {
  _$ComparableBookStateCopyWithImpl(this._self, this._then);

  final ComparableBookState _self;
  final $Res Function(ComparableBookState) _then;

/// Create a copy of ComparableBookState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? state = null,}) {
  return _then(_self.copyWith(
state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as BookState,
  ));
}

}


/// Adds pattern-matching-related methods to [ComparableBookState].
extension ComparableBookStatePatterns on ComparableBookState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ComparableBookState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ComparableBookState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ComparableBookState value)  $default,){
final _that = this;
switch (_that) {
case _ComparableBookState():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ComparableBookState value)?  $default,){
final _that = this;
switch (_that) {
case _ComparableBookState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( BookState state)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ComparableBookState() when $default != null:
return $default(_that.state);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( BookState state)  $default,) {final _that = this;
switch (_that) {
case _ComparableBookState():
return $default(_that.state);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( BookState state)?  $default,) {final _that = this;
switch (_that) {
case _ComparableBookState() when $default != null:
return $default(_that.state);case _:
  return null;

}
}

}

/// @nodoc


class _ComparableBookState extends ComparableBookState {
  const _ComparableBookState(this.state): super._();
  

@override final  BookState state;

/// Create a copy of ComparableBookState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ComparableBookStateCopyWith<_ComparableBookState> get copyWith => __$ComparableBookStateCopyWithImpl<_ComparableBookState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ComparableBookState&&(identical(other.state, state) || other.state == state));
}


@override
int get hashCode => Object.hash(runtimeType,state);

@override
String toString() {
  return 'ComparableBookState(state: $state)';
}


}

/// @nodoc
abstract mixin class _$ComparableBookStateCopyWith<$Res> implements $ComparableBookStateCopyWith<$Res> {
  factory _$ComparableBookStateCopyWith(_ComparableBookState value, $Res Function(_ComparableBookState) _then) = __$ComparableBookStateCopyWithImpl;
@override @useResult
$Res call({
 BookState state
});




}
/// @nodoc
class __$ComparableBookStateCopyWithImpl<$Res>
    implements _$ComparableBookStateCopyWith<$Res> {
  __$ComparableBookStateCopyWithImpl(this._self, this._then);

  final _ComparableBookState _self;
  final $Res Function(_ComparableBookState) _then;

/// Create a copy of ComparableBookState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? state = null,}) {
  return _then(_ComparableBookState(
null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as BookState,
  ));
}


}

// dart format on
