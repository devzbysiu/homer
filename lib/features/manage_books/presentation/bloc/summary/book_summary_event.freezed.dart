// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'book_summary_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BookSummaryEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookSummaryEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BookSummaryEvent()';
}


}

/// @nodoc
class $BookSummaryEventCopyWith<$Res>  {
$BookSummaryEventCopyWith(BookSummaryEvent _, $Res Function(BookSummaryEvent) __);
}


/// Adds pattern-matching-related methods to [BookSummaryEvent].
extension BookSummaryEventPatterns on BookSummaryEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( SummaryModeClosing value)?  summaryModeClosing,TResult Function( SummaryModeToggled value)?  summaryModeToggled,TResult Function( SummaryModeClosed value)?  summaryModeClosed,required TResult orElse(),}){
final _that = this;
switch (_that) {
case SummaryModeClosing() when summaryModeClosing != null:
return summaryModeClosing(_that);case SummaryModeToggled() when summaryModeToggled != null:
return summaryModeToggled(_that);case SummaryModeClosed() when summaryModeClosed != null:
return summaryModeClosed(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( SummaryModeClosing value)  summaryModeClosing,required TResult Function( SummaryModeToggled value)  summaryModeToggled,required TResult Function( SummaryModeClosed value)  summaryModeClosed,}){
final _that = this;
switch (_that) {
case SummaryModeClosing():
return summaryModeClosing(_that);case SummaryModeToggled():
return summaryModeToggled(_that);case SummaryModeClosed():
return summaryModeClosed(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( SummaryModeClosing value)?  summaryModeClosing,TResult? Function( SummaryModeToggled value)?  summaryModeToggled,TResult? Function( SummaryModeClosed value)?  summaryModeClosed,}){
final _that = this;
switch (_that) {
case SummaryModeClosing() when summaryModeClosing != null:
return summaryModeClosing(_that);case SummaryModeToggled() when summaryModeToggled != null:
return summaryModeToggled(_that);case SummaryModeClosed() when summaryModeClosed != null:
return summaryModeClosed(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  summaryModeClosing,TResult Function( Book book)?  summaryModeToggled,TResult Function()?  summaryModeClosed,required TResult orElse(),}) {final _that = this;
switch (_that) {
case SummaryModeClosing() when summaryModeClosing != null:
return summaryModeClosing();case SummaryModeToggled() when summaryModeToggled != null:
return summaryModeToggled(_that.book);case SummaryModeClosed() when summaryModeClosed != null:
return summaryModeClosed();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  summaryModeClosing,required TResult Function( Book book)  summaryModeToggled,required TResult Function()  summaryModeClosed,}) {final _that = this;
switch (_that) {
case SummaryModeClosing():
return summaryModeClosing();case SummaryModeToggled():
return summaryModeToggled(_that.book);case SummaryModeClosed():
return summaryModeClosed();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  summaryModeClosing,TResult? Function( Book book)?  summaryModeToggled,TResult? Function()?  summaryModeClosed,}) {final _that = this;
switch (_that) {
case SummaryModeClosing() when summaryModeClosing != null:
return summaryModeClosing();case SummaryModeToggled() when summaryModeToggled != null:
return summaryModeToggled(_that.book);case SummaryModeClosed() when summaryModeClosed != null:
return summaryModeClosed();case _:
  return null;

}
}

}

/// @nodoc


class SummaryModeClosing implements BookSummaryEvent {
  const SummaryModeClosing();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SummaryModeClosing);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BookSummaryEvent.summaryModeClosing()';
}


}




/// @nodoc


class SummaryModeToggled implements BookSummaryEvent {
  const SummaryModeToggled(this.book);
  

 final  Book book;

/// Create a copy of BookSummaryEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SummaryModeToggledCopyWith<SummaryModeToggled> get copyWith => _$SummaryModeToggledCopyWithImpl<SummaryModeToggled>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SummaryModeToggled&&(identical(other.book, book) || other.book == book));
}


@override
int get hashCode => Object.hash(runtimeType,book);

@override
String toString() {
  return 'BookSummaryEvent.summaryModeToggled(book: $book)';
}


}

/// @nodoc
abstract mixin class $SummaryModeToggledCopyWith<$Res> implements $BookSummaryEventCopyWith<$Res> {
  factory $SummaryModeToggledCopyWith(SummaryModeToggled value, $Res Function(SummaryModeToggled) _then) = _$SummaryModeToggledCopyWithImpl;
@useResult
$Res call({
 Book book
});


$BookCopyWith<$Res> get book;

}
/// @nodoc
class _$SummaryModeToggledCopyWithImpl<$Res>
    implements $SummaryModeToggledCopyWith<$Res> {
  _$SummaryModeToggledCopyWithImpl(this._self, this._then);

  final SummaryModeToggled _self;
  final $Res Function(SummaryModeToggled) _then;

/// Create a copy of BookSummaryEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? book = null,}) {
  return _then(SummaryModeToggled(
null == book ? _self.book : book // ignore: cast_nullable_to_non_nullable
as Book,
  ));
}

/// Create a copy of BookSummaryEvent
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


class SummaryModeClosed implements BookSummaryEvent {
  const SummaryModeClosed();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SummaryModeClosed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BookSummaryEvent.summaryModeClosed()';
}


}




// dart format on
