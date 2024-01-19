import 'package:dartz/dartz.dart';
import 'package:homer/features/stats/domain/entities/books_per_month_data.dart';
import 'package:homer/features/stats/domain/entities/month_info.dart';
import 'package:test/test.dart';

import '../../../../test_utils/fakes.dart';

void main() {
  group('months', () {
    test('should return latest months when no data', () {
      // given
      final booksPerMonthData = BooksPerMonthData.empty();
      final latestMonths = _generateLatestMonths();

      // when
      final months = booksPerMonthData.months();

      // then
      expect(months, latestMonths);
    });

    test('should return last month infos filling holes', () {
      // given
      final booksPerMonthData = BooksPerMonthData({
        MonthInfo(2024, 1): 7,
        MonthInfo(2024, 4): 8,
      });

      // when
      final months = booksPerMonthData.months(last: some(MonthInfo(2024, 4)));

      // then
      expect(months, [
        MonthInfo(2023, 4),
        MonthInfo(2023, 5),
        MonthInfo(2023, 6),
        MonthInfo(2023, 7),
        MonthInfo(2023, 8),
        MonthInfo(2023, 9),
        MonthInfo(2023, 10),
        MonthInfo(2023, 11),
        MonthInfo(2023, 12),
        MonthInfo(2024, 1),
        MonthInfo(2024, 2),
        MonthInfo(2024, 3),
        MonthInfo(2024, 4),
      ]);
    });
  });

  group('bookCounts', () {
    test('should return latest book counts when no data is available', () {
      // given
      final booksPerMonthData = BooksPerMonthData.empty();

      // when
      final bookCounts = booksPerMonthData.bookCounts();

      // then
      expect(bookCounts, [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]);
    });

    test('should return latest book counts filling holes', () {
      // given
      final booksPerMonthData = BooksPerMonthData({
        MonthInfo(2024, 1): 7,
        MonthInfo(2024, 4): 8,
      });

      // when
      final months = booksPerMonthData.bookCounts(
        last: some(MonthInfo(2024, 4)),
      );

      // then
      expect(months, [0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 8]);
    });

    test('should return latest book counts sorted by year and month', () {
      // given
      final booksPerMonthData = BooksPerMonthData({
        // different year, month
        MonthInfo(2024, 1): 3,
        MonthInfo(2019, 2): 2,
        // same year
        MonthInfo(2023, 12): 9,
        MonthInfo(2023, 11): 7,
        // same month
        MonthInfo(2022, 2): 5,
        MonthInfo(2023, 2): 4,
      });

      // when
      final bookCounts = booksPerMonthData.bookCounts(
        last: some(MonthInfo(2024, 1)),
      );

      // then
      expect(bookCounts, [0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 7, 9, 3]);
    });
  });

  group('add', () {
    test('should add to book counts for book year and month', () {
      // given
      final booksPerMonthData = BooksPerMonthData.empty();
      final book1 = fakeBook().copyWith(endDate: some(DateTime(2024, 1)));
      final book2 = fakeBook().copyWith(endDate: some(DateTime(2023, 12)));
      expect(
        booksPerMonthData.bookCounts(last: some(MonthInfo(2024, 1))),
        [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
      );
      expect(booksPerMonthData.months(last: some(MonthInfo(2024, 1))), [
        MonthInfo(2023, 1),
        MonthInfo(2023, 2),
        MonthInfo(2023, 3),
        MonthInfo(2023, 4),
        MonthInfo(2023, 5),
        MonthInfo(2023, 6),
        MonthInfo(2023, 7),
        MonthInfo(2023, 8),
        MonthInfo(2023, 9),
        MonthInfo(2023, 10),
        MonthInfo(2023, 11),
        MonthInfo(2023, 12),
        MonthInfo(2024, 1),
      ]);

      // when
      final bpm = booksPerMonthData.add(book1).add(book1).add(book2);

      // then
      expect(
        bpm.bookCounts(last: some(MonthInfo(2024, 1))),
        [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 2],
      );
      expect(bpm.months(last: some(MonthInfo(2024, 1))), [
        MonthInfo(2023, 1),
        MonthInfo(2023, 2),
        MonthInfo(2023, 3),
        MonthInfo(2023, 4),
        MonthInfo(2023, 5),
        MonthInfo(2023, 6),
        MonthInfo(2023, 7),
        MonthInfo(2023, 8),
        MonthInfo(2023, 9),
        MonthInfo(2023, 10),
        MonthInfo(2023, 11),
        MonthInfo(2023, 12),
        MonthInfo(2024, 1),
      ]);
    });
  });

  group('remove', () {
    test('should decrement book counts for book year and month', () {
      // given
      final book1 = fakeBook().copyWith(endDate: some(DateTime(2024, 1)));
      final book2 = fakeBook().copyWith(endDate: some(DateTime(2023, 12)));
      var bpm = BooksPerMonthData.empty().add(book1).add(book1).add(book2);
      expect(
        bpm.bookCounts(last: some(MonthInfo(2024, 1))),
        [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 2],
      );
      expect(bpm.months(last: some(MonthInfo(2024, 1))), [
        MonthInfo(2023, 1),
        MonthInfo(2023, 2),
        MonthInfo(2023, 3),
        MonthInfo(2023, 4),
        MonthInfo(2023, 5),
        MonthInfo(2023, 6),
        MonthInfo(2023, 7),
        MonthInfo(2023, 8),
        MonthInfo(2023, 9),
        MonthInfo(2023, 10),
        MonthInfo(2023, 11),
        MonthInfo(2023, 12),
        MonthInfo(2024, 1),
      ]);

      // when
      bpm = bpm.remove(book1);

      // then
      expect(
        bpm.bookCounts(last: some(MonthInfo(2024, 1))),
        [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1],
      );
      expect(bpm.months(last: some(MonthInfo(2024, 1))), [
        MonthInfo(2023, 1),
        MonthInfo(2023, 2),
        MonthInfo(2023, 3),
        MonthInfo(2023, 4),
        MonthInfo(2023, 5),
        MonthInfo(2023, 6),
        MonthInfo(2023, 7),
        MonthInfo(2023, 8),
        MonthInfo(2023, 9),
        MonthInfo(2023, 10),
        MonthInfo(2023, 11),
        MonthInfo(2023, 12),
        MonthInfo(2024, 1),
      ]);
    });

    test('should leave month info even when book counts is zero', () {
      // given
      final book1 = fakeBook().copyWith(endDate: some(DateTime(2024, 1)));
      final book2 = fakeBook().copyWith(endDate: some(DateTime(2023, 12)));
      var bpm = BooksPerMonthData.empty().add(book1).add(book1).add(book2);
      expect(
        bpm.bookCounts(last: some(MonthInfo(2024, 1))),
        [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 2],
      );
      expect(bpm.months(last: some(MonthInfo(2024, 1))), [
        MonthInfo(2023, 1),
        MonthInfo(2023, 2),
        MonthInfo(2023, 3),
        MonthInfo(2023, 4),
        MonthInfo(2023, 5),
        MonthInfo(2023, 6),
        MonthInfo(2023, 7),
        MonthInfo(2023, 8),
        MonthInfo(2023, 9),
        MonthInfo(2023, 10),
        MonthInfo(2023, 11),
        MonthInfo(2023, 12),
        MonthInfo(2024, 1),
      ]);

      // when
      bpm = bpm.remove(book2);

      // then
      expect(
        bpm.bookCounts(last: some(MonthInfo(2024, 1))),
        [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2],
      );
      expect(bpm.months(last: some(MonthInfo(2024, 1))), [
        MonthInfo(2023, 1),
        MonthInfo(2023, 2),
        MonthInfo(2023, 3),
        MonthInfo(2023, 4),
        MonthInfo(2023, 5),
        MonthInfo(2023, 6),
        MonthInfo(2023, 7),
        MonthInfo(2023, 8),
        MonthInfo(2023, 9),
        MonthInfo(2023, 10),
        MonthInfo(2023, 11),
        MonthInfo(2023, 12),
        MonthInfo(2024, 1),
      ]);
    });
  });
}

List<MonthInfo> _generateLatestMonths() {
  var currentMonthInfo = MonthInfo.current();
  return List.generate(13, (index) {
    final curr = currentMonthInfo;
    currentMonthInfo = currentMonthInfo.previous();
    return curr;
  }).reversed.toList();
}
