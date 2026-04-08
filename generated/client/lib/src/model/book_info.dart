//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'book_info.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class BookInfo {
  /// Returns a new [BookInfo] instance.
  BookInfo({

    required  this.title,

     this.isbn10,

     this.isbn13,
  });

  @JsonKey(
    
    name: r'title',
    required: true,
    includeIfNull: false,
  )


  final String title;



      /// ISBN-10 identifier, or null if not found.
  @JsonKey(
    
    name: r'isbn10',
    required: false,
    includeIfNull: false,
  )


  final String? isbn10;



      /// ISBN-13 identifier, or null if not found.
  @JsonKey(
    
    name: r'isbn13',
    required: false,
    includeIfNull: false,
  )


  final String? isbn13;





    @override
    bool operator ==(Object other) => identical(this, other) || other is BookInfo &&
      other.title == title &&
      other.isbn10 == isbn10 &&
      other.isbn13 == isbn13;

    @override
    int get hashCode =>
        title.hashCode +
        (isbn10 == null ? 0 : isbn10.hashCode) +
        (isbn13 == null ? 0 : isbn13.hashCode);

  factory BookInfo.fromJson(Map<String, dynamic> json) => _$BookInfoFromJson(json);

  Map<String, dynamic> toJson() => _$BookInfoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

