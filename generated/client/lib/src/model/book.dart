//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'book.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Book {
  /// Returns a new [Book] instance.
  Book({

    required  this.title,

     this.subtitle = '',

     this.authors = [],

     this.pageCount = 0,

     this.industryIdentifiers = [],

     this.imageLinks = {},

     this.averageRating = 0.0,

     this.description,
  });

  @JsonKey(
    
    name: r'title',
    required: true,
    includeIfNull: false,
  )


  final String title;



      /// Empty string when no subtitle.
  @JsonKey(
    defaultValue: '',
    name: r'subtitle',
    required: true,
    includeIfNull: false,
  )


  final String subtitle;



  @JsonKey(
    defaultValue: [],
    name: r'authors',
    required: true,
    includeIfNull: false,
  )


  final List<String> authors;



  @JsonKey(
    defaultValue: 0,
    name: r'pageCount',
    required: true,
    includeIfNull: false,
  )


  final int pageCount;



      /// ISBN-10 and/or ISBN-13 strings.
  @JsonKey(
    defaultValue: [],
    name: r'industryIdentifiers',
    required: true,
    includeIfNull: false,
  )


  final List<String> industryIdentifiers;



      /// Map of image-size key → absolute URL. Typical keys: `thumbnail`, `smallThumbnail`. 
  @JsonKey(
    defaultValue: {},
    name: r'imageLinks',
    required: true,
    includeIfNull: false,
  )


  final Map<String, String> imageLinks;



  @JsonKey(
    defaultValue: 0.0,
    name: r'averageRating',
    required: true,
    includeIfNull: false,
  )


  final double averageRating;



      /// Book description/blurb. Null when not available.
  @JsonKey(
    
    name: r'description',
    required: false,
    includeIfNull: false,
  )


  final String? description;





    @override
    bool operator ==(Object other) => identical(this, other) || other is Book &&
      other.title == title &&
      other.subtitle == subtitle &&
      other.authors == authors &&
      other.pageCount == pageCount &&
      other.industryIdentifiers == industryIdentifiers &&
      other.imageLinks == imageLinks &&
      other.averageRating == averageRating &&
      other.description == description;

    @override
    int get hashCode =>
        title.hashCode +
        subtitle.hashCode +
        authors.hashCode +
        pageCount.hashCode +
        industryIdentifiers.hashCode +
        imageLinks.hashCode +
        averageRating.hashCode +
        (description == null ? 0 : description.hashCode);

  factory Book.fromJson(Map<String, dynamic> json) => _$BookFromJson(json);

  Map<String, dynamic> toJson() => _$BookToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

