// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stats_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$StatsState {

 Option<BooksPerYearData> get booksPerYear; Option<BooksPerMonthData> get booksPerMonth; Option<BooksPerStateData> get booksPerState; Option<OtherStatsData> get otherStats;
/// Create a copy of StatsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StatsStateCopyWith<StatsState> get copyWith => _$StatsStateCopyWithImpl<StatsState>(this as StatsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StatsState&&(identical(other.booksPerYear, booksPerYear) || other.booksPerYear == booksPerYear)&&(identical(other.booksPerMonth, booksPerMonth) || other.booksPerMonth == booksPerMonth)&&(identical(other.booksPerState, booksPerState) || other.booksPerState == booksPerState)&&(identical(other.otherStats, otherStats) || other.otherStats == otherStats));
}


@override
int get hashCode => Object.hash(runtimeType,booksPerYear,booksPerMonth,booksPerState,otherStats);

@override
String toString() {
  return 'StatsState(booksPerYear: $booksPerYear, booksPerMonth: $booksPerMonth, booksPerState: $booksPerState, otherStats: $otherStats)';
}


}

/// @nodoc
abstract mixin class $StatsStateCopyWith<$Res>  {
  factory $StatsStateCopyWith(StatsState value, $Res Function(StatsState) _then) = _$StatsStateCopyWithImpl;
@useResult
$Res call({
 Option<BooksPerYearData> booksPerYear, Option<BooksPerMonthData> booksPerMonth, Option<BooksPerStateData> booksPerState, Option<OtherStatsData> otherStats
});




}
/// @nodoc
class _$StatsStateCopyWithImpl<$Res>
    implements $StatsStateCopyWith<$Res> {
  _$StatsStateCopyWithImpl(this._self, this._then);

  final StatsState _self;
  final $Res Function(StatsState) _then;

/// Create a copy of StatsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? booksPerYear = null,Object? booksPerMonth = null,Object? booksPerState = null,Object? otherStats = null,}) {
  return _then(_self.copyWith(
booksPerYear: null == booksPerYear ? _self.booksPerYear : booksPerYear // ignore: cast_nullable_to_non_nullable
as Option<BooksPerYearData>,booksPerMonth: null == booksPerMonth ? _self.booksPerMonth : booksPerMonth // ignore: cast_nullable_to_non_nullable
as Option<BooksPerMonthData>,booksPerState: null == booksPerState ? _self.booksPerState : booksPerState // ignore: cast_nullable_to_non_nullable
as Option<BooksPerStateData>,otherStats: null == otherStats ? _self.otherStats : otherStats // ignore: cast_nullable_to_non_nullable
as Option<OtherStatsData>,
  ));
}

}


/// Adds pattern-matching-related methods to [StatsState].
extension StatsStatePatterns on StatsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StatsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StatsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StatsState value)  $default,){
final _that = this;
switch (_that) {
case _StatsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StatsState value)?  $default,){
final _that = this;
switch (_that) {
case _StatsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Option<BooksPerYearData> booksPerYear,  Option<BooksPerMonthData> booksPerMonth,  Option<BooksPerStateData> booksPerState,  Option<OtherStatsData> otherStats)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StatsState() when $default != null:
return $default(_that.booksPerYear,_that.booksPerMonth,_that.booksPerState,_that.otherStats);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Option<BooksPerYearData> booksPerYear,  Option<BooksPerMonthData> booksPerMonth,  Option<BooksPerStateData> booksPerState,  Option<OtherStatsData> otherStats)  $default,) {final _that = this;
switch (_that) {
case _StatsState():
return $default(_that.booksPerYear,_that.booksPerMonth,_that.booksPerState,_that.otherStats);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Option<BooksPerYearData> booksPerYear,  Option<BooksPerMonthData> booksPerMonth,  Option<BooksPerStateData> booksPerState,  Option<OtherStatsData> otherStats)?  $default,) {final _that = this;
switch (_that) {
case _StatsState() when $default != null:
return $default(_that.booksPerYear,_that.booksPerMonth,_that.booksPerState,_that.otherStats);case _:
  return null;

}
}

}

/// @nodoc


class _StatsState extends StatsState {
  const _StatsState({required this.booksPerYear, required this.booksPerMonth, required this.booksPerState, required this.otherStats}): super._();
  

@override final  Option<BooksPerYearData> booksPerYear;
@override final  Option<BooksPerMonthData> booksPerMonth;
@override final  Option<BooksPerStateData> booksPerState;
@override final  Option<OtherStatsData> otherStats;

/// Create a copy of StatsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StatsStateCopyWith<_StatsState> get copyWith => __$StatsStateCopyWithImpl<_StatsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StatsState&&(identical(other.booksPerYear, booksPerYear) || other.booksPerYear == booksPerYear)&&(identical(other.booksPerMonth, booksPerMonth) || other.booksPerMonth == booksPerMonth)&&(identical(other.booksPerState, booksPerState) || other.booksPerState == booksPerState)&&(identical(other.otherStats, otherStats) || other.otherStats == otherStats));
}


@override
int get hashCode => Object.hash(runtimeType,booksPerYear,booksPerMonth,booksPerState,otherStats);

@override
String toString() {
  return 'StatsState(booksPerYear: $booksPerYear, booksPerMonth: $booksPerMonth, booksPerState: $booksPerState, otherStats: $otherStats)';
}


}

/// @nodoc
abstract mixin class _$StatsStateCopyWith<$Res> implements $StatsStateCopyWith<$Res> {
  factory _$StatsStateCopyWith(_StatsState value, $Res Function(_StatsState) _then) = __$StatsStateCopyWithImpl;
@override @useResult
$Res call({
 Option<BooksPerYearData> booksPerYear, Option<BooksPerMonthData> booksPerMonth, Option<BooksPerStateData> booksPerState, Option<OtherStatsData> otherStats
});




}
/// @nodoc
class __$StatsStateCopyWithImpl<$Res>
    implements _$StatsStateCopyWith<$Res> {
  __$StatsStateCopyWithImpl(this._self, this._then);

  final _StatsState _self;
  final $Res Function(_StatsState) _then;

/// Create a copy of StatsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? booksPerYear = null,Object? booksPerMonth = null,Object? booksPerState = null,Object? otherStats = null,}) {
  return _then(_StatsState(
booksPerYear: null == booksPerYear ? _self.booksPerYear : booksPerYear // ignore: cast_nullable_to_non_nullable
as Option<BooksPerYearData>,booksPerMonth: null == booksPerMonth ? _self.booksPerMonth : booksPerMonth // ignore: cast_nullable_to_non_nullable
as Option<BooksPerMonthData>,booksPerState: null == booksPerState ? _self.booksPerState : booksPerState // ignore: cast_nullable_to_non_nullable
as Option<BooksPerStateData>,otherStats: null == otherStats ? _self.otherStats : otherStats // ignore: cast_nullable_to_non_nullable
as Option<OtherStatsData>,
  ));
}


}

// dart format on
