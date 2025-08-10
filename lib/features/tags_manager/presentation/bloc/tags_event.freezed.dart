// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tags_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TagsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() tagsDisplayed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? tagsDisplayed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? tagsDisplayed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TagsDisplayed value) tagsDisplayed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TagsDisplayed value)? tagsDisplayed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TagsDisplayed value)? tagsDisplayed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TagsEventCopyWith<$Res> {
  factory $TagsEventCopyWith(TagsEvent value, $Res Function(TagsEvent) then) =
      _$TagsEventCopyWithImpl<$Res, TagsEvent>;
}

/// @nodoc
class _$TagsEventCopyWithImpl<$Res, $Val extends TagsEvent>
    implements $TagsEventCopyWith<$Res> {
  _$TagsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TagsEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$TagsDisplayedImplCopyWith<$Res> {
  factory _$$TagsDisplayedImplCopyWith(
          _$TagsDisplayedImpl value, $Res Function(_$TagsDisplayedImpl) then) =
      __$$TagsDisplayedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TagsDisplayedImplCopyWithImpl<$Res>
    extends _$TagsEventCopyWithImpl<$Res, _$TagsDisplayedImpl>
    implements _$$TagsDisplayedImplCopyWith<$Res> {
  __$$TagsDisplayedImplCopyWithImpl(
      _$TagsDisplayedImpl _value, $Res Function(_$TagsDisplayedImpl) _then)
      : super(_value, _then);

  /// Create a copy of TagsEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$TagsDisplayedImpl implements TagsDisplayed {
  const _$TagsDisplayedImpl();

  @override
  String toString() {
    return 'TagsEvent.tagsDisplayed()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$TagsDisplayedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() tagsDisplayed,
  }) {
    return tagsDisplayed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? tagsDisplayed,
  }) {
    return tagsDisplayed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? tagsDisplayed,
    required TResult orElse(),
  }) {
    if (tagsDisplayed != null) {
      return tagsDisplayed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TagsDisplayed value) tagsDisplayed,
  }) {
    return tagsDisplayed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TagsDisplayed value)? tagsDisplayed,
  }) {
    return tagsDisplayed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TagsDisplayed value)? tagsDisplayed,
    required TResult orElse(),
  }) {
    if (tagsDisplayed != null) {
      return tagsDisplayed(this);
    }
    return orElse();
  }
}

abstract class TagsDisplayed implements TagsEvent {
  const factory TagsDisplayed() = _$TagsDisplayedImpl;
}
