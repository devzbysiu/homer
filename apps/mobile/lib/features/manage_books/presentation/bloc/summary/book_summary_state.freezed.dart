// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'book_summary_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BookSummaryState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookSummaryState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BookSummaryState()';
}


}

/// @nodoc
class $BookSummaryStateCopyWith<$Res>  {
$BookSummaryStateCopyWith(BookSummaryState _, $Res Function(BookSummaryState) __);
}


/// Adds pattern-matching-related methods to [BookSummaryState].
extension BookSummaryStatePatterns on BookSummaryState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Initial value)?  initial,TResult Function( Enabled value)?  enabled,TResult Function( Disabled value)?  disabled,TResult Function( Disabling value)?  disabling,required TResult orElse(),}){
final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that);case Enabled() when enabled != null:
return enabled(_that);case Disabled() when disabled != null:
return disabled(_that);case Disabling() when disabling != null:
return disabling(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Initial value)  initial,required TResult Function( Enabled value)  enabled,required TResult Function( Disabled value)  disabled,required TResult Function( Disabling value)  disabling,}){
final _that = this;
switch (_that) {
case Initial():
return initial(_that);case Enabled():
return enabled(_that);case Disabled():
return disabled(_that);case Disabling():
return disabling(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Initial value)?  initial,TResult? Function( Enabled value)?  enabled,TResult? Function( Disabled value)?  disabled,TResult? Function( Disabling value)?  disabling,}){
final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that);case Enabled() when enabled != null:
return enabled(_that);case Disabled() when disabled != null:
return disabled(_that);case Disabling() when disabling != null:
return disabling(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function( Book book)?  enabled,TResult Function()?  disabled,TResult Function( Option<Book> current)?  disabling,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial();case Enabled() when enabled != null:
return enabled(_that.book);case Disabled() when disabled != null:
return disabled();case Disabling() when disabling != null:
return disabling(_that.current);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function( Book book)  enabled,required TResult Function()  disabled,required TResult Function( Option<Book> current)  disabling,}) {final _that = this;
switch (_that) {
case Initial():
return initial();case Enabled():
return enabled(_that.book);case Disabled():
return disabled();case Disabling():
return disabling(_that.current);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function( Book book)?  enabled,TResult? Function()?  disabled,TResult? Function( Option<Book> current)?  disabling,}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial();case Enabled() when enabled != null:
return enabled(_that.book);case Disabled() when disabled != null:
return disabled();case Disabling() when disabling != null:
return disabling(_that.current);case _:
  return null;

}
}

}

/// @nodoc


class Initial extends BookSummaryState {
  const Initial(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BookSummaryState.initial()';
}


}




/// @nodoc


class Enabled extends BookSummaryState {
  const Enabled(this.book): super._();
  

 final  Book book;

/// Create a copy of BookSummaryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EnabledCopyWith<Enabled> get copyWith => _$EnabledCopyWithImpl<Enabled>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Enabled&&(identical(other.book, book) || other.book == book));
}


@override
int get hashCode => Object.hash(runtimeType,book);

@override
String toString() {
  return 'BookSummaryState.enabled(book: $book)';
}


}

/// @nodoc
abstract mixin class $EnabledCopyWith<$Res> implements $BookSummaryStateCopyWith<$Res> {
  factory $EnabledCopyWith(Enabled value, $Res Function(Enabled) _then) = _$EnabledCopyWithImpl;
@useResult
$Res call({
 Book book
});


$BookCopyWith<$Res> get book;

}
/// @nodoc
class _$EnabledCopyWithImpl<$Res>
    implements $EnabledCopyWith<$Res> {
  _$EnabledCopyWithImpl(this._self, this._then);

  final Enabled _self;
  final $Res Function(Enabled) _then;

/// Create a copy of BookSummaryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? book = null,}) {
  return _then(Enabled(
null == book ? _self.book : book // ignore: cast_nullable_to_non_nullable
as Book,
  ));
}

/// Create a copy of BookSummaryState
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


class Disabled extends BookSummaryState {
  const Disabled(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Disabled);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BookSummaryState.disabled()';
}


}




/// @nodoc


class Disabling extends BookSummaryState {
  const Disabling(this.current): super._();
  

 final  Option<Book> current;

/// Create a copy of BookSummaryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DisablingCopyWith<Disabling> get copyWith => _$DisablingCopyWithImpl<Disabling>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Disabling&&(identical(other.current, current) || other.current == current));
}


@override
int get hashCode => Object.hash(runtimeType,current);

@override
String toString() {
  return 'BookSummaryState.disabling(current: $current)';
}


}

/// @nodoc
abstract mixin class $DisablingCopyWith<$Res> implements $BookSummaryStateCopyWith<$Res> {
  factory $DisablingCopyWith(Disabling value, $Res Function(Disabling) _then) = _$DisablingCopyWithImpl;
@useResult
$Res call({
 Option<Book> current
});




}
/// @nodoc
class _$DisablingCopyWithImpl<$Res>
    implements $DisablingCopyWith<$Res> {
  _$DisablingCopyWithImpl(this._self, this._then);

  final Disabling _self;
  final $Res Function(Disabling) _then;

/// Create a copy of BookSummaryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? current = null,}) {
  return _then(Disabling(
null == current ? _self.current : current // ignore: cast_nullable_to_non_nullable
as Option<Book>,
  ));
}


}

// dart format on
