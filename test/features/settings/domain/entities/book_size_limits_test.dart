import 'package:homer/features/settings/domain/entities/book_size_limits.dart';
import 'package:test/test.dart';

void main() {
  group('asDoubleList', () {
    test('should return list of two doubles', () {
      // given
      final bookSizeLimits = BookSizeLimits(shortMax: 300, mediumMax: 500);

      // when
      final result = bookSizeLimits.asDoubleList();

      // then
      expect(result, [300.0, 500.0]);
    });
  });

  group('asIntList', () {
    test('should return list of two ints', () {
      // given
      final bookSizeLimits = BookSizeLimits(shortMax: 300, mediumMax: 500);

      // when
      final result = bookSizeLimits.asDoubleList();

      // then
      expect(result, [300, 500]);
    });
  });

  group('fromDoubleList', () {
    test('should create book size limits', () {
      // given
      final limits = [300.0, 500.0];

      // when
      final result = BookSizeLimits.fromDoubleList(limits);

      // then
      expect(result, BookSizeLimits(shortMax: 300, mediumMax: 500));
    });

    test('should throw assertion error with list longer than 2 elements', () {
      // given
      final limits = [300.0, 500.0, 100.0];

      // when
      sizeLimitsCreation() => BookSizeLimits.fromDoubleList(limits);

      // then
      expect(sizeLimitsCreation, throwsA(isA<AssertionError>()));
    });
  });

  group('isShort', () {
    test('should return true for pageCount smaller than shortMax', () {
      // given
      final limits = BookSizeLimits(shortMax: 300, mediumMax: 500);

      // when
      final result = limits.isShort(299);

      // then
      expect(result, true);
    });

    test('should return true for pageCount equal to shortMax', () {
      // given
      final limits = BookSizeLimits(shortMax: 300, mediumMax: 500);

      // when
      final result = limits.isShort(300);

      // then
      expect(result, true);
    });

    test('should return false for pageCount bigger than shortMax', () {
      // given
      final limits = BookSizeLimits(shortMax: 300, mediumMax: 500);

      // when
      final result = limits.isShort(301);

      // then
      expect(result, false);
    });
  });

  group('isMedium', () {
    test('should return false for pageCount smaller than shortMax', () {
      // given
      final limits = BookSizeLimits(shortMax: 300, mediumMax: 500);

      // when
      final result = limits.isMedium(299);

      // then
      expect(result, false);
    });

    test('should return false for pageCount equal to shortMax', () {
      // given
      final limits = BookSizeLimits(shortMax: 300, mediumMax: 500);

      // when
      final result = limits.isMedium(300);

      // then
      expect(result, false);
    });

    test(
        'should return true for pageCount bigger than shortMax but smaller than mediumMax',
        () {
      // given
      final limits = BookSizeLimits(shortMax: 300, mediumMax: 500);

      // when
      final result = limits.isMedium(301);

      // then
      expect(result, true);
    });

    test('should return true for pageCount equal to mediumMax', () {
      // given
      final limits = BookSizeLimits(shortMax: 300, mediumMax: 500);

      // when
      final result = limits.isMedium(500);

      // then
      expect(result, true);
    });

    test('should return false for pageCount bigger than mediumMax', () {
      // given
      final limits = BookSizeLimits(shortMax: 300, mediumMax: 500);

      // when
      final result = limits.isMedium(501);

      // then
      expect(result, false);
    });
  });
}
