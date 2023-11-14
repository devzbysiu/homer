import 'package:dartz/dartz.dart';
import 'package:faker/faker.dart';
import 'package:homer/features/backup_and_restore/data/models/local_backup_book_dto.dart';
import 'package:homer/features/backup_and_restore/domain/entities/restored_book.dart';
import 'package:homer/features/find_new_book/data/models/remote_book_dto.dart';
import 'package:homer/features/find_new_book/domain/entities/remote_book.dart';
import 'package:homer/features/manage_books/data/models/local_book_dto.dart';
import 'package:homer/features/manage_books/data/models/local_tag_dto.dart';
import 'package:homer/features/manage_books/domain/entities/local_book.dart';
import 'package:homer/features/tags_manager/domain/entities/tag.dart';

LocalBookDTO fakeLocalBookDTO() => LocalBookDTO(
      title: _fakeTitle(),
      subtitle: _fakeSubtitle(),
      authors: [_fakeAuthor()],
      state: _fakeLocalBookStateDTO(),
      pageCount: _fakePageCount(),
      isbn: _fakeIsbn(),
      thumbnailAddress: _fakeThumbnailAddress(),
      rating: _fakeRating(),
      summary: _fakeSummary(),
      tags: [
        LocalTagDTO()
          ..name = _fakeTagName()
          ..hexColor = _fakeTagColor(),
        LocalTagDTO()
          ..name = _fakeTagName()
          ..hexColor = _fakeTagColor(),
      ],
      startDate: _fakeDateMillis(),
      endDate: _fakeDateMillis(),
    );

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

LocalBook fakeLocalBook() => LocalBook(
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

DateTime _fakeDate() => faker.date.dateTime(minYear: 1990, maxYear: 2023);

extension LocalBookDTOExt on LocalBookDTO {
  LocalBookDTO copyWith({
    String? title,
    String? subtitle,
    List<String>? authors,
    LocalBookStateDTO? state,
    int? pageCount,
    String? isbn,
    String? thumbnailAddress,
    double? rating,
    String? summary,
    List<LocalTagDTO>? tags,
    int? startDate,
    int? endDate,
  }) {
    return LocalBookDTO(
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      authors: authors ?? this.authors,
      state: state ?? this.state,
      pageCount: pageCount ?? this.pageCount,
      isbn: isbn ?? this.isbn,
      thumbnailAddress: thumbnailAddress,
      rating: rating ?? this.rating,
      summary: summary ?? this.summary,
      tags: tags ?? this.tags,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
    );
  }

  LocalBookDTO copyWithNull({
    bool? thumbnailAddress,
    bool? summary,
    bool? startDate,
    bool? endDate,
  }) {
    return LocalBookDTO(
      title: title,
      subtitle: subtitle,
      authors: authors,
      state: state,
      pageCount: pageCount,
      isbn: isbn,
      thumbnailAddress: thumbnailAddress == true ? null : this.thumbnailAddress,
      rating: rating,
      summary: summary == true ? null : this.summary,
      tags: tags,
      startDate: startDate == true ? null : this.startDate,
      endDate: endDate == true ? null : this.endDate,
    );
  }
}

LocalBook localBookFromDTO(LocalBookDTO book) {
  return LocalBook(
    title: book.title,
    subtitle: book.subtitle,
    authors: book.authors,
    state: _stateFromStateDTO(book.state),
    pageCount: book.pageCount,
    isbn: book.isbn,
    thumbnailAddress: optionOf(book.thumbnailAddress),
    rating: book.rating,
    summary: optionOf(book.summary),
    tags: book.tags.map((tag) {
      return Tag(
        name: tag.name,
        hexColor: tag.hexColor,
      );
    }).toList(),
    startDate: some(DateTime.fromMillisecondsSinceEpoch(book.startDate!)),
    endDate: some(DateTime.fromMillisecondsSinceEpoch(book.endDate!)),
  );
}

LocalBookDTO dtoFromLocalBook(LocalBook book) {
  return LocalBookDTO(
    title: book.title,
    subtitle: book.subtitle,
    authors: book.authors,
    state: _stateDTOFromBook(book),
    pageCount: book.pageCount,
    isbn: book.isbn,
    thumbnailAddress: book.thumbnailAddress.toNullable(),
    rating: book.rating,
    summary: book.summary.toNullable(),
    tags: book.tags.map((tag) {
      return LocalTagDTO()
        ..name = tag.name
        ..hexColor = tag.hexColor;
    }).toList(),
    startDate: book.startDate
        .getOrElse(() => throw Exception('should not happen'))
        .millisecondsSinceEpoch,
    endDate: book.endDate
        .getOrElse(() => throw Exception('should not happen'))
        .millisecondsSinceEpoch,
  );
}

LocalBookStateDTO _fakeLocalBookStateDTO() {
  switch (faker.randomGenerator.integer(4, min: 1)) {
    case 1:
      return LocalBookStateDTO.readLater;
    case 2:
      return LocalBookStateDTO.readLater;
    case 3:
      return LocalBookStateDTO.readLater;
    default:
      throw Exception('Should not happen');
  }
}

LocalBookStateDTO _stateDTOFromBook(LocalBook book) {
  switch (book.state) {
    case LocalBookState.readLater:
      return LocalBookStateDTO.readLater;
    case LocalBookState.reading:
      return LocalBookStateDTO.reading;
    case LocalBookState.read:
      return LocalBookStateDTO.read;
  }
}

LocalBookState _fakeBookState() {
  switch (faker.randomGenerator.integer(4, min: 1)) {
    case 1:
      return LocalBookState.readLater;
    case 2:
      return LocalBookState.reading;
    case 3:
      return LocalBookState.read;
    default:
      throw Exception('Should not happen');
  }
}

LocalBookState _stateFromStateDTO(LocalBookStateDTO state) {
  switch (state) {
    case LocalBookStateDTO.readLater:
      return LocalBookState.readLater;
    case LocalBookStateDTO.reading:
      return LocalBookState.reading;
    case LocalBookStateDTO.read:
      return LocalBookState.read;
  }
}

RemoteBookDTO fakeRemoteBookDTO() {
  return RemoteBookDTO(
    title: _fakeTitle(),
    subtitle: _fakeSubtitle(),
    authors: [_fakeAuthor()],
    pageCount: _fakePageCount(),
    industryIdentifiers: [_fakeIsbn()],
    imageLinks: {'': Uri.parse(_fakeThumbnailAddress())},
    description: _fakeSummary(),
    averageRating: _fakeRating(),
  );
}

RemoteBook remoteBookFromDTO(RemoteBookDTO book) {
  final description = book.description ?? '';
  return RemoteBook(
    title: book.title,
    subtitle: book.subtitle,
    authors: book.authors,
    pageCount: book.pageCount,
    isbn: book.industryIdentifiers.firstOrNull?.toString() ?? '',
    thumbnail: optionOf(book.imageLinks.values.firstOrNull),
    averageRating: book.averageRating,
    description: description.isEmpty ? 'No description.' : description,
  );
}

extension RemoteBookDTOExt on RemoteBookDTO {
  RemoteBookDTO copyWith({
    String? title,
    String? subtitle,
    List<String>? authors,
    int? pageCount,
    List<String>? industryIdentifiers,
    Map<String, Uri>? imageLinks,
    double? averageRating,
    String? description,
  }) {
    return RemoteBookDTO(
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      authors: authors ?? this.authors,
      pageCount: pageCount ?? this.pageCount,
      industryIdentifiers: industryIdentifiers ?? this.industryIdentifiers,
      imageLinks: imageLinks ?? this.imageLinks,
      averageRating: averageRating ?? this.averageRating,
      description: description ?? this.description,
    );
  }

  RemoteBookDTO copyWithNull({
    bool? description,
  }) {
    return RemoteBookDTO(
      title: title,
      subtitle: subtitle,
      authors: authors,
      pageCount: pageCount,
      industryIdentifiers: industryIdentifiers,
      imageLinks: imageLinks,
      averageRating: averageRating,
      description: description == true ? null : this.description,
    );
  }
}

RemoteBook fakeRemoteBook() => RemoteBook(
      title: _fakeTitle(),
      subtitle: _fakeSubtitle(),
      authors: [_fakeAuthor()],
      pageCount: _fakePageCount(),
      isbn: _fakeIsbn(),
      thumbnail: some(Uri.parse(_fakeThumbnailAddress())),
      averageRating: _fakeRating(),
      description: _fakeSummary(),
    );

LocalBookState fakeLocalBookState() {
  switch (faker.randomGenerator.integer(4, min: 1)) {
    case 1:
      return LocalBookState.readLater;
    case 2:
      return LocalBookState.readLater;
    case 3:
      return LocalBookState.readLater;
    default:
      throw Exception('Should not happen');
  }
}

Tag fakeTag() => Tag(
      name: _fakeTagName(),
      hexColor: _fakeTagColor(),
    );

LocalBook localBookFrom(
  RemoteBook book,
  LocalBookState localBookState,
  List<Tag> tags,
) {
  return LocalBook(
    title: book.title,
    subtitle: book.subtitle,
    authors: book.authors,
    state: localBookState,
    pageCount: book.pageCount,
    isbn: book.isbn,
    thumbnailAddress: book.thumbnail.map((uri) => uri.toString()),
    rating: book.averageRating,
    summary: book.description.isEmpty ? none() : some(book.description),
    tags: tags,
    startDate: none(),
    endDate: none(),
  );
}

extension RemoteBookExt on RemoteBook {
  RemoteBook copyWith({
    String? title,
    String? subtitle,
    List<String>? authors,
    int? pageCount,
    String? isbn,
    Option<Uri>? thumbnail,
    double? averageRating,
    String? description,
  }) {
    return RemoteBook(
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      authors: authors ?? this.authors,
      pageCount: pageCount ?? this.pageCount,
      isbn: isbn ?? this.isbn,
      thumbnail: thumbnail ?? this.thumbnail,
      averageRating: averageRating ?? this.averageRating,
      description: description ?? this.description,
    );
  }
}

RestoredBook fakeRestoredBook() => RestoredBook(
      title: _fakeTitle(),
      subtitle: _fakeSubtitle(),
      authors: [_fakeAuthor()],
      state: _fakeRestoredBookState(),
      pageCount: _fakePageCount(),
      isbn: _fakeIsbn(),
      thumbnailAddress: some(_fakeThumbnailAddress()),
      rating: _fakeRating(),
      summary: some(_fakeSummary()),
      tags: {
        RestoredTag(
          title: _fakeTagName(),
          hexColor: _fakeTagColor(),
        ),
        RestoredTag(
          title: _fakeTagName(),
          hexColor: _fakeTagColor(),
        ),
      },
      startDate: some(_fakeDate()),
      endDate: some(_fakeDate()),
    );

RestoredBookState _fakeRestoredBookState() {
  switch (faker.randomGenerator.integer(4, min: 1)) {
    case 1:
      return RestoredBookState.readLater;
    case 2:
      return RestoredBookState.readLater;
    case 3:
      return RestoredBookState.readLater;
    default:
      throw Exception('Should not happen');
  }
}

LocalBook localBookFromRestored(RestoredBook book) => LocalBook(
      title: book.title,
      subtitle: book.subtitle,
      authors: book.authors,
      state: _stateFromRestoredState(book.state),
      pageCount: book.pageCount,
      isbn: book.isbn,
      thumbnailAddress: book.thumbnailAddress,
      rating: book.rating,
      summary: book.summary,
      tags: book.tags.map((tag) {
        return Tag(
          name: tag.title,
          hexColor: tag.hexColor,
        );
      }).toList(),
      startDate: book.startDate,
      endDate: book.endDate,
    );

LocalBookState _stateFromRestoredState(RestoredBookState state) {
  switch (state) {
    case RestoredBookState.readLater:
      return LocalBookState.readLater;
    case RestoredBookState.reading:
      return LocalBookState.reading;
    case RestoredBookState.read:
      return LocalBookState.read;
  }
}

extension RestoredBookExt on RestoredBook {
  RestoredBook copyWith({
    String? title,
    String? subtitle,
    List<String>? authors,
    RestoredBookState? state,
    int? pageCount,
    String? isbn,
    Option<String>? thumbnailAddress,
    double? rating,
    Option<String>? summary,
    Set<RestoredTag>? tags,
    Option<DateTime>? startDate,
    Option<DateTime>? endDate,
  }) {
    return RestoredBook(
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      authors: authors ?? this.authors,
      state: state ?? this.state,
      pageCount: pageCount ?? this.pageCount,
      isbn: isbn ?? this.isbn,
      thumbnailAddress: thumbnailAddress ?? this.thumbnailAddress,
      rating: rating ?? this.rating,
      summary: summary ?? this.summary,
      tags: tags ?? this.tags,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
    );
  }
}

Map<String, Object> fakeLocalBackupBookDTOJson() {
  return {
    'title': _fakeTitle(),
    'subtitle': _fakeSubtitle(),
    'authors': [_fakeAuthor()],
    'state': _fakeLocalBackupBookStateDTOString(),
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

String _fakeLocalBackupBookStateDTOString() {
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

LocalBackupBookStateDTO stateFromString(String state) {
  switch (state) {
    case 'readLater':
      return LocalBackupBookStateDTO.readLater;
    case 'reading':
      return LocalBackupBookStateDTO.reading;
    case 'read':
      return LocalBackupBookStateDTO.read;
    default:
      throw Exception('should not happen');
  }
}

Set<LocalBackupTagDTO> tagsFromJson(List<Map<String, dynamic>> tags) {
  return tags.map((tagJson) => tagFromJson(tagJson)).toSet();
}

LocalBackupTagDTO tagFromJson(Map<String, dynamic> tagJson) {
  return LocalBackupTagDTO(
    name: tagJson['name'],
    hexColor: tagJson['hexColor'],
  );
}

LocalBackupBookDTO fakeLocalBackupBookDTO() => LocalBackupBookDTO(
      title: _fakeTitle(),
      subtitle: _fakeSubtitle(),
      authors: [_fakeAuthor()],
      state: _fakeLocalBackupBookStateDTO(),
      pageCount: _fakePageCount(),
      isbn: _fakeIsbn(),
      thumbnailAddress: some(_fakeThumbnailAddress()),
      rating: _fakeRating(),
      summary: some(_fakeSummary()),
      tags: {
        LocalBackupTagDTO(name: _fakeTagName(), hexColor: _fakeTagColor()),
        LocalBackupTagDTO(name: _fakeTagName(), hexColor: _fakeTagColor()),
      },
      startDate: some(_fakeDate()),
      endDate: some(_fakeDate()),
    );

LocalBackupBookStateDTO _fakeLocalBackupBookStateDTO() {
  switch (faker.randomGenerator.integer(4, min: 1)) {
    case 1:
      return LocalBackupBookStateDTO.readLater;
    case 2:
      return LocalBackupBookStateDTO.readLater;
    case 3:
      return LocalBackupBookStateDTO.readLater;
    default:
      throw Exception('Should not happen');
  }
}

Map<String, dynamic> localBackupBookDTOToJson(LocalBackupBookDTO book) {
  return {
    'title': book.title,
    'subtitle': book.subtitle,
    'authors': book.authors,
    'state': _backupBookStateDTOToString(book.state),
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

String _backupBookStateDTOToString(LocalBackupBookStateDTO state) {
  switch (state) {
    case LocalBackupBookStateDTO.readLater:
      return 'readLater';
    case LocalBackupBookStateDTO.reading:
      return 'reading';
    case LocalBackupBookStateDTO.read:
      return 'read';
  }
}

RestoredBook restoredBookFromDTO(LocalBackupBookDTO book) {
  return RestoredBook(
    title: book.title,
    subtitle: book.subtitle,
    authors: book.authors,
    state: _restoredStateFromDTO(book.state),
    pageCount: book.pageCount,
    isbn: book.isbn,
    thumbnailAddress: book.thumbnailAddress,
    rating: book.rating,
    summary: book.summary,
    tags: _restoredTagsFromDTO(book.tags),
    startDate: book.startDate,
    endDate: book.endDate,
  );
}

RestoredBookState _restoredStateFromDTO(LocalBackupBookStateDTO state) {
  switch (state) {
    case LocalBackupBookStateDTO.readLater:
      return RestoredBookState.readLater;
    case LocalBackupBookStateDTO.reading:
      return RestoredBookState.reading;
    case LocalBackupBookStateDTO.read:
      return RestoredBookState.read;
  }
}

Set<RestoredTag> _restoredTagsFromDTO(Set<LocalBackupTagDTO> tags) {
  // TODO: Make tag.name vs tag.title consistent
  return tags
      .map((tag) => RestoredTag(title: tag.name, hexColor: tag.hexColor))
      .toSet();
}
