import 'package:dartz/dartz.dart';
import 'package:homer/core/mappers/local_books_mapper.dart';
import 'package:homer/features/manage_books/data/models/local_book_dto.dart';
import 'package:homer/features/manage_books/domain/entities/local_book.dart';
import 'package:test/test.dart';

import '../../test_utils.dart';

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
        fakeLocalBookDTO(),
        fakeLocalBookDTO(),
      ];

      // when
      final result = toLocalBooks(input);

      // then
      expect(result, [
        localBookFromDTO(input[0]),
        localBookFromDTO(input[1]),
      ]);
    });

    test('should convert start date in millis to date', () {
      // given
      const dateInMillis = 1699281172000; // Monday, November 6, 2023 15:32:52
      final input = [fakeLocalBookDTO().copyWith(startDate: dateInMillis)];

      // when
      final result = toLocalBooks(input);

      // then
      expect(result.length, 1);
      expect(result[0].startDate, some(DateTime(2023, 11, 6, 15, 32, 52)));
    });

    test('should convert end date in millis to date', () {
      // given
      const dateInMillis = 1699281172000; // Monday, November 6, 2023 15:32:52
      final input = [fakeLocalBookDTO().copyWith(endDate: dateInMillis)];

      // when
      final result = toLocalBooks(input);

      // then
      expect(result.length, 1);
      expect(result[0].endDate, some(DateTime(2023, 11, 6, 15, 32, 52)));
    });

    test('should convert start date to none if it is zero', () {
      // given
      const dateInMillis = 0;
      final input = [fakeLocalBookDTO().copyWith(startDate: dateInMillis)];

      // when
      final result = toLocalBooks(input);

      // then
      expect(result.length, 1);
      expect(result[0].startDate.isNone(), true);
    });

    test('should convert end date to none if it is zero', () {
      // given
      const dateInMillis = 0;
      final input = [fakeLocalBookDTO().copyWith(endDate: dateInMillis)];

      // when
      final result = toLocalBooks(input);

      // then
      expect(result.length, 1);
      expect(result[0].endDate.isNone(), true);
    });

    test('should convert start date to none if it is zero', () {
      // given
      final input = [fakeLocalBookDTO().copyWithNull(startDate: true)];

      // when
      final result = toLocalBooks(input);

      // then
      expect(result.length, 1);
      expect(result[0].startDate.isNone(), true);
    });

    test('should convert end date to none if it is null', () {
      // given
      final input = [fakeLocalBookDTO().copyWithNull(endDate: true)];

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
      final input = [fakeLocalBook(), fakeLocalBook()];

      // when
      final result = toLocalBookDTOs(input);

      // then
      expect(result.length, 2);
      expect(result, [
        dtoFromLocalBook(input[0]),
        dtoFromLocalBook(input[1]),
      ]);
    });

    test('should convert none start date to 0', () {
      // given
      final input = [fakeLocalBook().copyWith(startDate: none())];

      // when
      final result = toLocalBookDTOs(input);

      // then
      expect(result.length, 1);
      expect(result[0].startDate, 0);
    });

    test('should convert none end date to 0', () {
      // given
      final input = [fakeLocalBook().copyWith(endDate: none())];

      // when
      final result = toLocalBookDTOs(input);

      // then
      expect(result.length, 1);
      expect(result[0].endDate, 0);
    });
  });
}
