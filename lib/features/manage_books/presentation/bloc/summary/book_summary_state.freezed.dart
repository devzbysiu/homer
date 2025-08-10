// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'book_summary_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BookSummaryState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(Book book) enabled,
    required TResult Function() disabled,
    required TResult Function(Option<Book> current) disabling,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(Book book)? enabled,
    TResult? Function()? disabled,
    TResult? Function(Option<Book> current)? disabling,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Book book)? enabled,
    TResult Function()? disabled,
    TResult Function(Option<Book> current)? disabling,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Enabled value) enabled,
    required TResult Function(Disabled value) disabled,
    required TResult Function(Disabling value) disabling,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Enabled value)? enabled,
    TResult? Function(Disabled value)? disabled,
    TResult? Function(Disabling value)? disabling,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Enabled value)? enabled,
    TResult Function(Disabled value)? disabled,
    TResult Function(Disabling value)? disabling,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookSummaryStateCopyWith<$Res> {
  factory $BookSummaryStateCopyWith(
          BookSummaryState value, $Res Function(BookSummaryState) then) =
      _$BookSummaryStateCopyWithImpl<$Res, BookSummaryState>;
}

/// @nodoc
class _$BookSummaryStateCopyWithImpl<$Res, $Val extends BookSummaryState>
    implements $BookSummaryStateCopyWith<$Res> {
  _$BookSummaryStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BookSummaryState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$BookSummaryStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of BookSummaryState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl extends Initial {
  const _$InitialImpl() : super._();

  @override
  String toString() {
    return 'BookSummaryState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(Book book) enabled,
    required TResult Function() disabled,
    required TResult Function(Option<Book> current) disabling,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(Book book)? enabled,
    TResult? Function()? disabled,
    TResult? Function(Option<Book> current)? disabling,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Book book)? enabled,
    TResult Function()? disabled,
    TResult Function(Option<Book> current)? disabling,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Enabled value) enabled,
    required TResult Function(Disabled value) disabled,
    required TResult Function(Disabling value) disabling,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Enabled value)? enabled,
    TResult? Function(Disabled value)? disabled,
    TResult? Function(Disabling value)? disabling,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Enabled value)? enabled,
    TResult Function(Disabled value)? disabled,
    TResult Function(Disabling value)? disabling,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class Initial extends BookSummaryState {
  const factory Initial() = _$InitialImpl;
  const Initial._() : super._();
}

/// @nodoc
abstract class _$$EnabledImplCopyWith<$Res> {
  factory _$$EnabledImplCopyWith(
          _$EnabledImpl value, $Res Function(_$EnabledImpl) then) =
      __$$EnabledImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Book book});
}

/// @nodoc
class __$$EnabledImplCopyWithImpl<$Res>
    extends _$BookSummaryStateCopyWithImpl<$Res, _$EnabledImpl>
    implements _$$EnabledImplCopyWith<$Res> {
  __$$EnabledImplCopyWithImpl(
      _$EnabledImpl _value, $Res Function(_$EnabledImpl) _then)
      : super(_value, _then);

  /// Create a copy of BookSummaryState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? book = null,
  }) {
    return _then(_$EnabledImpl(
      null == book
          ? _value.book
          : book // ignore: cast_nullable_to_non_nullable
              as Book,
    ));
  }
}

/// @nodoc

class _$EnabledImpl extends Enabled {
  const _$EnabledImpl(this.book) : super._();

  @override
  final Book book;

  @override
  String toString() {
    return 'BookSummaryState.enabled(book: $book)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EnabledImpl &&
            (identical(other.book, book) || other.book == book));
  }

  @override
  int get hashCode => Object.hash(runtimeType, book);

  /// Create a copy of BookSummaryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EnabledImplCopyWith<_$EnabledImpl> get copyWith =>
      __$$EnabledImplCopyWithImpl<_$EnabledImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(Book book) enabled,
    required TResult Function() disabled,
    required TResult Function(Option<Book> current) disabling,
  }) {
    return enabled(book);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(Book book)? enabled,
    TResult? Function()? disabled,
    TResult? Function(Option<Book> current)? disabling,
  }) {
    return enabled?.call(book);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Book book)? enabled,
    TResult Function()? disabled,
    TResult Function(Option<Book> current)? disabling,
    required TResult orElse(),
  }) {
    if (enabled != null) {
      return enabled(book);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Enabled value) enabled,
    required TResult Function(Disabled value) disabled,
    required TResult Function(Disabling value) disabling,
  }) {
    return enabled(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Enabled value)? enabled,
    TResult? Function(Disabled value)? disabled,
    TResult? Function(Disabling value)? disabling,
  }) {
    return enabled?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Enabled value)? enabled,
    TResult Function(Disabled value)? disabled,
    TResult Function(Disabling value)? disabling,
    required TResult orElse(),
  }) {
    if (enabled != null) {
      return enabled(this);
    }
    return orElse();
  }
}

abstract class Enabled extends BookSummaryState {
  const factory Enabled(final Book book) = _$EnabledImpl;
  const Enabled._() : super._();

  Book get book;

  /// Create a copy of BookSummaryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EnabledImplCopyWith<_$EnabledImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DisabledImplCopyWith<$Res> {
  factory _$$DisabledImplCopyWith(
          _$DisabledImpl value, $Res Function(_$DisabledImpl) then) =
      __$$DisabledImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DisabledImplCopyWithImpl<$Res>
    extends _$BookSummaryStateCopyWithImpl<$Res, _$DisabledImpl>
    implements _$$DisabledImplCopyWith<$Res> {
  __$$DisabledImplCopyWithImpl(
      _$DisabledImpl _value, $Res Function(_$DisabledImpl) _then)
      : super(_value, _then);

  /// Create a copy of BookSummaryState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$DisabledImpl extends Disabled {
  const _$DisabledImpl() : super._();

  @override
  String toString() {
    return 'BookSummaryState.disabled()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$DisabledImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(Book book) enabled,
    required TResult Function() disabled,
    required TResult Function(Option<Book> current) disabling,
  }) {
    return disabled();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(Book book)? enabled,
    TResult? Function()? disabled,
    TResult? Function(Option<Book> current)? disabling,
  }) {
    return disabled?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Book book)? enabled,
    TResult Function()? disabled,
    TResult Function(Option<Book> current)? disabling,
    required TResult orElse(),
  }) {
    if (disabled != null) {
      return disabled();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Enabled value) enabled,
    required TResult Function(Disabled value) disabled,
    required TResult Function(Disabling value) disabling,
  }) {
    return disabled(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Enabled value)? enabled,
    TResult? Function(Disabled value)? disabled,
    TResult? Function(Disabling value)? disabling,
  }) {
    return disabled?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Enabled value)? enabled,
    TResult Function(Disabled value)? disabled,
    TResult Function(Disabling value)? disabling,
    required TResult orElse(),
  }) {
    if (disabled != null) {
      return disabled(this);
    }
    return orElse();
  }
}

abstract class Disabled extends BookSummaryState {
  const factory Disabled() = _$DisabledImpl;
  const Disabled._() : super._();
}

/// @nodoc
abstract class _$$DisablingImplCopyWith<$Res> {
  factory _$$DisablingImplCopyWith(
          _$DisablingImpl value, $Res Function(_$DisablingImpl) then) =
      __$$DisablingImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Option<Book> current});
}

/// @nodoc
class __$$DisablingImplCopyWithImpl<$Res>
    extends _$BookSummaryStateCopyWithImpl<$Res, _$DisablingImpl>
    implements _$$DisablingImplCopyWith<$Res> {
  __$$DisablingImplCopyWithImpl(
      _$DisablingImpl _value, $Res Function(_$DisablingImpl) _then)
      : super(_value, _then);

  /// Create a copy of BookSummaryState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? current = null,
  }) {
    return _then(_$DisablingImpl(
      null == current
          ? _value.current
          : current // ignore: cast_nullable_to_non_nullable
              as Option<Book>,
    ));
  }
}

/// @nodoc

class _$DisablingImpl extends Disabling {
  const _$DisablingImpl(this.current) : super._();

  @override
  final Option<Book> current;

  @override
  String toString() {
    return 'BookSummaryState.disabling(current: $current)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DisablingImpl &&
            (identical(other.current, current) || other.current == current));
  }

  @override
  int get hashCode => Object.hash(runtimeType, current);

  /// Create a copy of BookSummaryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DisablingImplCopyWith<_$DisablingImpl> get copyWith =>
      __$$DisablingImplCopyWithImpl<_$DisablingImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(Book book) enabled,
    required TResult Function() disabled,
    required TResult Function(Option<Book> current) disabling,
  }) {
    return disabling(current);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(Book book)? enabled,
    TResult? Function()? disabled,
    TResult? Function(Option<Book> current)? disabling,
  }) {
    return disabling?.call(current);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Book book)? enabled,
    TResult Function()? disabled,
    TResult Function(Option<Book> current)? disabling,
    required TResult orElse(),
  }) {
    if (disabling != null) {
      return disabling(current);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Enabled value) enabled,
    required TResult Function(Disabled value) disabled,
    required TResult Function(Disabling value) disabling,
  }) {
    return disabling(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Enabled value)? enabled,
    TResult? Function(Disabled value)? disabled,
    TResult? Function(Disabling value)? disabling,
  }) {
    return disabling?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Enabled value)? enabled,
    TResult Function(Disabled value)? disabled,
    TResult Function(Disabling value)? disabling,
    required TResult orElse(),
  }) {
    if (disabling != null) {
      return disabling(this);
    }
    return orElse();
  }
}

abstract class Disabling extends BookSummaryState {
  const factory Disabling(final Option<Book> current) = _$DisablingImpl;
  const Disabling._() : super._();

  Option<Book> get current;

  /// Create a copy of BookSummaryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DisablingImplCopyWith<_$DisablingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
