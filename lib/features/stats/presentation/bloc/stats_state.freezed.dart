// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stats_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$StatsState {
  Option<BooksPerYearData> get booksPerYear =>
      throw _privateConstructorUsedError;
  Option<BooksPerMonthData> get booksPerMonth =>
      throw _privateConstructorUsedError;
  Option<BooksPerStateData> get booksPerState =>
      throw _privateConstructorUsedError;
  Option<OtherStatsData> get otherStats => throw _privateConstructorUsedError;

  /// Create a copy of StatsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StatsStateCopyWith<StatsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatsStateCopyWith<$Res> {
  factory $StatsStateCopyWith(
          StatsState value, $Res Function(StatsState) then) =
      _$StatsStateCopyWithImpl<$Res, StatsState>;
  @useResult
  $Res call(
      {Option<BooksPerYearData> booksPerYear,
      Option<BooksPerMonthData> booksPerMonth,
      Option<BooksPerStateData> booksPerState,
      Option<OtherStatsData> otherStats});
}

/// @nodoc
class _$StatsStateCopyWithImpl<$Res, $Val extends StatsState>
    implements $StatsStateCopyWith<$Res> {
  _$StatsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StatsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? booksPerYear = null,
    Object? booksPerMonth = null,
    Object? booksPerState = null,
    Object? otherStats = null,
  }) {
    return _then(_value.copyWith(
      booksPerYear: null == booksPerYear
          ? _value.booksPerYear
          : booksPerYear // ignore: cast_nullable_to_non_nullable
              as Option<BooksPerYearData>,
      booksPerMonth: null == booksPerMonth
          ? _value.booksPerMonth
          : booksPerMonth // ignore: cast_nullable_to_non_nullable
              as Option<BooksPerMonthData>,
      booksPerState: null == booksPerState
          ? _value.booksPerState
          : booksPerState // ignore: cast_nullable_to_non_nullable
              as Option<BooksPerStateData>,
      otherStats: null == otherStats
          ? _value.otherStats
          : otherStats // ignore: cast_nullable_to_non_nullable
              as Option<OtherStatsData>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StatsStateImplCopyWith<$Res>
    implements $StatsStateCopyWith<$Res> {
  factory _$$StatsStateImplCopyWith(
          _$StatsStateImpl value, $Res Function(_$StatsStateImpl) then) =
      __$$StatsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Option<BooksPerYearData> booksPerYear,
      Option<BooksPerMonthData> booksPerMonth,
      Option<BooksPerStateData> booksPerState,
      Option<OtherStatsData> otherStats});
}

/// @nodoc
class __$$StatsStateImplCopyWithImpl<$Res>
    extends _$StatsStateCopyWithImpl<$Res, _$StatsStateImpl>
    implements _$$StatsStateImplCopyWith<$Res> {
  __$$StatsStateImplCopyWithImpl(
      _$StatsStateImpl _value, $Res Function(_$StatsStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of StatsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? booksPerYear = null,
    Object? booksPerMonth = null,
    Object? booksPerState = null,
    Object? otherStats = null,
  }) {
    return _then(_$StatsStateImpl(
      booksPerYear: null == booksPerYear
          ? _value.booksPerYear
          : booksPerYear // ignore: cast_nullable_to_non_nullable
              as Option<BooksPerYearData>,
      booksPerMonth: null == booksPerMonth
          ? _value.booksPerMonth
          : booksPerMonth // ignore: cast_nullable_to_non_nullable
              as Option<BooksPerMonthData>,
      booksPerState: null == booksPerState
          ? _value.booksPerState
          : booksPerState // ignore: cast_nullable_to_non_nullable
              as Option<BooksPerStateData>,
      otherStats: null == otherStats
          ? _value.otherStats
          : otherStats // ignore: cast_nullable_to_non_nullable
              as Option<OtherStatsData>,
    ));
  }
}

/// @nodoc

class _$StatsStateImpl extends _StatsState {
  const _$StatsStateImpl(
      {required this.booksPerYear,
      required this.booksPerMonth,
      required this.booksPerState,
      required this.otherStats})
      : super._();

  @override
  final Option<BooksPerYearData> booksPerYear;
  @override
  final Option<BooksPerMonthData> booksPerMonth;
  @override
  final Option<BooksPerStateData> booksPerState;
  @override
  final Option<OtherStatsData> otherStats;

  @override
  String toString() {
    return 'StatsState(booksPerYear: $booksPerYear, booksPerMonth: $booksPerMonth, booksPerState: $booksPerState, otherStats: $otherStats)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StatsStateImpl &&
            (identical(other.booksPerYear, booksPerYear) ||
                other.booksPerYear == booksPerYear) &&
            (identical(other.booksPerMonth, booksPerMonth) ||
                other.booksPerMonth == booksPerMonth) &&
            (identical(other.booksPerState, booksPerState) ||
                other.booksPerState == booksPerState) &&
            (identical(other.otherStats, otherStats) ||
                other.otherStats == otherStats));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, booksPerYear, booksPerMonth, booksPerState, otherStats);

  /// Create a copy of StatsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StatsStateImplCopyWith<_$StatsStateImpl> get copyWith =>
      __$$StatsStateImplCopyWithImpl<_$StatsStateImpl>(this, _$identity);
}

abstract class _StatsState extends StatsState {
  const factory _StatsState(
      {required final Option<BooksPerYearData> booksPerYear,
      required final Option<BooksPerMonthData> booksPerMonth,
      required final Option<BooksPerStateData> booksPerState,
      required final Option<OtherStatsData> otherStats}) = _$StatsStateImpl;
  const _StatsState._() : super._();

  @override
  Option<BooksPerYearData> get booksPerYear;
  @override
  Option<BooksPerMonthData> get booksPerMonth;
  @override
  Option<BooksPerStateData> get booksPerState;
  @override
  Option<OtherStatsData> get otherStats;

  /// Create a copy of StatsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StatsStateImplCopyWith<_$StatsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
