// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stats_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$StatsEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StatsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'StatsEvent()';
}


}

/// @nodoc
class $StatsEventCopyWith<$Res>  {
$StatsEventCopyWith(StatsEvent _, $Res Function(StatsEvent) __);
}


/// Adds pattern-matching-related methods to [StatsEvent].
extension StatsEventPatterns on StatsEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoadStats value)?  loadStats,TResult Function( BookFinished value)?  bookFinished,TResult Function( BookUnfinished value)?  bookUnfinished,TResult Function( BookStarted value)?  bookStarted,TResult Function( BookUnstarted value)?  bookUnstarted,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoadStats() when loadStats != null:
return loadStats(_that);case BookFinished() when bookFinished != null:
return bookFinished(_that);case BookUnfinished() when bookUnfinished != null:
return bookUnfinished(_that);case BookStarted() when bookStarted != null:
return bookStarted(_that);case BookUnstarted() when bookUnstarted != null:
return bookUnstarted(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoadStats value)  loadStats,required TResult Function( BookFinished value)  bookFinished,required TResult Function( BookUnfinished value)  bookUnfinished,required TResult Function( BookStarted value)  bookStarted,required TResult Function( BookUnstarted value)  bookUnstarted,}){
final _that = this;
switch (_that) {
case LoadStats():
return loadStats(_that);case BookFinished():
return bookFinished(_that);case BookUnfinished():
return bookUnfinished(_that);case BookStarted():
return bookStarted(_that);case BookUnstarted():
return bookUnstarted(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoadStats value)?  loadStats,TResult? Function( BookFinished value)?  bookFinished,TResult? Function( BookUnfinished value)?  bookUnfinished,TResult? Function( BookStarted value)?  bookStarted,TResult? Function( BookUnstarted value)?  bookUnstarted,}){
final _that = this;
switch (_that) {
case LoadStats() when loadStats != null:
return loadStats(_that);case BookFinished() when bookFinished != null:
return bookFinished(_that);case BookUnfinished() when bookUnfinished != null:
return bookUnfinished(_that);case BookStarted() when bookStarted != null:
return bookStarted(_that);case BookUnstarted() when bookUnstarted != null:
return bookUnstarted(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loadStats,TResult Function( Book book)?  bookFinished,TResult Function( Book book)?  bookUnfinished,TResult Function()?  bookStarted,TResult Function()?  bookUnstarted,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LoadStats() when loadStats != null:
return loadStats();case BookFinished() when bookFinished != null:
return bookFinished(_that.book);case BookUnfinished() when bookUnfinished != null:
return bookUnfinished(_that.book);case BookStarted() when bookStarted != null:
return bookStarted();case BookUnstarted() when bookUnstarted != null:
return bookUnstarted();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loadStats,required TResult Function( Book book)  bookFinished,required TResult Function( Book book)  bookUnfinished,required TResult Function()  bookStarted,required TResult Function()  bookUnstarted,}) {final _that = this;
switch (_that) {
case LoadStats():
return loadStats();case BookFinished():
return bookFinished(_that.book);case BookUnfinished():
return bookUnfinished(_that.book);case BookStarted():
return bookStarted();case BookUnstarted():
return bookUnstarted();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loadStats,TResult? Function( Book book)?  bookFinished,TResult? Function( Book book)?  bookUnfinished,TResult? Function()?  bookStarted,TResult? Function()?  bookUnstarted,}) {final _that = this;
switch (_that) {
case LoadStats() when loadStats != null:
return loadStats();case BookFinished() when bookFinished != null:
return bookFinished(_that.book);case BookUnfinished() when bookUnfinished != null:
return bookUnfinished(_that.book);case BookStarted() when bookStarted != null:
return bookStarted();case BookUnstarted() when bookUnstarted != null:
return bookUnstarted();case _:
  return null;

}
}

}

/// @nodoc


class LoadStats implements StatsEvent {
  const LoadStats();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadStats);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'StatsEvent.loadStats()';
}


}




/// @nodoc


class BookFinished implements StatsEvent {
  const BookFinished({required this.book});
  

 final  Book book;

/// Create a copy of StatsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookFinishedCopyWith<BookFinished> get copyWith => _$BookFinishedCopyWithImpl<BookFinished>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookFinished&&(identical(other.book, book) || other.book == book));
}


@override
int get hashCode => Object.hash(runtimeType,book);

@override
String toString() {
  return 'StatsEvent.bookFinished(book: $book)';
}


}

/// @nodoc
abstract mixin class $BookFinishedCopyWith<$Res> implements $StatsEventCopyWith<$Res> {
  factory $BookFinishedCopyWith(BookFinished value, $Res Function(BookFinished) _then) = _$BookFinishedCopyWithImpl;
@useResult
$Res call({
 Book book
});


$BookCopyWith<$Res> get book;

}
/// @nodoc
class _$BookFinishedCopyWithImpl<$Res>
    implements $BookFinishedCopyWith<$Res> {
  _$BookFinishedCopyWithImpl(this._self, this._then);

  final BookFinished _self;
  final $Res Function(BookFinished) _then;

/// Create a copy of StatsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? book = null,}) {
  return _then(BookFinished(
book: null == book ? _self.book : book // ignore: cast_nullable_to_non_nullable
as Book,
  ));
}

/// Create a copy of StatsEvent
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


class BookUnfinished implements StatsEvent {
  const BookUnfinished({required this.book});
  

 final  Book book;

/// Create a copy of StatsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookUnfinishedCopyWith<BookUnfinished> get copyWith => _$BookUnfinishedCopyWithImpl<BookUnfinished>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookUnfinished&&(identical(other.book, book) || other.book == book));
}


@override
int get hashCode => Object.hash(runtimeType,book);

@override
String toString() {
  return 'StatsEvent.bookUnfinished(book: $book)';
}


}

/// @nodoc
abstract mixin class $BookUnfinishedCopyWith<$Res> implements $StatsEventCopyWith<$Res> {
  factory $BookUnfinishedCopyWith(BookUnfinished value, $Res Function(BookUnfinished) _then) = _$BookUnfinishedCopyWithImpl;
@useResult
$Res call({
 Book book
});


$BookCopyWith<$Res> get book;

}
/// @nodoc
class _$BookUnfinishedCopyWithImpl<$Res>
    implements $BookUnfinishedCopyWith<$Res> {
  _$BookUnfinishedCopyWithImpl(this._self, this._then);

  final BookUnfinished _self;
  final $Res Function(BookUnfinished) _then;

/// Create a copy of StatsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? book = null,}) {
  return _then(BookUnfinished(
book: null == book ? _self.book : book // ignore: cast_nullable_to_non_nullable
as Book,
  ));
}

/// Create a copy of StatsEvent
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


class BookStarted implements StatsEvent {
  const BookStarted();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookStarted);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'StatsEvent.bookStarted()';
}


}




/// @nodoc


class BookUnstarted implements StatsEvent {
  const BookUnstarted();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookUnstarted);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'StatsEvent.bookUnstarted()';
}


}




// dart format on
