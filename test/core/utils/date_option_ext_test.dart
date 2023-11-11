import 'package:dartz/dartz.dart';
import 'package:homer/core/utils/date_option_ext.dart';
import 'package:test/test.dart';

void main() {
  group('millisSinceEpoch', () {
    test('should return 0 when option is none', () {
      // given
      final Option<DateTime> date = none();

      // when
      final result = date.millisSinceEpoch();

      // then
      expect(result, 0);
    });

    test('should return millis since epoch when option is some', () {
      // given
      const dateInMillis = 1699281172000; // Monday, November 6, 2023 15:32:52
      final Option<DateTime> date = some(DateTime(2023, 11, 6, 15, 32, 52));

      // when
      final result = date.millisSinceEpoch();

      // then
      expect(result, dateInMillis);
    });
  });
}
