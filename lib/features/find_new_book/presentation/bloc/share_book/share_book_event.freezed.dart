// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'share_book_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ShareBookEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String url) bookSharedFromOutside,
    required TResult Function() clearSharedBook,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String url)? bookSharedFromOutside,
    TResult? Function()? clearSharedBook,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String url)? bookSharedFromOutside,
    TResult Function()? clearSharedBook,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BookSharedFromOutside value)
        bookSharedFromOutside,
    required TResult Function(ClearSharedBook value) clearSharedBook,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BookSharedFromOutside value)? bookSharedFromOutside,
    TResult? Function(ClearSharedBook value)? clearSharedBook,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BookSharedFromOutside value)? bookSharedFromOutside,
    TResult Function(ClearSharedBook value)? clearSharedBook,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShareBookEventCopyWith<$Res> {
  factory $ShareBookEventCopyWith(
          ShareBookEvent value, $Res Function(ShareBookEvent) then) =
      _$ShareBookEventCopyWithImpl<$Res, ShareBookEvent>;
}

/// @nodoc
class _$ShareBookEventCopyWithImpl<$Res, $Val extends ShareBookEvent>
    implements $ShareBookEventCopyWith<$Res> {
  _$ShareBookEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ShareBookEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$BookSharedFromOutsideImplCopyWith<$Res> {
  factory _$$BookSharedFromOutsideImplCopyWith(
          _$BookSharedFromOutsideImpl value,
          $Res Function(_$BookSharedFromOutsideImpl) then) =
      __$$BookSharedFromOutsideImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String url});
}

/// @nodoc
class __$$BookSharedFromOutsideImplCopyWithImpl<$Res>
    extends _$ShareBookEventCopyWithImpl<$Res, _$BookSharedFromOutsideImpl>
    implements _$$BookSharedFromOutsideImplCopyWith<$Res> {
  __$$BookSharedFromOutsideImplCopyWithImpl(_$BookSharedFromOutsideImpl _value,
      $Res Function(_$BookSharedFromOutsideImpl) _then)
      : super(_value, _then);

  /// Create a copy of ShareBookEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
  }) {
    return _then(_$BookSharedFromOutsideImpl(
      null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$BookSharedFromOutsideImpl implements BookSharedFromOutside {
  const _$BookSharedFromOutsideImpl(this.url);

  @override
  final String url;

  @override
  String toString() {
    return 'ShareBookEvent.bookSharedFromOutside(url: $url)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookSharedFromOutsideImpl &&
            (identical(other.url, url) || other.url == url));
  }

  @override
  int get hashCode => Object.hash(runtimeType, url);

  /// Create a copy of ShareBookEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BookSharedFromOutsideImplCopyWith<_$BookSharedFromOutsideImpl>
      get copyWith => __$$BookSharedFromOutsideImplCopyWithImpl<
          _$BookSharedFromOutsideImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String url) bookSharedFromOutside,
    required TResult Function() clearSharedBook,
  }) {
    return bookSharedFromOutside(url);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String url)? bookSharedFromOutside,
    TResult? Function()? clearSharedBook,
  }) {
    return bookSharedFromOutside?.call(url);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String url)? bookSharedFromOutside,
    TResult Function()? clearSharedBook,
    required TResult orElse(),
  }) {
    if (bookSharedFromOutside != null) {
      return bookSharedFromOutside(url);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BookSharedFromOutside value)
        bookSharedFromOutside,
    required TResult Function(ClearSharedBook value) clearSharedBook,
  }) {
    return bookSharedFromOutside(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BookSharedFromOutside value)? bookSharedFromOutside,
    TResult? Function(ClearSharedBook value)? clearSharedBook,
  }) {
    return bookSharedFromOutside?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BookSharedFromOutside value)? bookSharedFromOutside,
    TResult Function(ClearSharedBook value)? clearSharedBook,
    required TResult orElse(),
  }) {
    if (bookSharedFromOutside != null) {
      return bookSharedFromOutside(this);
    }
    return orElse();
  }
}

abstract class BookSharedFromOutside implements ShareBookEvent {
  const factory BookSharedFromOutside(final String url) =
      _$BookSharedFromOutsideImpl;

  String get url;

  /// Create a copy of ShareBookEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BookSharedFromOutsideImplCopyWith<_$BookSharedFromOutsideImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ClearSharedBookImplCopyWith<$Res> {
  factory _$$ClearSharedBookImplCopyWith(_$ClearSharedBookImpl value,
          $Res Function(_$ClearSharedBookImpl) then) =
      __$$ClearSharedBookImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ClearSharedBookImplCopyWithImpl<$Res>
    extends _$ShareBookEventCopyWithImpl<$Res, _$ClearSharedBookImpl>
    implements _$$ClearSharedBookImplCopyWith<$Res> {
  __$$ClearSharedBookImplCopyWithImpl(
      _$ClearSharedBookImpl _value, $Res Function(_$ClearSharedBookImpl) _then)
      : super(_value, _then);

  /// Create a copy of ShareBookEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ClearSharedBookImpl implements ClearSharedBook {
  const _$ClearSharedBookImpl();

  @override
  String toString() {
    return 'ShareBookEvent.clearSharedBook()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ClearSharedBookImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String url) bookSharedFromOutside,
    required TResult Function() clearSharedBook,
  }) {
    return clearSharedBook();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String url)? bookSharedFromOutside,
    TResult? Function()? clearSharedBook,
  }) {
    return clearSharedBook?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String url)? bookSharedFromOutside,
    TResult Function()? clearSharedBook,
    required TResult orElse(),
  }) {
    if (clearSharedBook != null) {
      return clearSharedBook();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BookSharedFromOutside value)
        bookSharedFromOutside,
    required TResult Function(ClearSharedBook value) clearSharedBook,
  }) {
    return clearSharedBook(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BookSharedFromOutside value)? bookSharedFromOutside,
    TResult? Function(ClearSharedBook value)? clearSharedBook,
  }) {
    return clearSharedBook?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BookSharedFromOutside value)? bookSharedFromOutside,
    TResult Function(ClearSharedBook value)? clearSharedBook,
    required TResult orElse(),
  }) {
    if (clearSharedBook != null) {
      return clearSharedBook(this);
    }
    return orElse();
  }
}

abstract class ClearSharedBook implements ShareBookEvent {
  const factory ClearSharedBook() = _$ClearSharedBookImpl;
}
