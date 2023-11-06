import 'package:dartz/dartz.dart';
import 'package:faker/faker.dart';
import 'package:homer/core/mappers/local_books_mapper.dart';
import 'package:homer/features/manage_books/data/models/local_book_dto.dart';
import 'package:homer/features/manage_books/data/models/local_tag_dto.dart';
import 'package:homer/features/manage_books/domain/entities/local_book.dart';
import 'package:homer/features/tags_manager/domain/entities/tag.dart';
import 'package:test/test.dart';

void main() {
  group('toLocalBooks', () {
    test('should return empty list when input is empty list', () {
      // given
      final List<LocalBookDTO> input = List.empty();

      // when
      final result = toLocalBooks(input);

      // then
      expect(result.isEmpty, true);
    });

    test('should convert every LocalBookDTO to LocalBook', () {
      // given
      final List<LocalBookDTO> input = [
        _fakeLocalBookDTO(),
        _fakeLocalBookDTO(),
      ];

      // when
      final result = toLocalBooks(input);

      // then
      expect(result, [
        _localBookFromDTO(input[0]),
        _localBookFromDTO(input[1]),
      ]);
    });

    test('should convert start date in millis to date', () {
      // given
      const dateInMillis = 1699281172000; // Monday, November 6, 2023 15:32:52
      final input = [_fakeLocalBookDTO().copyWith(startDate: dateInMillis)];

      // when
      final result = toLocalBooks(input);

      // then
      expect(result.length, 1);
      expect(result[0].startDate, some(DateTime(2023, 11, 6, 15, 32, 52)));
    });

    test('should convert end date in millis to date', () {
      // given
      const dateInMillis = 1699281172000; // Monday, November 6, 2023 15:32:52
      final input = [_fakeLocalBookDTO().copyWith(endDate: dateInMillis)];

      // when
      final result = toLocalBooks(input);

      // then
      expect(result.length, 1);
      expect(result[0].endDate, some(DateTime(2023, 11, 6, 15, 32, 52)));
    });

    test('should convert start date to none if it is zero', () {
      // given
      const dateInMillis = 0;
      final input = [_fakeLocalBookDTO().copyWith(startDate: dateInMillis)];

      // when
      final result = toLocalBooks(input);

      // then
      expect(result.length, 1);
      expect(result[0].startDate.isNone(), true);
    });

    test('should convert end date to none if it is zero', () {
      // given
      const dateInMillis = 0;
      final input = [_fakeLocalBookDTO().copyWith(endDate: dateInMillis)];

      // when
      final result = toLocalBooks(input);

      // then
      expect(result.length, 1);
      expect(result[0].endDate.isNone(), true);
    });

    test('should convert start date to none if it is zero', () {
      // given
      final input = [_fakeLocalBookDTO().copyWithNull(startDate: true)];

      // when
      final result = toLocalBooks(input);

      // then
      expect(result.length, 1);
      expect(result[0].startDate.isNone(), true);
    });

    test('should convert end date to none if it is null', () {
      // given
      final input = [_fakeLocalBookDTO().copyWithNull(endDate: true)];

      // when
      final result = toLocalBooks(input);

      // then
      expect(result.length, 1);
      expect(result[0].endDate.isNone(), true);
    });
  });

  group('toLocalBookDTOs', () {
    test('should return empty list when empty list is an input', () {
      // given
      final List<LocalBook> input = List.empty();

      // when
      final result = toLocalBookDTOs(input);

      // then
      expect(result.isEmpty, true);
    });

    test('should convert every LocalBook to LocalBookDTO', () {
      // given
      final input = [_fakeLocalBook(), _fakeLocalBook()];

      // when
      final result = toLocalBookDTOs(input);

      // then
      expect(result.length, 2);
      expect(result, [
        _dtoFromLocalBook(input[0]),
        _dtoFromLocalBook(input[1]),
      ]);
    });

    test('should convert none start date to 0', () {
      // given
      final input = [_fakeLocalBook().copyWith(startDate: none())];

      // when
      final result = toLocalBookDTOs(input);

      // then
      expect(result.length, 1);
      expect(result[0].startDate, 0);
    });

    test('should convert none end date to 0', () {
      // given
      final input = [_fakeLocalBook().copyWith(endDate: none())];

      // when
      final result = toLocalBookDTOs(input);

      // then
      expect(result.length, 1);
      expect(result[0].endDate, 0);
    });
  });
}

LocalBookDTO _fakeLocalBookDTO() => LocalBookDTO(
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

LocalBook _fakeLocalBook() => LocalBook(
      title: faker.lorem.word(),
      subtitle: faker.lorem.sentence(),
      authors: [faker.person.name()],
      state: _fakeBookState(),
      pageCount: faker.randomGenerator.integer(1024),
      isbn: faker.guid.guid(),
      thumbnailAddress: some(faker.internet.httpsUrl()),
      rating: faker.randomGenerator.decimal(scale: 5),
      summary: some(faker.lorem.sentences(7).join(' ')),
      tags: [
        Tag(
          name: faker.lorem.word(),
          hexColor: faker.color.color(),
        ),
        Tag(
          name: faker.lorem.word(),
          hexColor: faker.color.color(),
        )
      ],
      startDate: some(faker.date.dateTime(minYear: 1990, maxYear: 2023)),
      endDate: some(faker.date.dateTime(minYear: 1990, maxYear: 2023)),
    );

extension _LocalBookDTOExt on LocalBookDTO {
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

LocalBook _localBookFromDTO(LocalBookDTO book) {
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
    tags: [
      Tag(
        name: book.tags[0].name,
        hexColor: book.tags[0].hexColor,
      ),
      Tag(
        name: book.tags[1].name,
        hexColor: book.tags[1].hexColor,
      ),
    ],
    startDate: some(DateTime.fromMillisecondsSinceEpoch(book.startDate!)),
    endDate: some(DateTime.fromMillisecondsSinceEpoch(book.endDate!)),
  );
}

LocalBookDTO _dtoFromLocalBook(LocalBook book) {
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
    tags: [
      LocalTagDTO()
        ..name = book.tags[0].name
        ..hexColor = book.tags[0].hexColor,
      LocalTagDTO()
        ..name = book.tags[1].name
        ..hexColor = book.tags[1].hexColor,
    ],
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
