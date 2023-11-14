import 'package:dartz/dartz.dart';
import 'package:faker/faker.dart';
import 'package:homer/features/backup_and_restore/data/models/local_backup_book_dto.dart';
import 'package:homer/features/manage_books/domain/entities/local_book.dart';
import 'package:homer/features/tags_manager/domain/entities/tag.dart';

//
// LocalBookDTO fakeLocalBookDTO() => LocalBookDTO(
//       title: _fakeTitle(),
//       subtitle: _fakeSubtitle(),
//       authors: [_fakeAuthor()],
//       state: _fakeLocalBookStateDTO(),
//       pageCount: _fakePageCount(),
//       isbn: _fakeIsbn(),
//       thumbnailAddress: _fakeThumbnailAddress(),
//       rating: _fakeRating(),
//       summary: _fakeSummary(),
//       tags: [
//         LocalTagDTO()
//           ..name = _fakeTagName()
//           ..hexColor = _fakeTagColor(),
//         LocalTagDTO()
//           ..name = _fakeTagName()
//           ..hexColor = _fakeTagColor(),
//       ],
//       startDate: _fakeDateMillis(),
//       endDate: _fakeDateMillis(),
//     );
//
String _fakeTitle() => _fakeTagName();

String _fakeSubtitle() => faker.lorem.sentence();

String _fakeAuthor() => faker.person.name();

int _fakePageCount() => faker.randomGenerator.integer(1024);

String _fakeIsbn() => faker.guid.guid();

String _fakeThumbnailAddress() => faker.internet.httpsUrl();

double _fakeRating() => faker.randomGenerator.decimal(scale: 5);

String _fakeSummary() => faker.lorem.sentences(7).join(' ');

String _fakeTagColor() => faker.color.color();

String _fakeTagName() => faker.lorem.word();

int _fakeDateMillis() => faker.date.dateTime().millisecondsSinceEpoch;

DateTime _fakeDate() => faker.date.dateTime(minYear: 1990, maxYear: 2023);
//
LocalBook fakeLocalBook() {
  return LocalBook(
    title: _fakeTitle(),
    subtitle: _fakeSubtitle(),
    authors: [_fakeAuthor()],
    state: _fakeBookState(),
    pageCount: _fakePageCount(),
    isbn: _fakeIsbn(),
    thumbnailAddress: some(_fakeThumbnailAddress()),
    rating: _fakeRating(),
    summary: some(_fakeSummary()),
    tags: [fakeTag(), fakeTag()],
    startDate: some(_fakeDate()),
    endDate: some(_fakeDate()),
  );
}

//
// extension LocalBookDTOExt on LocalBookDTO {
//   LocalBookDTO copyWith({
//     String? title,
//     String? subtitle,
//     List<String>? authors,
//     LocalBookStateDTO? state,
//     int? pageCount,
//     String? isbn,
//     String? thumbnailAddress,
//     double? rating,
//     String? summary,
//     List<LocalTagDTO>? tags,
//     int? startDate,
//     int? endDate,
//   }) {
//     return LocalBookDTO(
//       title: title ?? this.title,
//       subtitle: subtitle ?? this.subtitle,
//       authors: authors ?? this.authors,
//       state: state ?? this.state,
//       pageCount: pageCount ?? this.pageCount,
//       isbn: isbn ?? this.isbn,
//       thumbnailAddress: thumbnailAddress,
//       rating: rating ?? this.rating,
//       summary: summary ?? this.summary,
//       tags: tags ?? this.tags,
//       startDate: startDate ?? this.startDate,
//       endDate: endDate ?? this.endDate,
//     );
//   }
//
//   LocalBookDTO copyWithNull({
//     bool? thumbnailAddress,
//     bool? summary,
//     bool? startDate,
//     bool? endDate,
//   }) {
//     return LocalBookDTO(
//       title: title,
//       subtitle: subtitle,
//       authors: authors,
//       state: state,
//       pageCount: pageCount,
//       isbn: isbn,
//       thumbnailAddress: thumbnailAddress == true ? null : this.thumbnailAddress,
//       rating: rating,
//       summary: summary == true ? null : this.summary,
//       tags: tags,
//       startDate: startDate == true ? null : this.startDate,
//       endDate: endDate == true ? null : this.endDate,
//     );
//   }
// }
//
// LocalBook localBookFromDTO(LocalBookDTO book) {
//   return LocalBook(
//     title: book.title,
//     subtitle: book.subtitle,
//     authors: book.authors,
//     state: _stateFromStateDTO(book.state),
//     pageCount: book.pageCount,
//     isbn: book.isbn,
//     thumbnailAddress: optionOf(book.thumbnailAddress),
//     rating: book.rating,
//     summary: optionOf(book.summary),
//     tags: book.tags.map((tag) {
//       return Tag(
//         name: tag.name,
//         hexColor: tag.hexColor,
//       );
//     }).toList(),
//     startDate: some(DateTime.fromMillisecondsSinceEpoch(book.startDate!)),
//     endDate: some(DateTime.fromMillisecondsSinceEpoch(book.endDate!)),
//   );
// }
//
// LocalBookDTO dtoFromLocalBook(LocalBook book) {
//   return LocalBookDTO(
//     title: book.title,
//     subtitle: book.subtitle,
//     authors: book.authors,
//     state: _stateDTOFromBook(book),
//     pageCount: book.pageCount,
//     isbn: book.isbn,
//     thumbnailAddress: book.thumbnailAddress.toNullable(),
//     rating: book.rating,
//     summary: book.summary.toNullable(),
//     tags: book.tags.map((tag) {
//       return LocalTagDTO()
//         ..name = tag.name
//         ..hexColor = tag.hexColor;
//     }).toList(),
//     startDate: book.startDate
//         .getOrElse(() => throw Exception('should not happen'))
//         .millisecondsSinceEpoch,
//     endDate: book.endDate
//         .getOrElse(() => throw Exception('should not happen'))
//         .millisecondsSinceEpoch,
//   );
// }
//
// LocalBookStateDTO _fakeLocalBookStateDTO() {
//   switch (faker.randomGenerator.integer(4, min: 1)) {
//     case 1:
//       return LocalBookStateDTO.readLater;
//     case 2:
//       return LocalBookStateDTO.readLater;
//     case 3:
//       return LocalBookStateDTO.readLater;
//     default:
//       throw Exception('Should not happen');
//   }
// }
//
// LocalBookStateDTO _stateDTOFromBook(LocalBook book) {
//   switch (book.state) {
//     case BookState.readLater:
//       return LocalBookStateDTO.readLater;
//     case BookState.reading:
//       return LocalBookStateDTO.reading;
//     case BookState.read:
//       return LocalBookStateDTO.read;
//   }
// }
//
// BookState _fakeBookState() {
//   switch (faker.randomGenerator.integer(4, min: 1)) {
//     case 1:
//       return BookState.readLater;
//     case 2:
//       return BookState.reading;
//     case 3:
//       return BookState.read;
//     default:
//       throw Exception('Should not happen');
//   }
// }
//
// BookState _stateFromStateDTO(LocalBookStateDTO state) {
//   switch (state) {
//     case LocalBookStateDTO.readLater:
//       return BookState.readLater;
//     case LocalBookStateDTO.reading:
//       return BookState.reading;
//     case LocalBookStateDTO.read:
//       return BookState.read;
//   }
// }
//
// RemoteBookDTO fakeRemoteBookDTO() {
//   return RemoteBookDTO(
//     title: _fakeTitle(),
//     subtitle: _fakeSubtitle(),
//     authors: [_fakeAuthor()],
//     pageCount: _fakePageCount(),
//     industryIdentifiers: [_fakeIsbn()],
//     imageLinks: {'': Uri.parse(_fakeThumbnailAddress())},
//     description: _fakeSummary(),
//     averageRating: _fakeRating(),
//   );
// }
//
// RemoteBook remoteBookFromDTO(RemoteBookDTO book) {
//   final description = book.description ?? '';
//   return RemoteBook(
//     title: book.title,
//     subtitle: book.subtitle,
//     authors: book.authors,
//     pageCount: book.pageCount,
//     isbn: book.industryIdentifiers.firstOrNull?.toString() ?? '',
//     thumbnail: optionOf(book.imageLinks.values.firstOrNull),
//     averageRating: book.averageRating,
//     description: description.isEmpty ? 'No description.' : description,
//   );
// }
//
// extension RemoteBookDTOExt on RemoteBookDTO {
//   RemoteBookDTO copyWith({
//     String? title,
//     String? subtitle,
//     List<String>? authors,
//     int? pageCount,
//     List<String>? industryIdentifiers,
//     Map<String, Uri>? imageLinks,
//     double? averageRating,
//     String? description,
//   }) {
//     return RemoteBookDTO(
//       title: title ?? this.title,
//       subtitle: subtitle ?? this.subtitle,
//       authors: authors ?? this.authors,
//       pageCount: pageCount ?? this.pageCount,
//       industryIdentifiers: industryIdentifiers ?? this.industryIdentifiers,
//       imageLinks: imageLinks ?? this.imageLinks,
//       averageRating: averageRating ?? this.averageRating,
//       description: description ?? this.description,
//     );
//   }
//
//   RemoteBookDTO copyWithNull({
//     bool? description,
//   }) {
//     return RemoteBookDTO(
//       title: title,
//       subtitle: subtitle,
//       authors: authors,
//       pageCount: pageCount,
//       industryIdentifiers: industryIdentifiers,
//       imageLinks: imageLinks,
//       averageRating: averageRating,
//       description: description == true ? null : this.description,
//     );
//   }
// }
//
// RemoteBook fakeRemoteBook() => RemoteBook(
//       title: _fakeTitle(),
//       subtitle: _fakeSubtitle(),
//       authors: [_fakeAuthor()],
//       pageCount: _fakePageCount(),
//       isbn: _fakeIsbn(),
//       thumbnail: some(Uri.parse(_fakeThumbnailAddress())),
//       averageRating: _fakeRating(),
//       description: _fakeSummary(),
//     );
//
// BookState fakeLocalBookState() {
//   switch (faker.randomGenerator.integer(4, min: 1)) {
//     case 1:
//       return BookState.readLater;
//     case 2:
//       return BookState.readLater;
//     case 3:
//       return BookState.readLater;
//     default:
//       throw Exception('Should not happen');
//   }
// }
//
Tag fakeTag() {
  return Tag()
    ..name = _fakeTagName()
    ..hexColor = _fakeTagColor();
}

//
// LocalBook localBookFrom(
//   RemoteBook book,
//   BookState localBookState,
//   List<Tag> tags,
// ) {
//   return LocalBook(
//     title: book.title,
//     subtitle: book.subtitle,
//     authors: book.authors,
//     state: localBookState,
//     pageCount: book.pageCount,
//     isbn: book.isbn,
//     thumbnailAddress: book.thumbnail.map((uri) => uri.toString()),
//     rating: book.averageRating,
//     summary: book.description.isEmpty ? none() : some(book.description),
//     tags: tags,
//     startDate: none(),
//     endDate: none(),
//   );
// }
//
// extension RemoteBookExt on RemoteBook {
//   RemoteBook copyWith({
//     String? title,
//     String? subtitle,
//     List<String>? authors,
//     int? pageCount,
//     String? isbn,
//     Option<Uri>? thumbnail,
//     double? averageRating,
//     String? description,
//   }) {
//     return RemoteBook(
//       title: title ?? this.title,
//       subtitle: subtitle ?? this.subtitle,
//       authors: authors ?? this.authors,
//       pageCount: pageCount ?? this.pageCount,
//       isbn: isbn ?? this.isbn,
//       thumbnail: thumbnail ?? this.thumbnail,
//       averageRating: averageRating ?? this.averageRating,
//       description: description ?? this.description,
//     );
//   }
// }
//
// RestoredBook fakeRestoredBook() => RestoredBook(
//       title: _fakeTitle(),
//       subtitle: _fakeSubtitle(),
//       authors: [_fakeAuthor()],
//       state: _fakeRestoredBookState(),
//       pageCount: _fakePageCount(),
//       isbn: _fakeIsbn(),
//       thumbnailAddress: some(_fakeThumbnailAddress()),
//       rating: _fakeRating(),
//       summary: some(_fakeSummary()),
//       tags: {
//         RestoredTag(
//           title: _fakeTagName(),
//           hexColor: _fakeTagColor(),
//         ),
//         RestoredTag(
//           title: _fakeTagName(),
//           hexColor: _fakeTagColor(),
//         ),
//       },
//       startDate: some(_fakeDate()),
//       endDate: some(_fakeDate()),
//     );
//
// RestoredBookState _fakeRestoredBookState() {
//   switch (faker.randomGenerator.integer(4, min: 1)) {
//     case 1:
//       return RestoredBookState.readLater;
//     case 2:
//       return RestoredBookState.readLater;
//     case 3:
//       return RestoredBookState.readLater;
//     default:
//       throw Exception('Should not happen');
//   }
// }
//
// LocalBook localBookFromRestored(RestoredBook book) => LocalBook(
//       title: book.title,
//       subtitle: book.subtitle,
//       authors: book.authors,
//       state: _stateFromRestoredState(book.state),
//       pageCount: book.pageCount,
//       isbn: book.isbn,
//       thumbnailAddress: book.thumbnailAddress,
//       rating: book.rating,
//       summary: book.summary,
//       tags: book.tags.map((tag) {
//         return Tag(
//           name: tag.title,
//           hexColor: tag.hexColor,
//         );
//       }).toList(),
//       startDate: book.startDate,
//       endDate: book.endDate,
//     );
//
// BookState _stateFromRestoredState(RestoredBookState state) {
//   switch (state) {
//     case RestoredBookState.readLater:
//       return BookState.readLater;
//     case RestoredBookState.reading:
//       return BookState.reading;
//     case RestoredBookState.read:
//       return BookState.read;
//   }
// }
//
// extension RestoredBookExt on RestoredBook {
//   RestoredBook copyWith({
//     String? title,
//     String? subtitle,
//     List<String>? authors,
//     RestoredBookState? state,
//     int? pageCount,
//     String? isbn,
//     Option<String>? thumbnailAddress,
//     double? rating,
//     Option<String>? summary,
//     Set<RestoredTag>? tags,
//     Option<DateTime>? startDate,
//     Option<DateTime>? endDate,
//   }) {
//     return RestoredBook(
//       title: title ?? this.title,
//       subtitle: subtitle ?? this.subtitle,
//       authors: authors ?? this.authors,
//       state: state ?? this.state,
//       pageCount: pageCount ?? this.pageCount,
//       isbn: isbn ?? this.isbn,
//       thumbnailAddress: thumbnailAddress ?? this.thumbnailAddress,
//       rating: rating ?? this.rating,
//       summary: summary ?? this.summary,
//       tags: tags ?? this.tags,
//       startDate: startDate ?? this.startDate,
//       endDate: endDate ?? this.endDate,
//     );
//   }
// }
//
Map<String, Object> fakeLocalBackupBookDTOJson() {
  return {
    'title': _fakeTitle(),
    'subtitle': _fakeSubtitle(),
    'authors': [_fakeAuthor()],
    'state': _fakeBookStateString(),
    'pageCount': _fakePageCount(),
    'isbn': _fakeIsbn(),
    'thumbnailAddress': _fakeThumbnailAddress(),
    'rating': _fakeRating(),
    'summary': _fakeSummary(),
    'tags': [
      {
        'name': _fakeTagName(),
        'hexColor': _fakeTagColor(),
      },
    ],
    'startDate': _fakeDateMillis(),
    'endDate': _fakeDateMillis(),
  };
}

String _fakeBookStateString() {
  switch (faker.randomGenerator.integer(4, min: 1)) {
    case 1:
      return 'readLater';
    case 2:
      return 'reading';
    case 3:
      return 'read';
    default:
      throw Exception('Should not happen');
  }
}

LocalBackupBookDTO localBackupBookDTOFromJson(Map<String, dynamic> json) {
  return LocalBackupBookDTO(
    title: json['title'],
    subtitle: json['subtitle'],
    authors: json['authors'],
    state: stateFromString(json['state']),
    pageCount: json['pageCount'],
    isbn: json['isbn'],
    thumbnailAddress: some(json['thumbnailAddress']),
    rating: json['rating'],
    summary: some(json['summary']),
    tags: tagsFromJson(json['tags']),
    startDate: some(DateTime.fromMillisecondsSinceEpoch(json['startDate'])),
    endDate: some(DateTime.fromMillisecondsSinceEpoch(json['endDate'])),
  );
}

BookState stateFromString(String state) {
  switch (state) {
    case 'readLater':
      return BookState.readLater;
    case 'reading':
      return BookState.reading;
    case 'read':
      return BookState.read;
    default:
      throw Exception('should not happen');
  }
}

// TODO: DTO should have it's own TagDTO
List<Tag> tagsFromJson(List<Map<String, dynamic>> tags) {
  return tags.map((tagJson) => tagFromJson(tagJson)).toList();
}

Tag tagFromJson(Map<String, dynamic> tagJson) {
  return Tag()
    ..name = tagJson['name']
    ..hexColor = tagJson['hexColor'];
}

LocalBackupBookDTO fakeLocalBackupBookDTO() {
  return LocalBackupBookDTO(
    title: _fakeTitle(),
    subtitle: _fakeSubtitle(),
    authors: [_fakeAuthor()],
    state: _fakeBookState(),
    pageCount: _fakePageCount(),
    isbn: _fakeIsbn(),
    thumbnailAddress: some(_fakeThumbnailAddress()),
    rating: _fakeRating(),
    summary: some(_fakeSummary()),
    tags: [
      Tag()
        ..name = _fakeTagName()
        ..hexColor = _fakeTagColor(),
      Tag()
        ..name = _fakeTagName()
        ..hexColor = _fakeTagColor(),
    ],
    startDate: some(_fakeDate()),
    endDate: some(_fakeDate()),
  );
}

BookState _fakeBookState() {
  switch (faker.randomGenerator.integer(4, min: 1)) {
    case 1:
      return BookState.readLater;
    case 2:
      return BookState.reading;
    case 3:
      return BookState.read;
    default:
      throw Exception('Should not happen');
  }
}

//
// LocalBackupBookStateDTO _fakeLocalBackupBookStateDTO() {
//   switch (faker.randomGenerator.integer(4, min: 1)) {
//     case 1:
//       return LocalBackupBookStateDTO.readLater;
//     case 2:
//       return LocalBackupBookStateDTO.readLater;
//     case 3:
//       return LocalBackupBookStateDTO.readLater;
//     default:
//       throw Exception('Should not happen');
//   }
// }
//
Map<String, dynamic> localBackupBookDTOToJson(LocalBackupBookDTO book) {
  return {
    'title': book.title,
    'subtitle': book.subtitle,
    'authors': book.authors,
    'state': _bookStateToString(book.state),
    'pageCount': book.pageCount,
    'isbn': book.isbn,
    'thumbnailAddress': book.thumbnailAddress.getOrElse(() => ''),
    'rating': book.rating,
    'summary': book.summary.getOrElse(() => ''),
    'tags': book.tags,
    'startDate':
        book.startDate.fold(() => 0, (date) => date.millisecondsSinceEpoch),
    'endDate':
        book.endDate.fold(() => 0, (date) => date.millisecondsSinceEpoch),
  };
}

// TODO: LocalBackupBookDTO should have it's own StateDTO
String _bookStateToString(BookState state) {
  switch (state) {
    case BookState.readLater:
      return 'readLater';
    case BookState.reading:
      return 'reading';
    case BookState.read:
      return 'read';
  }
}
//
// RestoredBook restoredBookFromDTO(LocalBackupBookDTO book) {
//   return RestoredBook(
//     title: book.title,
//     subtitle: book.subtitle,
//     authors: book.authors,
//     state: _restoredStateFromDTO(book.state),
//     pageCount: book.pageCount,
//     isbn: book.isbn,
//     thumbnailAddress: book.thumbnailAddress,
//     rating: book.rating,
//     summary: book.summary,
//     tags: _restoredTagsFromDTO(book.tags),
//     startDate: book.startDate,
//     endDate: book.endDate,
//   );
// }
//
// RestoredBookState _restoredStateFromDTO(LocalBackupBookStateDTO state) {
//   switch (state) {
//     case LocalBackupBookStateDTO.readLater:
//       return RestoredBookState.readLater;
//     case LocalBackupBookStateDTO.reading:
//       return RestoredBookState.reading;
//     case LocalBackupBookStateDTO.read:
//       return RestoredBookState.read;
//   }
// }
//
// Set<RestoredTag> _restoredTagsFromDTO(Set<LocalBackupTagDTO> tags) {
//   // TODO: Make tag.name vs tag.title consistent
//   return tags
//       .map((tag) => RestoredTag(title: tag.name, hexColor: tag.hexColor))
//       .toSet();
// }
