import 'package:dartz/dartz.dart';
import 'package:faker/faker.dart';
import 'package:homer/core/mappers/remote_books_mapper.dart';
import 'package:homer/features/find_new_book/data/models/remote_book_dto.dart';
import 'package:test/test.dart';

import '../../test_utils.dart';

void main() {
  group('toRemoteBooks', () {
    test('should return empty list when input was empty list', () {
      // given
      final List<RemoteBookDTO> input = List.empty();

      // when
      final result = toRemoteBooks(input);

      // then
      expect(result.isEmpty, true);
    });

    test('should map all DTOs to RemoteBooks', () {
      // given
      final input = [
        fakeRemoteBookDTO(),
        fakeRemoteBookDTO(),
      ];

      // when
      final result = toRemoteBooks(input);

      // then
      expect(result, [
        remoteBookFromDTO(input[0]),
        remoteBookFromDTO(input[1]),
      ]);
    });

    test('should make isbn empty string if input had empty isbn list', () {
      // given
      final input = [fakeRemoteBookDTO().copyWith(industryIdentifiers: [])];

      // when
      final result = toRemoteBooks(input);

      // then
      expect(result.length, 1);
      expect(result[0].isbn, '');
    });

    test('should pick first isbn from the list', () {
      // given
      final input = [
        fakeRemoteBookDTO().copyWith(industryIdentifiers: [
          'first-isbn',
          'second-isbn',
        ])
      ];

      // when
      final result = toRemoteBooks(input);

      // then
      expect(result.length, 1);
      expect(result[0].isbn, 'first-isbn');
    });

    test('should make thumbnail none when imageLinks is empty map', () {
      // given
      final input = [fakeRemoteBookDTO().copyWith(imageLinks: {})];

      // when
      final result = toRemoteBooks(input);

      // then
      expect(result.length, 1);
      expect(result[0].thumbnail.isNone(), true);
    });

    test('should pick first thumbnail value', () {
      // given
      final firstUri = Uri.parse(faker.internet.httpsUrl());
      final secondUri = Uri.parse(faker.internet.httpsUrl());
      final input = [
        fakeRemoteBookDTO().copyWith(imageLinks: {
          'first-key': firstUri,
          'second-key': secondUri,
        })
      ];

      // when
      final result = toRemoteBooks(input);

      // then
      expect(result.length, 1);
      expect(result[0].thumbnail, some(firstUri));
    });

    test('should give "No description." string when description is empty', () {
      // given
      final input = [fakeRemoteBookDTO().copyWith(description: '')];

      // when
      final result = toRemoteBooks(input);

      // then
      expect(result.length, 1);
      expect(result[0].description, 'No description.');
    });

    test('should give "No description." string when description is null', () {
      // given
      final input = [fakeRemoteBookDTO().copyWithNull(description: true)];

      // when
      final result = toRemoteBooks(input);

      // then
      expect(result.length, 1);
      expect(result[0].description, 'No description.');
    });

    test('should use description if given', () {
      // given
      final description = faker.lorem.sentences(3).join(' ');
      final input = [fakeRemoteBookDTO().copyWith(description: description)];

      // when
      final result = toRemoteBooks(input);

      // then
      expect(result.length, 1);
      expect(result[0].description, description);
    });
  });

  group('toLocalBook', () {
    test('should return LocalBook', () {
      // given
      final remoteBook = fakeRemoteBook();
      final localBookState = fakeLocalBookState();
      final tags = [fakeTag(), fakeTag()];

      // when
      final result = toLocalBook(remoteBook, localBookState, tags);

      // then
      expect(result, localBookFrom(remoteBook, localBookState, tags));
    });

    test('should set summary to none if it is empty', () {
      // given
      final remoteBook = fakeRemoteBook().copyWith(description: '');
      final localBookState = fakeLocalBookState();
      final tags = [fakeTag(), fakeTag()];

      // when
      final result = toLocalBook(remoteBook, localBookState, tags);

      // then
      expect(result.summary.isNone(), true);
    });

    test('should always set startDate to none', () {
      // given
      final remoteBook = fakeRemoteBook();
      final localBookState = fakeLocalBookState();
      final tags = [fakeTag(), fakeTag()];

      // when
      final result = toLocalBook(remoteBook, localBookState, tags);

      // then
      expect(result.startDate.isNone(), true);
    });

    test('should always set endDate to none', () {
      // given
      final remoteBook = fakeRemoteBook();
      final localBookState = fakeLocalBookState();
      final tags = [fakeTag(), fakeTag()];

      // when
      final result = toLocalBook(remoteBook, localBookState, tags);

      // then
      expect(result.endDate.isNone(), true);
    });
  });
}
