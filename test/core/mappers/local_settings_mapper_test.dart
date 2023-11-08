import 'dart:io';

import 'package:faker/faker.dart';
import 'package:homer/core/mappers/local_settings_mapper.dart';
import 'package:homer/features/settings/data/models/local_settings_dto.dart';
import 'package:homer/features/settings/domain/entities/book_size_limits.dart';
import 'package:homer/features/settings/domain/entities/local_settings.dart';
import 'package:test/test.dart';

void main() {
  group('toLocalSettings', () {
    test('should return LocalSettings', () {
      // given
      final isDarkThemeOn = faker.randomGenerator.boolean();
      final isSystemThemeOn = faker.randomGenerator.boolean();
      final directoryPath = faker.lorem.word();
      final backupsDirectory = Directory(directoryPath);
      const shortMax = 10;
      const mediumMax = 20;
      final bookSizeLimits = BookSizeLimits(
        shortMax: shortMax,
        mediumMax: mediumMax,
      );

      // when
      final result = toLocalSettings(
        isDarkThemeOn: isDarkThemeOn,
        isSystemThemeOn: isSystemThemeOn,
        backupsDirectory: backupsDirectory,
        bookSizeLimits: bookSizeLimits,
      );

      // then
      expect(
        result,
        LocalSettings(
          isSystemThemeOn: isSystemThemeOn,
          isDarkThemeOn: isDarkThemeOn,
          backupsDirectory: backupsDirectory,
          bookSizeLimits: bookSizeLimits,
        ),
      );
    });
  });

  group('toSettingsDTO', () {
    test('should return LocalSettingsDTO', () {
      // given
      final isDarkThemeOn = faker.randomGenerator.boolean();
      final isSystemThemeOn = faker.randomGenerator.boolean();
      final directoryPath = faker.lorem.word();
      final backupsDirectory = Directory(directoryPath);
      const shortMax = 10;
      const mediumMax = 20;
      final bookSizeLimits = BookSizeLimits(
        shortMax: shortMax,
        mediumMax: mediumMax,
      );
      final localSettings = LocalSettings(
        isSystemThemeOn: isSystemThemeOn,
        isDarkThemeOn: isDarkThemeOn,
        backupsDirectory: backupsDirectory,
        bookSizeLimits: bookSizeLimits,
      );

      // when
      final result = toSettingsDTO(localSettings);

      // then
      expect(
        result,
        LocalSettingsDTO(
          isSystemThemeOn: isSystemThemeOn,
          isDarkThemeOn: isDarkThemeOn,
          backupsDirectory: backupsDirectory,
          bookSizeLimits: bookSizeLimits,
        ),
      );
    });
  });
}
