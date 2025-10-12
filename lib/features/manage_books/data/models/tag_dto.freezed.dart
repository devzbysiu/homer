// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tag_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TagDTO {

 String get name; String get hexColor;
/// Create a copy of TagDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TagDTOCopyWith<TagDTO> get copyWith => _$TagDTOCopyWithImpl<TagDTO>(this as TagDTO, _$identity);

  /// Serializes this TagDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TagDTO&&(identical(other.name, name) || other.name == name)&&(identical(other.hexColor, hexColor) || other.hexColor == hexColor));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,hexColor);

@override
String toString() {
  return 'TagDTO(name: $name, hexColor: $hexColor)';
}


}

/// @nodoc
abstract mixin class $TagDTOCopyWith<$Res>  {
  factory $TagDTOCopyWith(TagDTO value, $Res Function(TagDTO) _then) = _$TagDTOCopyWithImpl;
@useResult
$Res call({
 String name, String hexColor
});




}
/// @nodoc
class _$TagDTOCopyWithImpl<$Res>
    implements $TagDTOCopyWith<$Res> {
  _$TagDTOCopyWithImpl(this._self, this._then);

  final TagDTO _self;
  final $Res Function(TagDTO) _then;

/// Create a copy of TagDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? hexColor = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,hexColor: null == hexColor ? _self.hexColor : hexColor // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [TagDTO].
extension TagDTOPatterns on TagDTO {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TagDTO value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TagDTO() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TagDTO value)  $default,){
final _that = this;
switch (_that) {
case _TagDTO():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TagDTO value)?  $default,){
final _that = this;
switch (_that) {
case _TagDTO() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String hexColor)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TagDTO() when $default != null:
return $default(_that.name,_that.hexColor);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String hexColor)  $default,) {final _that = this;
switch (_that) {
case _TagDTO():
return $default(_that.name,_that.hexColor);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String hexColor)?  $default,) {final _that = this;
switch (_that) {
case _TagDTO() when $default != null:
return $default(_that.name,_that.hexColor);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TagDTO implements TagDTO {
  const _TagDTO({required this.name, required this.hexColor});
  factory _TagDTO.fromJson(Map<String, dynamic> json) => _$TagDTOFromJson(json);

@override final  String name;
@override final  String hexColor;

/// Create a copy of TagDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TagDTOCopyWith<_TagDTO> get copyWith => __$TagDTOCopyWithImpl<_TagDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TagDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TagDTO&&(identical(other.name, name) || other.name == name)&&(identical(other.hexColor, hexColor) || other.hexColor == hexColor));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,hexColor);

@override
String toString() {
  return 'TagDTO(name: $name, hexColor: $hexColor)';
}


}

/// @nodoc
abstract mixin class _$TagDTOCopyWith<$Res> implements $TagDTOCopyWith<$Res> {
  factory _$TagDTOCopyWith(_TagDTO value, $Res Function(_TagDTO) _then) = __$TagDTOCopyWithImpl;
@override @useResult
$Res call({
 String name, String hexColor
});




}
/// @nodoc
class __$TagDTOCopyWithImpl<$Res>
    implements _$TagDTOCopyWith<$Res> {
  __$TagDTOCopyWithImpl(this._self, this._then);

  final _TagDTO _self;
  final $Res Function(_TagDTO) _then;

/// Create a copy of TagDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? hexColor = null,}) {
  return _then(_TagDTO(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,hexColor: null == hexColor ? _self.hexColor : hexColor // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
