// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'on_book_tags_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BookTagsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Tag tag) tagSelected,
    required TResult Function(Tag tag) tagDeselected,
    required TResult Function() clearSelectedTags,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Tag tag)? tagSelected,
    TResult? Function(Tag tag)? tagDeselected,
    TResult? Function()? clearSelectedTags,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Tag tag)? tagSelected,
    TResult Function(Tag tag)? tagDeselected,
    TResult Function()? clearSelectedTags,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TagSelected value) tagSelected,
    required TResult Function(TagDeselected value) tagDeselected,
    required TResult Function(ClearSelectedTags value) clearSelectedTags,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TagSelected value)? tagSelected,
    TResult? Function(TagDeselected value)? tagDeselected,
    TResult? Function(ClearSelectedTags value)? clearSelectedTags,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TagSelected value)? tagSelected,
    TResult Function(TagDeselected value)? tagDeselected,
    TResult Function(ClearSelectedTags value)? clearSelectedTags,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookTagsEventCopyWith<$Res> {
  factory $BookTagsEventCopyWith(
          BookTagsEvent value, $Res Function(BookTagsEvent) then) =
      _$BookTagsEventCopyWithImpl<$Res, BookTagsEvent>;
}

/// @nodoc
class _$BookTagsEventCopyWithImpl<$Res, $Val extends BookTagsEvent>
    implements $BookTagsEventCopyWith<$Res> {
  _$BookTagsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BookTagsEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$TagSelectedImplCopyWith<$Res> {
  factory _$$TagSelectedImplCopyWith(
          _$TagSelectedImpl value, $Res Function(_$TagSelectedImpl) then) =
      __$$TagSelectedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Tag tag});
}

/// @nodoc
class __$$TagSelectedImplCopyWithImpl<$Res>
    extends _$BookTagsEventCopyWithImpl<$Res, _$TagSelectedImpl>
    implements _$$TagSelectedImplCopyWith<$Res> {
  __$$TagSelectedImplCopyWithImpl(
      _$TagSelectedImpl _value, $Res Function(_$TagSelectedImpl) _then)
      : super(_value, _then);

  /// Create a copy of BookTagsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tag = null,
  }) {
    return _then(_$TagSelectedImpl(
      null == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as Tag,
    ));
  }
}

/// @nodoc

class _$TagSelectedImpl implements TagSelected {
  const _$TagSelectedImpl(this.tag);

  @override
  final Tag tag;

  @override
  String toString() {
    return 'BookTagsEvent.tagSelected(tag: $tag)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TagSelectedImpl &&
            (identical(other.tag, tag) || other.tag == tag));
  }

  @override
  int get hashCode => Object.hash(runtimeType, tag);

  /// Create a copy of BookTagsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TagSelectedImplCopyWith<_$TagSelectedImpl> get copyWith =>
      __$$TagSelectedImplCopyWithImpl<_$TagSelectedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Tag tag) tagSelected,
    required TResult Function(Tag tag) tagDeselected,
    required TResult Function() clearSelectedTags,
  }) {
    return tagSelected(tag);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Tag tag)? tagSelected,
    TResult? Function(Tag tag)? tagDeselected,
    TResult? Function()? clearSelectedTags,
  }) {
    return tagSelected?.call(tag);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Tag tag)? tagSelected,
    TResult Function(Tag tag)? tagDeselected,
    TResult Function()? clearSelectedTags,
    required TResult orElse(),
  }) {
    if (tagSelected != null) {
      return tagSelected(tag);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TagSelected value) tagSelected,
    required TResult Function(TagDeselected value) tagDeselected,
    required TResult Function(ClearSelectedTags value) clearSelectedTags,
  }) {
    return tagSelected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TagSelected value)? tagSelected,
    TResult? Function(TagDeselected value)? tagDeselected,
    TResult? Function(ClearSelectedTags value)? clearSelectedTags,
  }) {
    return tagSelected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TagSelected value)? tagSelected,
    TResult Function(TagDeselected value)? tagDeselected,
    TResult Function(ClearSelectedTags value)? clearSelectedTags,
    required TResult orElse(),
  }) {
    if (tagSelected != null) {
      return tagSelected(this);
    }
    return orElse();
  }
}

abstract class TagSelected implements BookTagsEvent {
  const factory TagSelected(final Tag tag) = _$TagSelectedImpl;

  Tag get tag;

  /// Create a copy of BookTagsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TagSelectedImplCopyWith<_$TagSelectedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TagDeselectedImplCopyWith<$Res> {
  factory _$$TagDeselectedImplCopyWith(
          _$TagDeselectedImpl value, $Res Function(_$TagDeselectedImpl) then) =
      __$$TagDeselectedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Tag tag});
}

/// @nodoc
class __$$TagDeselectedImplCopyWithImpl<$Res>
    extends _$BookTagsEventCopyWithImpl<$Res, _$TagDeselectedImpl>
    implements _$$TagDeselectedImplCopyWith<$Res> {
  __$$TagDeselectedImplCopyWithImpl(
      _$TagDeselectedImpl _value, $Res Function(_$TagDeselectedImpl) _then)
      : super(_value, _then);

  /// Create a copy of BookTagsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tag = null,
  }) {
    return _then(_$TagDeselectedImpl(
      null == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as Tag,
    ));
  }
}

/// @nodoc

class _$TagDeselectedImpl implements TagDeselected {
  const _$TagDeselectedImpl(this.tag);

  @override
  final Tag tag;

  @override
  String toString() {
    return 'BookTagsEvent.tagDeselected(tag: $tag)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TagDeselectedImpl &&
            (identical(other.tag, tag) || other.tag == tag));
  }

  @override
  int get hashCode => Object.hash(runtimeType, tag);

  /// Create a copy of BookTagsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TagDeselectedImplCopyWith<_$TagDeselectedImpl> get copyWith =>
      __$$TagDeselectedImplCopyWithImpl<_$TagDeselectedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Tag tag) tagSelected,
    required TResult Function(Tag tag) tagDeselected,
    required TResult Function() clearSelectedTags,
  }) {
    return tagDeselected(tag);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Tag tag)? tagSelected,
    TResult? Function(Tag tag)? tagDeselected,
    TResult? Function()? clearSelectedTags,
  }) {
    return tagDeselected?.call(tag);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Tag tag)? tagSelected,
    TResult Function(Tag tag)? tagDeselected,
    TResult Function()? clearSelectedTags,
    required TResult orElse(),
  }) {
    if (tagDeselected != null) {
      return tagDeselected(tag);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TagSelected value) tagSelected,
    required TResult Function(TagDeselected value) tagDeselected,
    required TResult Function(ClearSelectedTags value) clearSelectedTags,
  }) {
    return tagDeselected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TagSelected value)? tagSelected,
    TResult? Function(TagDeselected value)? tagDeselected,
    TResult? Function(ClearSelectedTags value)? clearSelectedTags,
  }) {
    return tagDeselected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TagSelected value)? tagSelected,
    TResult Function(TagDeselected value)? tagDeselected,
    TResult Function(ClearSelectedTags value)? clearSelectedTags,
    required TResult orElse(),
  }) {
    if (tagDeselected != null) {
      return tagDeselected(this);
    }
    return orElse();
  }
}

abstract class TagDeselected implements BookTagsEvent {
  const factory TagDeselected(final Tag tag) = _$TagDeselectedImpl;

  Tag get tag;

  /// Create a copy of BookTagsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TagDeselectedImplCopyWith<_$TagDeselectedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ClearSelectedTagsImplCopyWith<$Res> {
  factory _$$ClearSelectedTagsImplCopyWith(_$ClearSelectedTagsImpl value,
          $Res Function(_$ClearSelectedTagsImpl) then) =
      __$$ClearSelectedTagsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ClearSelectedTagsImplCopyWithImpl<$Res>
    extends _$BookTagsEventCopyWithImpl<$Res, _$ClearSelectedTagsImpl>
    implements _$$ClearSelectedTagsImplCopyWith<$Res> {
  __$$ClearSelectedTagsImplCopyWithImpl(_$ClearSelectedTagsImpl _value,
      $Res Function(_$ClearSelectedTagsImpl) _then)
      : super(_value, _then);

  /// Create a copy of BookTagsEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ClearSelectedTagsImpl implements ClearSelectedTags {
  const _$ClearSelectedTagsImpl();

  @override
  String toString() {
    return 'BookTagsEvent.clearSelectedTags()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ClearSelectedTagsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Tag tag) tagSelected,
    required TResult Function(Tag tag) tagDeselected,
    required TResult Function() clearSelectedTags,
  }) {
    return clearSelectedTags();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Tag tag)? tagSelected,
    TResult? Function(Tag tag)? tagDeselected,
    TResult? Function()? clearSelectedTags,
  }) {
    return clearSelectedTags?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Tag tag)? tagSelected,
    TResult Function(Tag tag)? tagDeselected,
    TResult Function()? clearSelectedTags,
    required TResult orElse(),
  }) {
    if (clearSelectedTags != null) {
      return clearSelectedTags();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TagSelected value) tagSelected,
    required TResult Function(TagDeselected value) tagDeselected,
    required TResult Function(ClearSelectedTags value) clearSelectedTags,
  }) {
    return clearSelectedTags(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TagSelected value)? tagSelected,
    TResult? Function(TagDeselected value)? tagDeselected,
    TResult? Function(ClearSelectedTags value)? clearSelectedTags,
  }) {
    return clearSelectedTags?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TagSelected value)? tagSelected,
    TResult Function(TagDeselected value)? tagDeselected,
    TResult Function(ClearSelectedTags value)? clearSelectedTags,
    required TResult orElse(),
  }) {
    if (clearSelectedTags != null) {
      return clearSelectedTags(this);
    }
    return orElse();
  }
}

abstract class ClearSelectedTags implements BookTagsEvent {
  const factory ClearSelectedTags() = _$ClearSelectedTagsImpl;
}
