// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'book_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BookDTO {

 int? get id; String get title; String get subtitle; List<String> get authors; BookStateDTO get state; int get pageCount; String get isbn; String? get thumbnailAddress; double get rating; String? get summary; List<TagDTO> get tags; int? get startDate; int? get endDate;
/// Create a copy of BookDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookDTOCopyWith<BookDTO> get copyWith => _$BookDTOCopyWithImpl<BookDTO>(this as BookDTO, _$identity);

  /// Serializes this BookDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookDTO&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.subtitle, subtitle) || other.subtitle == subtitle)&&const DeepCollectionEquality().equals(other.authors, authors)&&(identical(other.state, state) || other.state == state)&&(identical(other.pageCount, pageCount) || other.pageCount == pageCount)&&(identical(other.isbn, isbn) || other.isbn == isbn)&&(identical(other.thumbnailAddress, thumbnailAddress) || other.thumbnailAddress == thumbnailAddress)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.summary, summary) || other.summary == summary)&&const DeepCollectionEquality().equals(other.tags, tags)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,subtitle,const DeepCollectionEquality().hash(authors),state,pageCount,isbn,thumbnailAddress,rating,summary,const DeepCollectionEquality().hash(tags),startDate,endDate);

@override
String toString() {
  return 'BookDTO(id: $id, title: $title, subtitle: $subtitle, authors: $authors, state: $state, pageCount: $pageCount, isbn: $isbn, thumbnailAddress: $thumbnailAddress, rating: $rating, summary: $summary, tags: $tags, startDate: $startDate, endDate: $endDate)';
}


}

/// @nodoc
abstract mixin class $BookDTOCopyWith<$Res>  {
  factory $BookDTOCopyWith(BookDTO value, $Res Function(BookDTO) _then) = _$BookDTOCopyWithImpl;
@useResult
$Res call({
 int? id, String title, String subtitle, List<String> authors, BookStateDTO state, int pageCount, String isbn, String? thumbnailAddress, double rating, String? summary, List<TagDTO> tags, int? startDate, int? endDate
});




}
/// @nodoc
class _$BookDTOCopyWithImpl<$Res>
    implements $BookDTOCopyWith<$Res> {
  _$BookDTOCopyWithImpl(this._self, this._then);

  final BookDTO _self;
  final $Res Function(BookDTO) _then;

/// Create a copy of BookDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? title = null,Object? subtitle = null,Object? authors = null,Object? state = null,Object? pageCount = null,Object? isbn = null,Object? thumbnailAddress = freezed,Object? rating = null,Object? summary = freezed,Object? tags = null,Object? startDate = freezed,Object? endDate = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,subtitle: null == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as String,authors: null == authors ? _self.authors : authors // ignore: cast_nullable_to_non_nullable
as List<String>,state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as BookStateDTO,pageCount: null == pageCount ? _self.pageCount : pageCount // ignore: cast_nullable_to_non_nullable
as int,isbn: null == isbn ? _self.isbn : isbn // ignore: cast_nullable_to_non_nullable
as String,thumbnailAddress: freezed == thumbnailAddress ? _self.thumbnailAddress : thumbnailAddress // ignore: cast_nullable_to_non_nullable
as String?,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double,summary: freezed == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as String?,tags: null == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<TagDTO>,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as int?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [BookDTO].
extension BookDTOPatterns on BookDTO {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BookDTO value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BookDTO() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BookDTO value)  $default,){
final _that = this;
switch (_that) {
case _BookDTO():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BookDTO value)?  $default,){
final _that = this;
switch (_that) {
case _BookDTO() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  String title,  String subtitle,  List<String> authors,  BookStateDTO state,  int pageCount,  String isbn,  String? thumbnailAddress,  double rating,  String? summary,  List<TagDTO> tags,  int? startDate,  int? endDate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BookDTO() when $default != null:
return $default(_that.id,_that.title,_that.subtitle,_that.authors,_that.state,_that.pageCount,_that.isbn,_that.thumbnailAddress,_that.rating,_that.summary,_that.tags,_that.startDate,_that.endDate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  String title,  String subtitle,  List<String> authors,  BookStateDTO state,  int pageCount,  String isbn,  String? thumbnailAddress,  double rating,  String? summary,  List<TagDTO> tags,  int? startDate,  int? endDate)  $default,) {final _that = this;
switch (_that) {
case _BookDTO():
return $default(_that.id,_that.title,_that.subtitle,_that.authors,_that.state,_that.pageCount,_that.isbn,_that.thumbnailAddress,_that.rating,_that.summary,_that.tags,_that.startDate,_that.endDate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  String title,  String subtitle,  List<String> authors,  BookStateDTO state,  int pageCount,  String isbn,  String? thumbnailAddress,  double rating,  String? summary,  List<TagDTO> tags,  int? startDate,  int? endDate)?  $default,) {final _that = this;
switch (_that) {
case _BookDTO() when $default != null:
return $default(_that.id,_that.title,_that.subtitle,_that.authors,_that.state,_that.pageCount,_that.isbn,_that.thumbnailAddress,_that.rating,_that.summary,_that.tags,_that.startDate,_that.endDate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BookDTO implements BookDTO {
  const _BookDTO({this.id, required this.title, required this.subtitle, required final  List<String> authors, required this.state, required this.pageCount, required this.isbn, this.thumbnailAddress, required this.rating, this.summary, required final  List<TagDTO> tags, this.startDate, this.endDate}): _authors = authors,_tags = tags;
  factory _BookDTO.fromJson(Map<String, dynamic> json) => _$BookDTOFromJson(json);

@override final  int? id;
@override final  String title;
@override final  String subtitle;
 final  List<String> _authors;
@override List<String> get authors {
  if (_authors is EqualUnmodifiableListView) return _authors;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_authors);
}

@override final  BookStateDTO state;
@override final  int pageCount;
@override final  String isbn;
@override final  String? thumbnailAddress;
@override final  double rating;
@override final  String? summary;
 final  List<TagDTO> _tags;
@override List<TagDTO> get tags {
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tags);
}

@override final  int? startDate;
@override final  int? endDate;

/// Create a copy of BookDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookDTOCopyWith<_BookDTO> get copyWith => __$BookDTOCopyWithImpl<_BookDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BookDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookDTO&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.subtitle, subtitle) || other.subtitle == subtitle)&&const DeepCollectionEquality().equals(other._authors, _authors)&&(identical(other.state, state) || other.state == state)&&(identical(other.pageCount, pageCount) || other.pageCount == pageCount)&&(identical(other.isbn, isbn) || other.isbn == isbn)&&(identical(other.thumbnailAddress, thumbnailAddress) || other.thumbnailAddress == thumbnailAddress)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.summary, summary) || other.summary == summary)&&const DeepCollectionEquality().equals(other._tags, _tags)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,subtitle,const DeepCollectionEquality().hash(_authors),state,pageCount,isbn,thumbnailAddress,rating,summary,const DeepCollectionEquality().hash(_tags),startDate,endDate);

@override
String toString() {
  return 'BookDTO(id: $id, title: $title, subtitle: $subtitle, authors: $authors, state: $state, pageCount: $pageCount, isbn: $isbn, thumbnailAddress: $thumbnailAddress, rating: $rating, summary: $summary, tags: $tags, startDate: $startDate, endDate: $endDate)';
}


}

/// @nodoc
abstract mixin class _$BookDTOCopyWith<$Res> implements $BookDTOCopyWith<$Res> {
  factory _$BookDTOCopyWith(_BookDTO value, $Res Function(_BookDTO) _then) = __$BookDTOCopyWithImpl;
@override @useResult
$Res call({
 int? id, String title, String subtitle, List<String> authors, BookStateDTO state, int pageCount, String isbn, String? thumbnailAddress, double rating, String? summary, List<TagDTO> tags, int? startDate, int? endDate
});




}
/// @nodoc
class __$BookDTOCopyWithImpl<$Res>
    implements _$BookDTOCopyWith<$Res> {
  __$BookDTOCopyWithImpl(this._self, this._then);

  final _BookDTO _self;
  final $Res Function(_BookDTO) _then;

/// Create a copy of BookDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? title = null,Object? subtitle = null,Object? authors = null,Object? state = null,Object? pageCount = null,Object? isbn = null,Object? thumbnailAddress = freezed,Object? rating = null,Object? summary = freezed,Object? tags = null,Object? startDate = freezed,Object? endDate = freezed,}) {
  return _then(_BookDTO(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,subtitle: null == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as String,authors: null == authors ? _self._authors : authors // ignore: cast_nullable_to_non_nullable
as List<String>,state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as BookStateDTO,pageCount: null == pageCount ? _self.pageCount : pageCount // ignore: cast_nullable_to_non_nullable
as int,isbn: null == isbn ? _self.isbn : isbn // ignore: cast_nullable_to_non_nullable
as String,thumbnailAddress: freezed == thumbnailAddress ? _self.thumbnailAddress : thumbnailAddress // ignore: cast_nullable_to_non_nullable
as String?,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double,summary: freezed == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as String?,tags: null == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<TagDTO>,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as int?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
