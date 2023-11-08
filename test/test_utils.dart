import 'package:dartz/dartz.dart';
import 'package:faker/faker.dart';
import 'package:homer/features/find_new_book/data/models/remote_book_dto.dart';
import 'package:homer/features/find_new_book/domain/entities/remote_book.dart';
import 'package:homer/features/manage_books/data/models/local_book_dto.dart';
import 'package:homer/features/manage_books/data/models/local_tag_dto.dart';
import 'package:homer/features/manage_books/domain/entities/local_book.dart';
import 'package:homer/features/tags_manager/domain/entities/tag.dart';

LocalBookDTO fakeLocalBookDTO() => LocalBookDTO(
      title: faker.lorem.word(),
      subtitle: faker.lorem.sentence(),
      authors: [faker.person.name()],
      state: _fakeBookStateDTO(),
      pageCount: faker.randomGenerator.integer(1024),
      isbn: faker.guid.guid(),
      thumbnailAddress: faker.internet.httpsUrl(),
      rating: faker.randomGenerator.decimal(scale: 5),
      summary: faker.lorem.sentences(7).join(' '),
      tags: [
        LocalTagDTO()
          ..name = faker.lorem.word()
          ..hexColor = faker.color.color(),
        LocalTagDTO()
          ..name = faker.lorem.word()
          ..hexColor = faker.color.color(),
      ],
      startDate: faker.date.dateTime().millisecondsSinceEpoch,
      endDate: faker.date.dateTime().millisecondsSinceEpoch,
    );

LocalBook fakeLocalBook() => LocalBook(
      title: faker.lorem.word(),
      subtitle: faker.lorem.sentence(),
      authors: [faker.person.name()],
      state: _fakeBookState(),
      pageCount: faker.randomGenerator.integer(1024),
      isbn: faker.guid.guid(),
      thumbnailAddress: some(faker.internet.httpsUrl()),
      rating: faker.randomGenerator.decimal(scale: 5),
      summary: some(faker.lorem.sentences(7).join(' ')),
      tags: [fakeTag(), fakeTag()],
      startDate: some(faker.date.dateTime(minYear: 1990, maxYear: 2023)),
      endDate: some(faker.date.dateTime(minYear: 1990, maxYear: 2023)),
    );

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

LocalBookStateDTO _fakeBookStateDTO() {
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
    title: faker.lorem.word(),
    subtitle: faker.lorem.sentence(),
    authors: [faker.person.name()],
    pageCount: faker.randomGenerator.integer(1024),
    industryIdentifiers: [faker.guid.guid()],
    imageLinks: {'': Uri.parse(faker.internet.httpsUrl())},
    description: faker.lorem.sentences(7).join(' '),
    averageRating: faker.randomGenerator.decimal(scale: 5),
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

RemoteBook fakeRemoteBook() {
  return RemoteBook(
    title: faker.lorem.word(),
    subtitle: faker.lorem.sentence(),
    authors: [faker.person.name()],
    pageCount: faker.randomGenerator.integer(1024),
    isbn: faker.guid.guid(),
    thumbnail: some(Uri.parse(faker.internet.httpsUrl())),
    averageRating: faker.randomGenerator.decimal(scale: 5),
    description: faker.lorem.sentences(7).join(' '),
  );
}

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

Tag fakeTag() {
  return Tag(
    name: faker.lorem.word(),
    hexColor: faker.color.color(),
  );
}

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
