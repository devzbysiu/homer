import 'package:dartz/dartz.dart';
import 'package:homer/core/utils/books_sort.dart';
import 'package:homer/features/manage_books/domain/entities/book.dart';
import 'package:test/test.dart';

import '../../test_utils.dart';

void main() {
  group('sortByStateAndDate', () {
    test('should return 0 empty list when empty list passed in', () {
      // given
      final List<Book> empty = List.empty();

      // when
      final result = sortByStateAndDate(empty);

      // then
      expect(result.isEmpty, true);
    });

    test('should reverse-sort "readLater" books', () {
      // given
      final book1 = fakeBook().copyWith(state: BookState.readLater);
      final book2 = fakeBook().copyWith(state: BookState.readLater);
      final book3 = fakeBook().copyWith(state: BookState.readLater);
      final books = [book1, book2, book3];

      // when
      final result = sortByStateAndDate(books);

      // then
      expect(result, [book3, book2, book1]);
    });

    test('should sort "reading" books by startDate', () {
      // given
      final book1 = fakeBook().copyWith(
        state: BookState.reading,
        startDate: some(DateTime(2023, 11, 1)),
      );
      final book2 = fakeBook().copyWith(
        state: BookState.reading,
        startDate: some(DateTime(2023, 11, 2)),
      );
      final book3 = fakeBook().copyWith(
        state: BookState.reading,
        // started reading it at the end, so it should be at the top of the list
        startDate: some(DateTime(2023, 11, 3)),
      );
      final books = [book1, book2, book3];

      // when
      final result = sortByStateAndDate(books);

      // then
      expect(result, [book3, book2, book1]);
    });

    test('should sort "read" books by endDate', () {
      // given
      final book1 = fakeBook().copyWith(
        state: BookState.read,
        endDate: some(DateTime(2023, 11, 1)),
      );
      final book2 = fakeBook().copyWith(
        state: BookState.read,
        endDate: some(DateTime(2023, 11, 2)),
      );
      final book3 = fakeBook().copyWith(
        state: BookState.read,
        // finished reading it at the end, so it should be at the top of the list
        endDate: some(DateTime(2023, 11, 3)),
      );
      final books = [book1, book2, book3];

      // when
      final result = sortByStateAndDate(books);

      // then
      expect(result, [book3, book2, book1]);
    });

    test(
        '"readLater" books should be at the beginning, then "reading" sorted by '
        'start date, then "read" sorted by end date', () {
      // given
      final readLaterBook1 = fakeBook().copyWith(
        state: BookState.readLater,
      );
      final readLaterBook2 = fakeBook().copyWith(
        state: BookState.readLater,
      );
      final readLaterBook3 = fakeBook().copyWith(
        state: BookState.readLater,
      );

      final readingBook1 = fakeBook().copyWith(
        state: BookState.reading,
        startDate: some(DateTime(2023, 11, 1)),
      );
      final readingBook2 = fakeBook().copyWith(
        state: BookState.reading,
        startDate: some(DateTime(2023, 11, 2)),
      );
      final readingBook3 = fakeBook().copyWith(
        state: BookState.reading,
        // started reading it at the end, so it should be at the top of the list
        startDate: some(DateTime(2023, 11, 3)),
      );

      final readBook1 = fakeBook().copyWith(
        state: BookState.read,
        endDate: some(DateTime(2023, 11, 1)),
      );
      final readBook2 = fakeBook().copyWith(
        state: BookState.read,
        endDate: some(DateTime(2023, 11, 2)),
      );
      final readBook3 = fakeBook().copyWith(
        state: BookState.read,
        // finished reading it at the end, so it should be at the top of the list
        endDate: some(DateTime(2023, 11, 3)),
      );

      final books = [
        readLaterBook1,
        readingBook1,
        readLaterBook2,
        readBook1,
        readingBook2,
        readLaterBook3,
        readBook2,
        readingBook3,
        readBook3,
      ];

      // when
      final result = sortByStateAndDate(books);

      // then
      expect(result, [
        readLaterBook3,
        readLaterBook2,
        readLaterBook1,
        readingBook3,
        readingBook2,
        readingBook1,
        readBook3,
        readBook2,
        readBook1,
      ]);
    });
  });
}
